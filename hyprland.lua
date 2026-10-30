-- ==============================================================================
--  ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ 
--  ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
--  ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
--  ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
--  ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
--  ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 
-- ==============================================================================

-- Ensure Lua can find modules located in ~/.config/hypr/conf/
local config_dir = os.getenv("HOME") .. "/.config/hypr/?"
package.path = package.path .. ";" .. config_dir .. ".lua;" .. config_dir .. "/init.lua"

-- 1. Variables & Global Programs (Load first so keybindings can access them)
require("conf.programs")

-- 2. Environment Variables & System Settings
require("conf.environment")

-- 3. Hardware & Displays
require("conf.monitors")
require("conf.workspaces")
require("conf.input")

-- 4. Visuals & Layouts
require("conf.appearance")
require("conf.animation")
require("conf.layout")
require("conf.misc")

-- 5. Window & Layer Rules
require("conf.windowrule")

-- 6. Keybindings & Shortcuts
require("conf.keybinding")

-- 7. Autostart Applications
require("conf.autostart")