local wezterm = require 'wezterm'

local mux = wezterm.mux
wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window {}
    -- window:gui_window():maximize()
    window:gui_window():toggle_fullscreen()
end)

return {
    font = wezterm.font({
        family = 'LigaOperatorMono NF',
        weight = 'ExtraLight',
        harfbuzz_features = {'liga=1'}
    }),
    font_size = 16,
    font_rules = { -- For Bold-but-not-italic text, use this relatively bold font, and override
    -- its color to a tomato-red color to make bold text really stand out.
    {
        intensity = 'Bold',
        italic = false,
        font = wezterm.font {
            family = 'LigaOperatorMono NF',
            weight = 'Light',
            foreground = 'tomato'
        }
    }, -- Bold-and-italic
    {
        intensity = 'Bold',
        italic = true,
        font = wezterm.font {
            family = 'LigaOperatorMono NF',
            weight = 'Light',
            italic = true
        }
    }, -- normal-intensity-and-italic
    {
        intensity = 'Normal',
        italic = true,
        font = wezterm.font {
            family = 'LigaOperatorMono NF',
            weight = 'Light',
            italic = true
        }
    }, -- half-intensity-and-italic (half-bright or dim); use a lighter weight font
    {
        intensity = 'Half',
        italic = true,
        font = wezterm.font {
            family = 'LigaOperatorMono NF',
            weight = 'DemiLight',
            italic = true
        }
    }, -- half-intensity-and-not-italic
    {
        intensity = 'Half',
        italic = false,
        font = wezterm.font {
            family = 'LigaOperatorMono NF',
            weight = 'Light'
        }
    }},

    exit_behavior = "Hold",
    window_close_confirmation = 'NeverPrompt',

    -- color_scheme = "Dracula"
    color_scheme = "Dracula (Official)",
    -- tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    window_decorations = "RESIZE",

    -- cursor_blink_ease_in = 'Constant',
    -- cursor_blink_ease_out = 'Constant',
    -- cursor_blink_rate = 500,
    default_cursor_style = 'BlinkingBar',
    cursor_blink_ease_in = "EaseIn",
    cursor_blink_ease_out = "EaseOut",

    adjust_window_size_when_changing_font_size = false,

    -- disable_default_key_bindings = true
    animation_fps = 1,

    front_end = "WebGpu",
    webgpu_force_fallback_adapater = true,

    -- mode = 'fullscreen',

    native_macos_fullscreen_mode = true,

    -- window_padding = {
    --     left = 0,
    --     right = 0,
    --     top = 0,
    --     bottom = 0
    -- }

    pane_focus_follows_mouse = true,

    keys = { -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitPane {
            direction = 'Right'
            -- command = {
            --     -- args = {'top'}
            -- },
            -- size = {
            --     Percent = 50
            -- }
        }
    }, {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitPane {
            direction = 'Down'
            -- command = {
            --     -- args = {'top'}
            -- },
            -- size = {
            --     Percent = 50
            -- }
        }
    }, {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane {
            confirm = false
        }

    }}
}
