local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local icons = require('theme.icons')

local tags = {
	{

	},
	{
		type = 'terminal',
		icon = icons.terminal,
	},
	{
		type = 'internet',
		icon = icons.internet,
	},
	{
		type = 'code',
		icon = icons.code,
	},
	{
		type = 'media',
		icon = icons.media,
	},
	{
		type = 'games',
		icon = icons.games,
	},
	{
		type = 'social',
		icon = icons.social,
	},
}

-- Set tags layout
tag.connect_signal(
	'request::default_layouts',
	function()
	    awful.layout.append_default_layouts({
			awful.layout.suit.spiral.dwindle,
			awful.layout.suit.tile,
			awful.layout.suit.floating,
			awful.layout.suit.max
	    })
	end
)

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Create tags for each screen
awful.screen.connect_for_each_screen(
	function(s)
		set_wallpaper(s)
		for i, tag in pairs(tags) do
			awful.tag.add(
				i,
				{
					icon = tag.icon,
					icon_only = true,
					layout = awful.layout.layouts[1],
					gap_single_client = true,
					gap = 5,
					screen = s,
					selected = i == 1
				}
			)
		end
	end
)

-- Focus on urgent clients
awful.tag.attached_connect_signal(
	s,
	'property::selected',
	function()
		local urgent_clients = function (c)
			return awful.rules.match(c, {urgent = true})
		end
		for c in awful.client.iterate(urgent_clients) do
			if c.first_tag == mouse.screen.selected_tag then
				c:emit_signal('request::activate')
				c:raise()
			end
		end
	end
)
