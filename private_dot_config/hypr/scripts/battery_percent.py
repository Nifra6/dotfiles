"""Battery Monitor Module

This module provides functionality to monitor the battery status of a device,
    including the battery percentage and the remaining battery time.
    It uses the `psutil` library to fetch battery information.

Classes:
    BatteryTime: Represents the remaining battery time in a human-readable format.

Functions:
    get_battery_percentage(battery): Returns the battery percentage with an appropriate icon.
    get_time_left(battery): Returns the remaining battery time in a human-readable format.

Usage:
    Run the script with optional command-line arguments to get battery information.
    - No arguments: Prints the battery percentage.
    - "per", "percentage", or "percent": Prints the battery percentage.
    - "time": Prints the remaining battery time.

Example:
    python battery_monitor.py percent
    python battery_monitor.py time
"""

import sys
from typing import NamedTuple

import psutil


class BatteryTime:
    """A class to represent the remaining battery time in a human-readable format."""

    def __init__(self, seconds: int):
        """Initializes the BatteryTime object with the given number of seconds.

        Args:
            seconds: The total number of seconds remaining.
        """
        minutes = int(seconds / 60)
        hours = int(minutes / 60)
        self._days = int(hours / 24)
        self._hours = hours - self._days * 24
        self._minutes = minutes - (self._days * 24 + self._hours) * 60
        self._seconds = (
            seconds - ((self._days * 24 + self._hours) * 60 + self._minutes) * 60
        )

    def __str__(self) -> str:
        """Returns a string representation of the remaining battery time.

        Returns:
            A human-readable string representing the remaining battery time.
        """
        if self._days >= 1:
            time_left = f"{self._days} jours "
        else:
            time_left = ""
        if self._hours >= 1:
            time_left += f"{self._hours} h "
        if self._minutes >= 1:
            time_left += f"{self._minutes} min "
        return time_left


def get_battery_percentage(battery: NamedTuple) -> str:
    """Returns the battery percentage with an appropriate icon.

    Args:
        battery: The battery object from psutil.sensors_battery().

    Returns:
        A string representing the battery percentage and icon.
    """
    if battery:
        if battery.power_plugged:
            icon = "󰂄"
        else:
            percentage = int(battery.percent)
            icons = ("󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹")
            if 0 <= percentage <= 100:
                index = (percentage + 4) // 10
                icon = icons[index]
            else:
                icon = "󰂑"
        return f"{percentage}% {icon}"
    return ""


def get_time_left(battery: NamedTuple) -> str:
    """Returns the remaining battery time in a human-readable format.

    Args:
        battery: The battery object from psutil.sensors_battery().

    Returns:
        A string representing the remaining battery time.
    """
    if battery:
        if isinstance(battery.secsleft, int):
            return str(BatteryTime(battery.secsleft)) + "restant"
    return ""


if __name__ == "__main__":
    args = sys.argv
    match len(args):
        case 1:
            BATTERY = psutil.sensors_battery()
            print(get_battery_percentage(BATTERY))
        case 2:
            match args[1]:
                case "per" | "percentage" | "percent":
                    BATTERY = psutil.sensors_battery()
                    print(get_battery_percentage(BATTERY))
                case "time":
                    BATTERY = psutil.sensors_battery()
                    print(get_time_left(BATTERY))
        case _:
            raise ValueError("Too much arguments.")
