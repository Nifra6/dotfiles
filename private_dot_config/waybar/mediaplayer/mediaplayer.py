#!/usr/bin/env python3
import json
import logging
import signal
import sys

import gi

gi.require_version("Playerctl", "2.0")
from gi.repository import GLib, Playerctl

logger = logging.getLogger(__name__)


def write_output(text, player):
    logger.info("Writing output")

    output = {
        "text": text,
        "class": "custom-" + player.props.player_name,
        "alt": player.props.player_name,
    }

    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()


def on_play(player, status, manager):
    logger.info("Received new playback status")
    on_metadata(player, player.props.metadata, manager)


def on_metadata(player, metadata, manager):
    logger.info("Received new metadata")
    track_info = ""

    if player.props.player_name == "mpv":
        track_info = player.get_title()
    elif player.props.player_name == "spotify" and (
        "mpris:trackid" in metadata.keys()
        and ":ad:" in player.props.metadata["mpris:trackid"]
        or "xesam:url" in metadata.keys()
        and "/ad/" in player.props.metadata["xesam:url"]
    ):
        track_info = "Publicité"
    elif (
        player.props.player_name == "firefox"
        and "xesam:title" in metadata.keys()
        and "Twitch" in player.props.metadata["xesam:title"]
    ):
        track_info = "󰕃 " + player.get_title().replace(" - Twitch", "")
    elif player.get_artist() != "" and player.get_title() != "":
        track_info = "{artist} - {title}".format(
            artist=player.get_artist(), title=player.get_title()
        )
    else:
        track_info = player.get_title()

    if player.props.status != "Playing" and track_info:
        track_info = " " + track_info
    write_output(track_info, player)


def on_player_appeared(manager, player, selected_player=None):
    if player is not None and (
        selected_player is None or player.name == selected_player
    ):
        init_player(manager, player)
    else:
        logger.debug("New player appeared, but it's not the selected player, skipping")


def on_player_vanished(manager, player):
    logger.info("Player has vanished")
    sys.stdout.write("\n")
    sys.stdout.flush()


def init_player(manager, name):
    logger.debug("Initialize player: {player}".format(player=name.name))
    player = Playerctl.Player.new_from_name(name)
    player.connect("playback-status", on_play, manager)
    player.connect("metadata", on_metadata, manager)
    manager.manage_player(player)
    on_metadata(player, player.props.metadata, manager)


def signal_handler(sig, frame):
    logger.debug("Received signal to stop, exiting")
    sys.stdout.write("\n")
    sys.stdout.flush()
    # loop.quit()
    sys.exit(0)


def main():

    # Initialize logging
    logging.basicConfig(
        stream=sys.stderr,
        level=logging.DEBUG,
        format="%(name)s %(levelname)s %(message)s",
    )

    manager = Playerctl.PlayerManager()
    loop = GLib.MainLoop()

    manager.connect("name-appeared", lambda *args: on_player_appeared(*args))
    manager.connect("player-vanished", on_player_vanished)

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    for player in manager.props.player_names:
        init_player(manager, player)

    loop.run()


if __name__ == "__main__":
    main()
