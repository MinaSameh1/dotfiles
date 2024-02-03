local wezterm = require("wezterm")

local setupFont = require("font").setupFont
local setupKeys = require("keybindings").setupKeys
local setupTabbar = require("tabbar").setupTabbar
require("events")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.front_end = "WebGpu"

config.colors = {}
config.colors.tab_bar = {
	background = "#1f2335",
	inactive_tab = {
		bg_color = "#1E1E1E",
		fg_color = "#FFFFFF",
	},
	active_tab = {
		bg_color = "#1E1E1E",
		fg_color = "#FFFFFF",
	},
}

config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

setupFont(config)
setupKeys(config)
setupTabbar(config)

config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "TITLE"
config.default_cursor_style = "SteadyBar"

config.color_scheme_dirs = {
	os.getenv("HOME") .. "/.config/wezterm/colorschemes",
}

-- tokyonight-storm, NeoSolarized Dark
config.color_scheme = "neosolarized-dark"
config.window_background_opacity = 0.8
config.text_background_opacity = 0.95

-- and finally, return the configuration to wezterm
return config
