local M = {}
local wezterm = require("wezterm")

function M.setupKeys(config)
	---- Shortcuts
	local Leader = "LEADER"
	local LeaderShift = "LEADER|SHIFT"
	local LeaderCtrl = "LEADER|CTRL"
	local LeaderAlt = "LEADER|ALT"
	local LeaderCtrlShift = "LEADER|SHIFT|CTRL"

	local ShiftCtrl = "SHIFT|CTRL"
	local AltShift = "SHIFT|ALT"
	local AltCtrl = "CTRL|ALT"
	local Shift = "SHIFT"
	local Ctrl = "CTRL"
	local Alt = "ALT"
	local None = "NONE"

	---- Actions
	local act = wezterm.action

	---- Keybindings
	-- Leader
	config.leader = { key = "a", mods = Alt, timeout_milliseconds = 1000 }
	-- Keys
	config.keys = {
		---- Leader Keys
		{
			key = "|",
			mods = LeaderShift,
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = Leader,
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "c",
			mods = Leader,
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "r",
			mods = Leader,
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "f",
			mods = LeaderCtrl,
			action = act.Search({ CaseSensitiveString = "" }),
		},
  { key = 'l', mods = LeaderCtrlShift, action = wezterm.action.ShowDebugOverlay },
  	-- Motions
		{
			key = "LeftArrow",
			mods = Leader,
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = Leader,
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = Leader,
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = Leader,
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "h",
			mods = Leader,
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = Leader,
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = Leader,
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = Leader,
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "s",
			mods = Leader,
			action = act.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
		{
			key = "c",
			mods = LeaderCtrl,
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{
			key = "f",
			mods = Leader,
			action = act.ToggleFullScreen,
		},
		{
			key = "e",
			mods = LeaderCtrl,
			action = act.EmitEvent("trigger-vim-with-visible-text"),
		},
		---- None Leader keys
		{
			key = "Enter",
			mods = ShiftCtrl,
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "h",
			mods = ShiftCtrl,
			action = act.ActivateTabRelative(1),
		},
		{
			key = "l",
			mods = ShiftCtrl,
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "k",
			mods = ShiftCtrl,
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = ShiftCtrl,
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "l",
			mods = AltShift,
			action = act.MoveTabRelative(-1),
		},
		{
			key = "h",
			mods = AltShift,
			action = act.MoveTabRelative(1),
		},
		{
			key = "b",
			mods = Ctrl,
			action = act.RotatePanes("CounterClockwise"),
		},
		{
			key = "Home",
			mods = "",
			action = act.ScrollToTop,
		},
		{
			key = "End",
			mods = "",
			action = act.ScrollToBottom,
		},
		{
			key = "r",
			mods = ShiftCtrl,
			action = wezterm.action.ReloadConfiguration,
		},
		-- { key = "n", mods = Ctrl, action = act.RotatePanes("Clockwise") },
		-- { key = "n", mods = ShiftCtrl, action = wezterm.action.SpawnWindow },
		-- { key = "p", mods = Ctrl, action = act.ActivateCommandPalette },
		{ key = "p", mods = ShiftCtrl, action = act.ShowLauncher },
	}

	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = ShiftCtrl,
			action = act.ActivateTab(i - 1),
		})
	end

	config.mouse_bindings = {
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = act.SelectTextAtMouseCursor("SemanticZone"),
			mods = None,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = Ctrl,
			action = act.OpenLinkAtMouseCursor,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = Shift,
			action = act.ExtendSelectionToMouseCursor("Word"),
		},
	}
end

return M
