-- {{{ Variable definitions
HOMEDIR = os.getenv("HOME")
CONFDIR = HOMEDIR .. "/.config/awesome"
THEMESDIR = CONFDIR .. "/theme/themes/"
THEMES = {"cybermeat", "default", "chairman", "nord", "zenburn", "gowob"}

--[[
local function getTheme()
    local file = io.open(CONFDIR .. "/theme/theme.conf", "r")
    io.input(file)
    local theme = io.read()
    io.close(file)

    for i = 1, #THEMES do if THEMES[i] == theme then return theme end end

    return "default"
end

THEME = getTheme()

local function changeTheme()
    local file = io.open(CONFDIR .. "/theme/theme.conf", "w")
    io.output(file)

    local index = {}
    for k, v in pairs(THEMES) do index[v] = k end
    local current_theme = index[THEME]

    if current_theme + 1 > #THEMES then current_theme = 0 end
    current_theme = current_theme + 1

    io.write(THEMES[current_theme])
    io.close(file)

    awesome.restart()
end

active_theme = THEMESDIR .. THEME
]]

return "nord" .. "/theme.lua"