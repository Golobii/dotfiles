local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local icons = require("theme.icons")

local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")

local tags = {
	{
		type   = 'terminal',
		icon   = icons.terminal,
        layout = awful.layout.suit.tile,
	},
    {
        type   = 'code',
        icon   = icons.code,
        layout = awful.layout.suit.tile,
    },
	{
		type   = 'internet',
		icon   = icons.internet,
        layout = awful.layout.suit.max,
	},
	{
		type   = 'media',
		icon   = icons.media,
        layout = awful.layout.suit.tile,
	},
	{
		type   = 'games',
		icon   = icons.games,
        layout = awful.layout.suit.max,
	},
	{
		type   = 'social',
		icon   = icons.social,
        layout = awful.layout.suit.max,
	},
}

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

local separator_l = wibox.widget.textbox(" [ ")
local separator_r = wibox.widget.textbox(" ] ")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    require("module.wallpaper")(s)

    for i, tag in pairs(tags) do
        awful.tag.add(
            i,
            {
                icon = tag.icon,
                icon_only = true,
                layout = tag.layout,
                gap_single_client = true,
                gap = 5,
                screen = s,
                selected = i == 1
            }
        )
    end


    -- awful.tag({ "1", "2", "3", "4", "5", "ﭮ" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            separator_l,
            wibox.widget.systray(),
            separator_r,

            separator_l,
            spotify_widget(),
            separator_r,

            separator_l,
            battery_widget(),
            separator_r,

            separator_l,
            ram_widget(),
            separator_r,

            separator_l,
            volume_widget(),
            separator_r,
            
            separator_l,
            mytextclock,
            separator_r,

            s.mylayoutbox
        },
    }
end)
-- }}}