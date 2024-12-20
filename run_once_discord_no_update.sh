#!/bin/sh

CONFIG_DIR="$HOME/.config/discord"
SETTINGS_FILE="$CONFIG_DIR/settings.json"

mkdir -p "$CONFIG_DIR"
cat > "$SETTINGS_FILE" <<EOL
{
  "SKIP_HOST_UPDATE": true
}
EOL
