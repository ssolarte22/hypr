-- =============================================================================
-- ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ 
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ 
-- █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║
-- ██║  ██║███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
-- =============================================================================

local mainMod = "SUPER"

-- Key Hint
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("~/.config/viegphunt/key_hints.sh"))

-- Launch Applications
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))

-- Window & Session Management
hl.bind(mainMod .. " + SHIFT + CTRL + Escape", hl.dsp.exit())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"))

hl.bind(mainMod .. " + F", hl.dsp.window.float())
hl.bind(mainMod .. " + J", function() hl.dispatch(hl.dsp.layout("togglesplit")) end)

-- Launchers & Scripts
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock --config /home/notsasby/.config/hypr/hyprlock.hl"))
hl.bind("ALT + Space", hl.dsp.exec_cmd("~/.config/viegphunt/app_launcher.sh"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("~/.config/viegphunt/emoji_launcher.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/viegphunt/clipboard_launcher.sh"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/viegphunt/wallpaper_select.sh"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/viegphunt/wallpaper_random.sh"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --freeze -o $HOME/Pictures/Screenshots"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces 1-10
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. tostring(i), function() hl.dispatch(hl.dsp.focus({ workspace = tostring(i) })) end)
end
hl.bind(mainMod .. " + 0", function() hl.dispatch(hl.dsp.focus({ workspace = "10" })) end)

-- Move active window to workspace 1-9
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + SHIFT + 0", function() hl.dispatch(hl.dsp.window.move_to_workspace({ workspace = "10" })) end)

hl.bind(mainMod .. " + SHIFT + 0", function() hl.dsp.window.move_to_workspace("10") end)
-- Workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
-- Mouse drag binds
-- Move window with mouse (mainMod + LMB)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Resize window with mouse (mainMod + RMB)
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia & Hardware keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("~/.config/hypr/toggle_mic.sh"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true })

-- Media keys & Lid Switch
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pausehyprlo"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
-- hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock --config /home/notsasby/.config/hypr/hyprlock.hl"))
-- Touchpad & Display
hl.bind("SUPER + P", hl.dsp.exec_cmd("~/.config/hypr/display_switch.sh"))

-- Touchpad toggle state variable
local touchpad_enabled = true
local touchpad_notification = {
    [false] = "Disabled",
    [true] = "Enabled"
}

hl.bind("XF86TouchpadToggle", function()
    touchpad_enabled = not touchpad_enabled
    hl.device({
        name = "asue1306:00-04f3:3284-touchpad",
        enabled = touchpad_enabled,
    })
    hl.notification.create({
        text = "Touchpad " .. touchpad_notification[touchpad_enabled],
        timeout = 2000,
        icon = 1,
        color = 0
    })
end)