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

    def __init__(self, seconds=int):
        """Calculates the time units (days, hours, minutes,seconds) after initialization."""
        self._days = seconds // 86400
        self._hours = (seconds % 86400) // 3600
        self._minutes = (seconds % 3600) // 60
        self._seconds = seconds % 60

    @property
    def days(self):
        """Returns the number of days."""
        return self._days

    @property
    def hours(self):
        """Returns the number of hours."""
        return self._hours

    @property
    def minutes(self):
        """Returns the number of minutes."""
        return self._minutes

    @property
    def seconds(self):
        """Returns the number of remaining seconds."""
        return self._seconds

    def __str__(self) -> str:
        """Returns a string representation of the remaining battery time.

        Returns:
            A human-readable string representing the remaining battery time.
        """
        match self._days:
            case 0:
                time_left = ""
            case 1:
                time_left = f"{self._days} jour "
            case _:
                time_left = f"{self._days} jours "
        if self._hours >= 1:
            time_left += f"{self._hours} h "
        if self._minutes >= 1:
            time_left += f"{self._minutes} min "
        if self._minutes > 1 or (self._minutes == 0 and self._hours > 1):
            time_left += "restantes"
        elif self._minutes == 0 and self._hours == 0 and self._days > 1:
            time_left += "restants"
        elif self._minutes == 1 or (self._minutes == 0 and self._hours == 1):
            time_left += "restante"
        else:
            time_left += "restant"
        return time_left


def get_battery_percentage(battery: NamedTuple) -> str:
    """Returns the battery percentage with an appropriate icon.

    Args:
        battery: The battery object from psutil.sensors_battery().

    Returns:
        A string representing the battery percentage and icon.
    """
    if battery:
        percentage = int(battery.percent)
        if battery.power_plugged:
            icon = "󰂄"
        else:
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
    if battery and not battery.power_plugged and isinstance(battery.secsleft, int):
        return BatteryTime(battery.secsleft)
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
