-- Monitors
------------------------------
hl.monitor({
	output = "",
	mode = "1920x1080",
	position = "auto",
	scale = "1",
})

-- My programs
------------------------------
local terminal = "ghostty"
local commandsMenu = "wofi --show run --allow-images"
local appsMenu = "wofi --show drun --allow-images"
local exitMenu = "wleave"
local webBrowser = "brave"
local fileManager = "nautilus"
local clipboard = "cliphist list | wofi --dmenu | cliphist decode | wl-copy"

-- Autostart
------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("discord", { workspace = 1 })
	hl.exec_cmd("thunderbird", { workspace = 6 })
	hl.exec_cmd("protonmail-bridge", { workspace = 7 })
	hl.exec_cmd("hypridle & awww-daemon & waybar & dunst")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("blueman-applet & blueman-tray & rfkill unblock bluetooth")
	hl.exec_cmd("udiskie --tray")
	hl.exec_cmd("wlsunset -l 48.41 L 6.11")
	hl.exec_cmd("hyprctl setcursor 'Capitaine Cursors' 40")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- Environment variables
------------------------------
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XCURSOR_SIZE", "40")
hl.env("XCURSOR_THEME", "Capitaine Cursors")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("LANG", "fr_FR.UTF-8")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "x11")

-- Hyprland specific config
------------------------------
hl.config({
	-- Look and feel
	general = {
		border_size = 3,
		gaps_in = 8,
		gaps_out = 8,
		col = {
			active_border = {
				colors = { "rgba(00b3b3ee)", "rgba(e365c5ee)" },
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 12,
		shadow = { enabled = false },
		blur = { enabled = false },
	},
	animations = { enabled = true },
	dwindle = { force_split = 2 },
	misc = { force_default_wallpaper = 0 },
	-- Inputs
	input = {
		kb_layout = "fr",
		numlock_by_default = true,
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = { natural_scroll = true },
	},
})

-- Animations
------------------------------
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Keybindings
------------------------------
local mainMod = "SUPER"
-- System
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(appsMenu))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd(commandsMenu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(exitMenu))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(webBrowser))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("python $HOME/.config/hypr/scripts/mirror.py"))
-- Sound
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + ALT + M",
	hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("playerctl play-pause"))
-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("grim -g '$(slurp -d -b BD00FF10)' - | wl-copy -t image/png"))
-- Applications
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
-- Move window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- Move workspace to another monitor
hl.bind(mainMod .. " + M", hl.dsp.window.move({ monitor = "+1" }))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
local azerty_keys = {
	"ampersand",
	"eacute",
	"quotedbl",
	"apostrophe",
	"parenleft",
	"minus",
	"egrave",
	"underscore",
	"ccedilla",
	"agrave",
}
for i = 1, 10 do
	local key = azerty_keys[i]
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Submap: resize
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Windows and workspaces
------------------------------
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})
hl.window_rule({
	name = "discord-start",
	match = { class = "discord" },
	workspace = 1,
})
hl.window_rule({
	name = "Brave-media-popup",
	match = { title = "^Mode PIP (Picture-in-Picture)$" },
	float = true,
	size = { 320, 180 },
})
hl.window_rule({
	name = "Steam-float",
	match = { class = "steam" },
	float = true,
})
hl.window_rule({
	name = "Steam-tile",
	match = { class = "steam", initial_title = "Steam" },
	tile = true,
})
hl.window_rule({
	name = "Steam-games-fullscreen",
	match = { class = "steam_app_*" },
	fullscreen = true,
})
hl.window_rule({
	name = "Zotero-progress-popup",
	match = { class = "Zotero", title = "Progress" },
	float = true,
})
