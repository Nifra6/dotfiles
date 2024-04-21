import json

import requests


def get_weather_text(location="Nancy"):
    url = f"https://wttr.in/{location}?m&lang=fr&format=1"
    response = requests.get(url)
    if response.status_code == 200:
        return response.text.strip()
    else:
        return None


def get_weather_tooltip(location="Nancy"):
    url = f"https://wttr.in/{location}?QT2&lang=fr"
    response = requests.get(url)
    if response.status_code == 200:
        tooltip_lines = response.text.splitlines()
        # Remove the first 5 lines and the last 2 lines
        tooltip_lines = tooltip_lines[5:-2]
        tooltip = "\n".join(tooltip_lines)
        return tooltip
    else:
        return None


def main():
    weather_text = get_weather_text()
    weather_tooltip = get_weather_tooltip()

    if weather_text and weather_tooltip:
        data = {
            "text": weather_text,
            "tooltip": weather_tooltip,
        }
        json_data = json.dumps(data, ensure_ascii=False)
        print(json_data)
    else:
        print("Error: Unable to retrieve weather information.")


if __name__ == "__main__":
    main()
