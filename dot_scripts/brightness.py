import subprocess
import sys


def get_brightness() -> int:
    """Get the current brightness percentage of the screen."""
    max_brightness = int(subprocess.check_output(["brightnessctl", "m"]))
    current_brightness = int(subprocess.check_output(["brightnessctl", "g"]))
    brightness_percentage = int(100 * current_brightness / max_brightness)
    return brightness_percentage


def adjust_brightness(action: str) -> None:
    """Adjust the screen brightness based on the given action.

    Args:
        action (str): The action to perform. Either '+' to increase brightness or '-' to decrease it.
    """
    brightness_percentage = get_brightness()

    if action == "-":
        # Decrease brightness
        if brightness_percentage > 50:
            new_brightness = 10
        elif brightness_percentage > 5:
            new_brightness = 5
        elif brightness_percentage > 1:
            new_brightness = 1
        elif brightness_percentage == 1:
            subprocess.run(["brightnessctl", "s", "1"])
            return
        else:
            return
    elif action == "+":
        # Increase brightness
        if brightness_percentage < 5:
            new_brightness = 1
        elif brightness_percentage < 50:
            new_brightness = 5
        else:
            new_brightness = 10
    else:
        return

    # Apply the new brightness setting
    subprocess.run(["brightnessctl", "s", f"{new_brightness}%{action}"])


if __name__ == "__main__":
    if len(sys.argv) != 2 or sys.argv[1] not in ["+", "-"]:
        print("Usage: python brightness.py [+/-]")
        sys.exit(1)

    adjust_brightness(sys.argv[1])
