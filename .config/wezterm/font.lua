local wezterm = require("wezterm")

local M = {}

function M.setupFont(config)
	-- Set the font size to 16pt
	wezterm.font_size = 16.0
	-- Use the font family "Iosveka" with a fallback to "Noto Color Emoji" for emoji support
	config.font = wezterm.font_with_fallback({
		{ family = 'FantasqueSansM Nerd Font' },
		{ family = "Fantasque Sans Mono" },
		{ family = "Iosevka Term Light" },
		"Inconsolata Nerd Font Mono",
		"Noto Color Emoji",
	})

	config.font_size = 15.0
	config.line_height = 0.99
	config.font_shaper = "Harfbuzz"
	-- Enable ligatures
	config.harfbuzz_features = { "calt=1", "clig=1", "liga=1", "kern=1", "mkmk=1" }
	config.font_rules = {
		{
			-- Italic
			italic = true,
			font = wezterm.font_with_fallback({
				{ family = "Iosevka Term Light", italic = true },
				"Inconsolata Nerd Font Mono",
				"Noto Color Emoji",
			}),
		},
		{
			-- Bold
			intensity = "Bold",
			italic = false,
			font = wezterm.font_with_fallback({
				{ family = "Iosevka Term Light", weight = "Bold" },
				"Inconsolata Nerd Font Mono",
				"Noto Color Emoji",
			}),
		},
		{
			-- Bold Italic
			intensity = "Bold",
			italic = true,
			font = wezterm.font_with_fallback({
				{ family = "Iosevka Term Light", weight = "Bold", italic = true },
				"Inconsolata Nerd Font Mono",
				"Noto Color Emoji",
			}),
		},
	}
end

return M
