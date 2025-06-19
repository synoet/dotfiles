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
		{ Foreground = { Color = "#ffffff" } },
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
local colors = {
    bg = "#161718",        -- Based on hsl(210, 4, 9)
    bg_0 = "#141619",      -- Based on hsl(210, 6, 10)
    bg_1 = "#17191d",      -- Based on hsl(210, 6, 12)
    bg_2 = "#1a1d21",      -- Based on hsl(210, 6, 14)
    bg_3 = "#202329",      -- Based on hsl(210, 6, 18)
    bg_4 = "#25282f",      -- Based on hsl(210, 6, 21)
    bg_5 = "#2a2e36",      -- Based on hsl(210, 6, 24)
    red = "#e67e80",       -- Based on hsl(359, 68, 70)
    orange = "#ed7547",    -- Based on hsl(11, 81, 68)
    orange_dim = "#e8865e", -- Based on hsl(11, 60, 70)
    yellow = "#F2CE88",    -- Based on hsl(40, 95, 74)
    green_dim = "#59cc99", -- Based on hsl(150, 60, 60)
    blue_dim = "#7DC4E8",  -- Based on hsl(200, 70, 70)
    blue_bright = "#6EE0F7", -- Based on hsl(190, 90, 70)
    green_bright = "#7DE8B3", -- Based on hsl(150, 70, 70)
    purple = "#C190DA",    -- Based on hsl(280, 60, 80)
    fg = "#e5aa8a",        -- Based on hsl(21, 100, 80)
    fg_0 = "#f3e6db",      -- Based on hsl(30, 15, 90)
    fg_1 = "#bfb5aa",      -- Based on hsl(30, 10, 75)
    fg_2 = "#928c85",      -- Based on hsl(30, 5, 60)
    fg_3 = "#554e47",      -- Based on hsl(30, 5, 35)
}

local custom_theme = {
    foreground = colors.fg_1,
    background = colors.bg,
    cursor_bg = colors.fg_1,
    cursor_fg = colors.bg,
    cursor_border = colors.green_bright,
    selection_bg = colors.bg_4,
    selection_fg = colors.fg_0,
    split = colors.bg_3,
    ansi = {
        colors.bg_3,       -- Black
        colors.red,        -- Red
        colors.green_bright, -- Green
        colors.yellow,     -- Yellow
        colors.blue_dim,   -- Blue
        colors.purple,     -- Magenta
        colors.blue_bright, -- Cyan
        colors.fg_1,       -- White
    },
    brights = {
        colors.fg_1,       -- Bright black
        colors.red,        -- Bright red
        colors.green_bright, -- Bright green
        colors.yellow,     -- Bright yellow
        colors.blue_bright, -- Bright blue
        colors.purple,     -- Bright magenta
        colors.blue_bright, -- Bright cyan
        colors.fg_0,       -- Bright white
    },
    -- Tab bar
    tab_bar = {
        background = colors.bg,
        active_tab = {
            bg_color = colors.bg_1,
            fg_color = colors.green_bright,
        },
        inactive_tab = {
            bg_color = colors.bg,
            fg_color = colors.fg_1,
        },
        inactive_tab_hover = {
            bg_color = colors.bg_0,
            fg_color = colors.fg_0,
        },
        new_tab = {
            bg_color = colors.bg,
            fg_color = colors.fg_2,
        },
        new_tab_hover = {
            bg_color = colors.bg_0,
            fg_color = colors.fg_0,
        },
    },
}

config.colors = custom_theme

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

