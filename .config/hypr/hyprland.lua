-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- HYPRLAND MAIN CONFIGURATION                           --
-- Orchestrates the required sub-modules.                --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 1. Base Environment and System Config
require("env")
require("monitors")
require("permissions")

-- 2. Applications and Startup
require("programs") -- Defines global application variables
require("autostart")

-- 3. Visuals and Animations
require("look_and_feel")
require("animations")

-- 4. Behavior, Input, and Layouts
require("misc")

-- 5. Window Rules
require("rules")

-- Plugin Configurations
require("plugins")

-- 6. Keybindings (loads variables defined in programs.lua)
require("keybinds")

