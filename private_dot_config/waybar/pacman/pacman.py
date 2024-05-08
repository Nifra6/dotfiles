import json
import subprocess
import sys


def check_updates():
    try:
        output = subprocess.check_output(
            ["checkupdates", "--nocolor"], universal_newlines=True
        )
        updates = output.strip().split("\n")
        return updates
    except subprocess.CalledProcessError:
        return []


def write_output(packages):
    nb_packages = len(packages)
    match nb_packages:
        case 0:
            output_text = ""
            output_alt = "uptodate"
            output_tooltip = ""
            output_class = "good"
        case 1:
            output_text = "  1 paquet disponible"
            output_alt = "available"
            output_tooltip = packages[0]
            output_class = "info"
        case _:
            output_text = f"  {nb_packages} paquets disponibles"
            output_alt = "available"
            output_tooltip = "\n".join(packages)

            output_class = "info"
    output = {
        "text": output_text,
        "alt": output_alt,
        "tooltip": output_tooltip,
        "class": output_class,
    }
    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()


if __name__ == "__main__":
    updates = check_updates()
    write_output(updates)
