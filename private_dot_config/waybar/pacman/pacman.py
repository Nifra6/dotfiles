import subprocess
import sys 
import json
import time


def check_updates():
    try:
        output = subprocess.check_output(["checkupdates"], universal_newlines=True)
        updates = output.strip().split('\n')
        return updates
    except subprocess.CalledProcessError as e:
        return []


def write_output(packages):
    nb_packages = len(packages)
    match nb_packages:
        case 0:
            output_text = 'À jour'
            output_class = 'good'
            output_alt = 'uptodate'
        case 1:
            output_text = '1 paquet disponible'
            output_class = 'info'
            output_alt = 'available'
        case _:
            output_text = f'{nb_packages} paquets disponibles'
            output_class = 'info'
            output_alt = 'available'
    output = {'text': output_text,
              'class': output_class,
              'alt': output_alt}
    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()


if __name__ == "__main__":
    updates = check_updates()
    write_output(updates)

