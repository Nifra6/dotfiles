# My Arch packages

## Essential / system packages

### core

`base` arch base package
`inetutils` have hostname command for example
`linux` kernel
`linux-headers`
`linux-firmware`
`make` builder utility
`man-db` man implementation
`man-pages` linux and posix man pages
`pkgconf` deps for some pkg, such as aur ones
`sudo` run as root

### extra

`intel-media-driver` driver for vaapi
`intel-ucode` cpu updates
`networkmanager` network connection manager (with CLI and TUI)
`pacman-contrib` useful utilities like pacman-diff (updates), checkupdates (waybar module)
`pass` stor password like git ones
`pkgstats` (optional) send anonymous package stats to arch project
`refind` boot manager
`vulkan-intel` vulkan driver for intel gpu
`zsh` shell

### aur

`yay` pacman wrapper with AUR

## Languages

`go` golang
`jre-openjdk` java runtime environment
`languagetool` natural language checker
`lua` lua
`npm` JavaScript package manager
`python` python environment
`python-black` python formatter
`python-isort` python import sorter
`python-pip` python package manager
`python-poetry` python dependency management
`python-pytorch` python tensors and neural networks
`tensorboard` tensorflow visualisation, work with pytorch

## Fonts & Themes

`noto-fonts-cjk` chinese, japanese, korean symbols
`noto-fonts-emoji` emoji
`papirus-icon-theme` icons for apps and tray
`ttf-jetbrains-mono-nerd` patched JetBrains Mono font
`ttf-nerd-fonts-symbols` symbols aggregator

## Utilities

`alsa-utils` sound kernel utilities
`blueman` bluetooth GUI with tray
`bluez-utils` bluetooth CLI
`brightnessctl` brightness control
`cups-pdf` printing drivers
`pulseaudio` sound server
`udiskie` automount

## Wayland compositor

### Main

`dunst` notifications
`grim` screenshot
`hypridle` sleep system
`hyprland` compositor
`hyprlock` lock system
`hyprpaper` wallpaper
`nwg-look` change icons and mouse cursor
`slurp` region selection (used with grim for example)
`waybar` status bar
`wireplumber` screensharing
`wl-clipboard` clipboard
`wleave-git` logout menu
`wlsunset` blue light filter
`wofi` launcher
`workstyle-git` change apps icons in status bar workspaces
`xdg-desktop-portal-gtk` filepicker dbus utility
`xdg-desktop-portal-hyprland` screen share dbus utility

### Nvidia

`libva-nvidia-driver-git`
`nvidia-dkms`
`qt5-wayland`
`qt5ct`
`qt6ct`

## Terminal applications

### CLI

`bat` cat drop-in replacement
`chezmoi` dotfiles manager
`fd` find drop-in replacement
`git` vcs
`lsd` ls drop-in replacement
`neofetch` system information viewer
`p7zip` archiver for .zip, .7z, .rar, ...
`playerctl` mpris media controller
`ripgrep` similar to grep, alias to rg
`wget` better download than curl
`yt-dlp` download audio and video from YouTube, Twitch ... Optional dependencies of `mpv`

### TUI

`btop` processor, memory and network viewer
`lazygit` git helper
`neovim` file editor and IDE
`ranger` file explorer

## Graphical applications

`amberol` music player
`chromium` web browser
`discord` social app
`feh` image viewer
`filelight` disk usage in pie form
`firefox` web browser
`kitty` terminal emulator
`libreoffice-fresh-fr` office suite, in French
`mpv` music and video player
`nemo` file explorer
`nm-connection-editor` GUI for connection creation & configuration (useful for vpn)
`pavucontrol` pulseaudio frontend to manage sound
`picard` sound file tagger (for metadata)
`pinta` paint.NET like
`qbittorrent` BitTorrent client
`signal-desktop` messaging app
`spotify` music streaming
`thunderbird` mail reader
`visual-studio-code-bin` IDE
`zathura` document viewer with vi bindings
`zotero-bin` scientific biblio and article reader with annotations

## Gaming

`lutris` launcher/installer for many games, including Epic, steam, ...
`steam` steam client
`gamescope` can help with games on hyprland
`wine` windows emulator

## Plugins

`cinnamon-translations` nemo translation
`conda-zsh-completion` conda auto complete for zsh
`firefox-i18n-fr` French language for firefox
`mpv-mpris` use playerctl with mpv
`networkmanager-openconnect` plugin for Cisco vpn
`pulseaudio-alsa` plugin to manage `alsa`
`pulseaudio-bluetooth` plugin to support bluetooth with `bluez`
`thunderbird-i18n-fr` French language for thunderbird
`zathura-pdf-mupdf` enable PDF, ePub & OpenXPS on `zathura`
`zsh-autosuggestions` fish-like autosuggestions
`zsh-syntax-highlighting` fish-like syntax highlighting

## Removed

### Was installed but I don't know why

fcitx
lib32-giflib
lib32-libpulse
lib32-libxslt
lib32-openal
libc++
libclc
libcryptui

### Can be useful ... maybe

exfat-utils
chrony
autoconf
automake

### Can be wine deps ?

lib32-gnutls
lib32-libxcomposite
lib32-libxinerama
lib32-ocl-icd
lib32-v4l-utils
