#!/usr/bin/env python3
"""Vérifie l'état de pause de dunst et écrit un statut JSON pour waybar."""

import json
import subprocess
import sys


def main() -> None:
    """Affiche le statut actuel de dunst."""
    try:
        output = subprocess.check_output(
            ["dunstctl", "is-paused"],  # noqa: S607
            universal_newlines=True,
        )

    except subprocess.CalledProcessError:
        return

    match output:
        case "true\n":
            output_tooltip = "Notifications en pause"
            output_alt = "paused"
        case "false\n":
            output_tooltip = "Notifications visibles"
            output_alt = "running"
        case _:
            msg = f"Problème avec dunst, on obtient :'{output}'."
            raise RuntimeError(msg)

    output = {"alt": output_alt, "tooltip": output_tooltip}

    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()


if __name__ == "__main__":
    main()
