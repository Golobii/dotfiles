local awful = require("awful")

awful.spawn.with_shell("picom")
awful.spawn.with_shell("nm-applet")
awful.spawn.with_shell("xscreensaver --no-splash")