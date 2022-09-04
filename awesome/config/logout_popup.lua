local awful = require("awful")

local user = os.getenv("USER")

local lock_cmd = function ()
    awful.spawn.with_shell("xscreensaver-command -lock")
end

local phrases = {
    "exit(0)",
    user .. " logging off",
    "Bye, " .. user,
    "Fucking finally...",
    "Bye bye",
    "Now go do something useful.",
    "Enough for today."
}

return {
    phrases = phrases,
    onlock = lock_cmd
}