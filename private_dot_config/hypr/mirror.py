import re
import subprocess


def get_monitor_names(main_monitor_id: int = 0) -> list[str]:
    result = subprocess.run(
        ["hyprctl", "monitors"],
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )

    output = result.stdout
    split_lines = output.split("\n")
    monitor_lines = [line for line in split_lines if line.startswith("Monitor")]
    other_monitors = []
    for line in monitor_lines:
        id_start = line.index("(ID ") + 4
        id_end = line.index("):", id_start)
        id_value = int(line[id_start:id_end].strip())

        if id_value != main_monitor_id:
            words = line.split()
            if len(words) > 1:
                other_monitors.append(words[1])
        else:
            words = line.split()
            if len(words) > 1:
                main_monitor = words[1]
    if other_monitors:
        return extract_monitor_info(output, other_monitors, main_monitor)
    return None


def extract_monitor_info(input_str: str, monitor_list: list[str], main_monitor: str):
    monitor_blocks = re.findall(
        r"(Monitor \S+ \(ID \d+\):[\s\S]*?)(?=Monitor \S+ \(ID \d+\):|$)", input_str
    )

    results = []

    for block in monitor_blocks:
        # Extraire le nom du moniteur
        name_match = re.search(r"Monitor (\S+) \(ID \d+\):", block)
        name = name_match.group(1) if name_match else "unknown"

        # Vérifier si le moniteur est dans la liste des moniteurs à regarder
        if name in monitor_list:
            # Extraire la résolution
            resolution_match = re.search(r"(\d+x\d+@\d+\.\d+)", block)
            resolution = resolution_match.group(1) if resolution_match else "unknown"

            # Extraire la position
            position_match = re.search(r"at (\d+x\d+)", block)
            position = position_match.group(1) if position_match else "unknown"

            # Extraire l'échelle
            scale_match = re.search(r"scale: (\d+\.\d+)", block)
            scale = scale_match.group(1) if scale_match else "unknown"

            mirror = "mirror"

            # Formater la chaîne de sortie
            result = (
                f"{name}, {resolution}, {position}, {scale}, {mirror}, {main_monitor}"
            )
            results.append(result)

    return results


def check_if_mirrored(main_monitor_id: int = 0) -> bool:
    result = subprocess.run(
        ["hyprctl", "monitors", "all"],
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )
    output = result.stdout
    return f"mirrorOf: {main_monitor_id}" in output


def apply_mirror(main_monitor_id: int = 0) -> None:
    commands = get_monitor_names()
    if commands:
        for cmd in commands:
            _ = subprocess.run(
                ["hyprctl", "keyword", "monitor", cmd],
                check=True,
                stdout=subprocess.PIPE,
                text=True,
            )
        _ = subprocess.run(
            ["dunstify", "-u", "low", "Mode mirroir", "L'écran principal est partagé."],
            check=True,
            stdout=subprocess.PIPE,
            text=True,
        )
    else:
        _ = subprocess.run(
            ["dunstify", "-u", "low", "Mode mirroir", "Aucun autre écran."],
            check=True,
            stdout=subprocess.PIPE,
            text=True,
        )


def remove_mirror():
    _ = subprocess.run(
        ["hyprctl", "reload"],
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )
    _ = subprocess.run(
        ["pkill", "waybar"],
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )
    _ = subprocess.run(
        ["hyprctl", "keyword", "exec", "waybar"],
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )
    _ = subprocess.run(
        ["dunstify", "-u", "low", "Mode mirroir", "Le partage est désactivé."],
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )


def main(main_monitor_id: int = 0):
    if check_if_mirrored(main_monitor_id):
        remove_mirror()
    else:
        apply_mirror(main_monitor_id)


if __name__ == "__main__":
    MAIN_MONITOR_ID = 0
    main(MAIN_MONITOR_ID)
