#!/usr/bin/env python3
"""Check package updates and write JSON output for waybar."""

import json
import subprocess
import sys


def check_updates() -> list[str]:
    """Check package updates.

    Return:
        The list of updates available.
    """
    try:
        output = subprocess.check_output(
            ["checkupdates", "--nocolor"],  # noqa: S607
            universal_newlines=True,
            timeout=60,
        )
        return output.strip().split("\n")
    except subprocess.CalledProcessError:
        return []


def write_output(packages: list[str]) -> None:
    """Write the pending updates as a JSON for waybar."""
    nb_packages = len(packages)
    match nb_packages:
        case 0:
            output_text = ""
            output_alt = "uptodate"
            output_tooltip = ""
        case 1:
            output_text = "  1 paquet disponible"
            output_alt = "available"
            output_tooltip = packages[0]
        case _:
            output_text = f"  {nb_packages} paquets disponibles"
            output_alt = "available"
            output_tooltip = "\n".join(packages)
    output = {"text": output_text, "alt": output_alt, "tooltip": output_tooltip}
    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()


if __name__ == "__main__":
    write_output(check_updates())
