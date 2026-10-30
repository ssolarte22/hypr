-- ==============================================================================
--  █████╗ ██╗   ██╗████████╗ ██████╗ ███████╗████████╗ █████╗ ██████╗ ████████╗
-- ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝
-- ███████║██║   ██║   ██║   ██║   ██║███████╗   ██║   ███████║██████╔╝   ██║   
-- ██╔══██║██║   ██║   ██║   ██║   ██║╚════██║   ██║   ██╔══██║██╔══██╗   ██║   
-- ██║  ██║╚██████╔╝   ██║   ╚██████╔╝███████║   ██║   ██║  ██║██║  ██║   ██║   
-- ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
-- ==============================================================================

hl.on("hyprland.start", function()
    -- Core Bar & Notifications
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("awww-daemon & sleep 0.5 & awww init")
    hl.exec_cmd("nm-applet --indicator")

    -- Setup fcitx5
    hl.exec_cmd("fcitx5 -d")

    -- Setup hyprlock
    -- Setup hyprlock
hl.exec_cmd("hyprlock --config /home/notsasby/.config/hypr/hyprlock.hl")

    -- Setup screen sharing
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Setup clipboard
    hl.exec_cmd("cliphist wipe")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Setup keyring
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")

    -- Setup themes
    hl.exec_cmd("~/.config/viegphunt/gtkthemes.sh")

    -- Setup hypridle
    hl.exec_cmd("hypridle")

    -- 1. Force the microphone to start MUTED at boot
    hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1")

    -- 2. Force the hardware LED light to turn ON at boot
    hl.exec_cmd('brightnessctl -d "platform::micmute" set 1')

    -- Monitor watcher
    hl.exec_cmd("~/.config/hypr/monitor_watcher.sh")
end)