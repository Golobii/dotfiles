-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")

require("collision")()

-- Themes define colours, icons, font and wallpapers.
-- gears.filesystem.get_themes_dir() .. "default/theme.lua"
beautiful.init(require("theme"))
terminal = "st"

-- Keybinds
require("config.keys")

-- Configurations
require("config.client")
require("config.layouts")
require("config.autostart")

-- Modules

-- Desktop layout
require("layout")
