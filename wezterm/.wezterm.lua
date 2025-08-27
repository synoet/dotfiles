local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.font = wezterm.font("Berkeley Mono")
config.font_size = 14
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 0, right = 0,
	top = 0,
	bottom = 0,
}

local act = wezterm.action

local function set_status(window, workspace)
	local gui_win = window:gui_window()
	local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
	gui_win:set_left_status(wezterm.format({
		{ Foreground = { Color = "#d4b398" } },
		{ Text = " ::" .. base_path .. "  " },
	}))
end

-- workspace_switcher
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, workspace)
	set_status(window, workspace)
end)

wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, workspace)
	set_status(window, workspace)
end)

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	-- Set your default workspace name here
	window:set_workspace("default")
	-- Update the status right away
	set_status(window, "default")
end)

config.leader = { key = " ", mods = "CTRL" }

config.colors = {
  -- Backgrounds
  background = '#1d2021', -- bg0
  foreground = '#d4be98', -- fg0
  cursor_bg = '#d4be98',
  cursor_fg = '#1d2021',
  cursor_border = '#d4be98',
  selection_bg = '#504945', -- bg5
  selection_fg = '#d4be98',
  ansi = {
    '#282828', -- black (bg1)
    '#ea6962', -- red
    '#a9b665', -- green
    '#d8a657', -- yellow
    '#7daea3', -- blue
    '#d3869b', -- purple
    '#89b482', -- aqua (note: you had typo "896482")
    '#d4be98', -- white (fg0)
  },
  brights = {
    '#928374', -- bright black (grey1)
    '#ea6962', -- bright red
    '#a9b665', -- bright green
    '#d8a657', -- bright yellow
    '#7daea3', -- bright blue
    '#d3869b', -- bright purple
    '#89b482', -- bright aqua
    '#ddc7a1', -- bright white (fg1)
  },
  tab_bar = {
    background = '#1d2021', -- bg_dim
    active_tab = {
      bg_color = '#282828', -- bg1
      fg_color = '#d4be98',
    },
    inactive_tab = {
      bg_color = '#1d2021', -- bg0
      fg_color = '#928374', -- grey1
    },
    inactive_tab_hover = {
      bg_color = '#32302f', -- bg_statusline2
      fg_color = '#d4be98',
    },
  },
}

-- config.colors = custom_theme

config.keys = {
	{
		-- horizontal split
		mods = "LEADER",
		key = "|",
		action = act.SplitPane({ direction = "Right", size = { Percent = 30 }}),
	},
	{
		-- vertical split
		mods = "LEADER",
		key = "\\",
		action = act.SplitPane({ direction = "Down", size = { Percent = 30 }}),
	},
	{
		mods = "LEADER",
		key = "t",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "c",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		-- focus right pane
		mods = "LEADER",
		key = "l",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		-- focus left pane
		mods = "LEADER",
		key = "h",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		-- focus pane below
		mods = "LEADER",
		key = "j",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		-- focus pane above
		mods = "LEADER",
		key = "k",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "w",
		action = act.ShowLauncher,
	},
	{
		mods = "LEADER",
		key = "b",
		action = act.ShowTabNavigator,
	},
	{
		mods = "LEADER",
		key = "x",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "w",
		mods = "LEADER",
		action = workspace_switcher.switch_workspace({ extra_args = " | rg -Fxf ~/.projects" }),
	},
	{
		key = ",",
		mods = "LEADER",
		action = act.ActivateCopyMode,
	},
  {
      key = "r",
      mods = "LEADER",
      action = act.ActivateKeyTable {
          name = "resize_pane",
          one_shot = false,
          timeout_milliseconds = 3000,
          replace_current = false,
      },
  },
}

config.key_tables = {
    resize_pane = {
        { key = "h", action = act.AdjustPaneSize { "Left", 5 } },
        { key = "j", action = act.AdjustPaneSize { "Down", 5 } },
        { key = "k", action = act.AdjustPaneSize { "Up", 5 } },
        { key = "l", action = act.AdjustPaneSize { "Right", 5 } },
        { key = "H", mods = "SHIFT", action = act.AdjustPaneSize { "Left", 1 } },
        { key = "J", mods = "SHIFT", action = act.AdjustPaneSize { "Down", 1 } },
        { key = "K", mods = "SHIFT", action = act.AdjustPaneSize { "Up", 1 } },
        { key = "L", mods = "SHIFT", action = act.AdjustPaneSize { "Right", 1 } },
        { key = "h", mods = "CTRL", action = act.AdjustPaneSize { "Left", 15 } },
        { key = "j", mods = "CTRL", action = act.AdjustPaneSize { "Down", 15 } },
        { key = "k", mods = "CTRL", action = act.AdjustPaneSize { "Up", 15 } },
        { key = "l", mods = "CTRL", action = act.AdjustPaneSize { "Right", 15 } },
        { key = "Escape", action = act.PopKeyTable },
        { key = "Enter", action = act.PopKeyTable },
        { key = "r", action = act.PopKeyTable },
    },
}

config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 0.8,
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return config

