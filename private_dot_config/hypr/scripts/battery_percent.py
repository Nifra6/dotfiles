import psutil


class BatteryTime:
    def __init__(self, seconds: int):
        minutes = int(seconds / 60)
        hours = int(minutes / 60)
        self._days = int(hours / 24)
        self._hours = hours - self._days * 24
        self._minutes = minutes - (self._days * 24 + self._hours) * 60
        self._seconds = (
            seconds - ((self._days * 24 + self._hours) * 60 + self._minutes) * 60
        )

    def __str__(self):
        if self._days >= 1:
            time_left = f"{self._days} jours "
        else:
            time_left = ""
        if self._hours >= 1:
            time_left += f"{self._hours} heures "
        if self._minutes >= 1:
            time_left += f"{self._minutes} minutes "
        if self._seconds >= 1:
            time_left += f"{self._seconds} secondes"
        return time_left


def get_battery_percentage(battery):
    if battery:
        percentage = int(battery.percent)
        if 0 <= percentage < 5:
            icon = "󰂎"
        elif 5 <= percentage < 15:
            icon = "󰁺"
        elif 15 <= percentage < 25:
            icon = "󰁻"
        elif 25 <= percentage < 35:
            icon = "󰁼"
        elif 35 <= percentage < 45:
            icon = "󰁽"
        elif 45 <= percentage < 55:
            icon = "󰁾"
        elif 55 <= percentage < 65:
            icon = "󰁿"
        elif 65 <= percentage < 75:
            icon = "󰂀"
        elif 75 <= percentage < 85:
            icon = "󰂁"
        elif 85 <= percentage < 95:
            icon = "󰂂"
        elif 95 <= percentage <= 100:
            icon = "󰁹"
        if battery.power_plugged:
            icon = "󰂄"
            return f"{icon} {percentage}%"
        return f"{icon} {percentage}%"
    else:
        return ""


def get_time_left(battery):
    if battery:
        if type(battery.secsleft) is int:
            return "\n󰥔 " + str(BatteryTime(battery.secsleft))
        return ""


if __name__ == "__main__":
    BATTERY = psutil.sensors_battery()
    # print("Coucou")
    print(get_battery_percentage(BATTERY))
