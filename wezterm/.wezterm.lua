local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.font = wezterm.font("Berkeley Mono")
config.font_size = 12
config.color_scheme = "Gruvbox dark, hard (base16)"
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 10,
	right = 10,
	top = 0,
	bottom = 0,
}

local act = wezterm.action

local function set_status(window, workspace)
	local gui_win = window:gui_window()
	local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
	gui_win:set_left_status(wezterm.format({
		{ Foreground = { Color = "#d4be9k8" } },
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
	tab_bar = {
		background = "#1d2021", -- bg0
		active_tab = {
			bg_color = "#282828", -- bg1
			fg_color = "#d4be98", -- fg0
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#282828", -- bg1
			fg_color = "#7c6f64", -- grey0
		},
		inactive_tab_hover = {
			bg_color = "#3c3836", -- bg3
			fg_color = "#a89984", -- grey2
			italic = false,
		},
		new_tab = {
			bg_color = "#282828", -- bg1
			fg_color = "#928374", -- grey1
		},
		new_tab_hover = {
			bg_color = "#3c3836", -- bg3
			fg_color = "#ddc7a1", -- fg1
			italic = false,
		},
	},
}

config.keys = {
	{
		-- horizontal split
		mods = "LEADER",
		key = "|",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		-- vertical split
		mods = "LEADER",
		key = "\\",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		-- vertical split
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
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return config
