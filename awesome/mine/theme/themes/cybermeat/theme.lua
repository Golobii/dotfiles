-----------------------------------------------------------
--  cybermeat awesome theme                               --
--    by bone3ye		                                --
--    based on github.com/z1lt0id                        --
--    or deviantart.com/f-s0ciety                        --
-----------------------------------------------------------


--NOTES
--Menu Opacity is tuned for use with compton. In compton.conf, set menu opacity to 0.85 or so.

-- {{{ Main
theme = {}

themes_dir 		= os.getenv("HOME") .. "/.config/awesome/themes/cybermeat"
theme.wallpaper = themes_dir .. "/pixel-city.gif"
-- }}}

-- {{{ Styles
theme.font		= "DroidSansMono 10"

-- {{{ Colors
theme.fg_normal  = "#ffffff"
theme.fg_focus   = "#303030"
theme.fg_urgent  = "#ffffff"
theme.bg_normal  = "#263238"
theme.bg_focus   = "#C13356"
theme.bg_urgent  = "#263238"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 0.5
theme.border_normal = "#CC9393" --263238
theme.border_focus  = "#000000"
theme.border_marked = "#CC9393"

client.connect_signal("focus", function(c) c.border_color = "#ffffff" end)
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#263238"
theme.titlebar_bg_normal = "#263238"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- TAGLIST --
--theme.taglist_bg_empty = "png:".. themes_dir .. "/taglist/bg_unsel.png"
--theme.taglist_bg_occupied = "png:".. themes_dir .. "/taglist/bg_unsel.png"
--theme.taglist_bg_urgent = "png:" ..themes_dir .. "/taglist/bg_urgent.png"
theme.taglist_bg_focus = "png:".. themes_dir .. "/taglist/taglist_bg_sel.png"
theme.taglist_fg_focus = "#ffffff"

theme.tasklist_bg_focus = "png:".. themes_dir .. "/taglist/tasklist_sel.png"
theme.tasklist_fg_focus = "#ffffff"
theme.tasklist_fg_normal = "#ffffff"

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#263238"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 24
theme.menu_width  = 120
theme.menu_bg_normal  = "#263238"
theme.menu_border_color  = "#263238"
theme.menu_border_width = 0

-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_dir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_dir .. "/taglist/squarez.png"
--theme.taglist_squares_resize = false

-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_dir .. "/icons/awesome-icon.png"
theme.awesome_icon16		 = themes_dir .. "/icons/awesome-icon16.png"
theme.menu_submenu_icon      = themes_dir .. "/icons/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_dir .. "/layouts/tile.png"
theme.layout_tileleft   = themes_dir .. "/layouts/tileleft.png"
theme.layout_tilebottom = themes_dir .. "/layouts/tilebottom.png"
theme.layout_tiletop    = themes_dir .. "/layouts/tiletop.png"
theme.layout_fairv      = themes_dir .. "/layouts/fairv.png"
theme.layout_fairh      = themes_dir .. "/layouts/fairh.png"
theme.layout_spiral     = themes_dir .. "/layouts/spiral.png"
theme.layout_dwindle    = themes_dir .. "/layouts/dwindle.png"
theme.layout_max        = themes_dir .. "/layouts/max.png"
theme.layout_fullscreen = themes_dir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themes_dir .. "/layouts/magnifier.png"
theme.layout_floating   = themes_dir .. "/layouts/floating.png"
-- }}}

return theme
