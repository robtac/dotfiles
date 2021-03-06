local module = {}

-- [ appearance ] --------------------------------------------------------------
-- Load color schemes from xresources
module.xresources = true

-- color scheme to use, choose from: light, mirage, dark
module.color_scheme = 'mirage'

-- path to your wallpaper
-- module.wallpaper = ''

-- [ widgets ] -----------------------------------------------------------------
-- disable desktop widget
-- module.desktop_widgets = false

-- widgets to be added to wibar
-- module.wibar_widgets = {
-- 	'net_down',
-- 	'net_up',
-- 	'vol',
-- 	'mem',
-- 	'cpu',
-- 	'fs',
-- 	'weather',
-- 	'temp',
-- 	'bat',
-- 	'datetime'
-- }

-- widgets to be added to the desktop pop up
-- module.arc_widgets = {'cpu', 'mem', 'fs', 'bat'}

-- configure widgets
module.widgets_arg = {
    weather = {
        -- city and app id for the weather widget
        city_id = '4951281',
        app_id = 'b2bf5e2c19a7ca7d988b1b233b624fcd'
    },
    temp = {
        -- set resource for temperature widget
        thermal_zone = 'thermal_zone0'
    },
    net = {
        -- network interface
        interface = 'enp5s0'
    }
}

-- [ miscellaneous ] -----------------------------------------------------------
-- Using Tyrannical tag managment engine
module.tyrannical = false

return module
