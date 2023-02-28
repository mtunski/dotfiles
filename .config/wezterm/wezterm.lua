local wezterm = require 'wezterm'

local mux = wezterm.mux
wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window {}
    -- window:gui_window():maximize()
    window:gui_window():toggle_fullscreen()
end)

local in_wsl = wezterm.running_under_wsl()

return {
    wsl_domains = {{
        name = 'WSL:Ubuntu',
        distribution = 'Ubuntu',
        default_cwd = "~"
    }},

    default_domain = in_wsl and "WSL:Ubuntu" or nil,

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

    scrollback_lines = 99999,

    exit_behavior = "Hold",
    window_close_confirmation = 'NeverPrompt',

    -- color_scheme = "Dracula"
    color_scheme = "Dracula (Official)",
    -- tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    window_decorations = "RESIZE",

    default_cursor_style = 'BlinkingBar',
    cursor_blink_ease_in = "EaseIn",
    cursor_blink_ease_out = "EaseOut",
    -- cursor_blink_rate = 500,

    adjust_window_size_when_changing_font_size = false,

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

    keys = {{
        key = 'k',
        mods = 'CMD',
        action = wezterm.action.ClearScrollback 'ScrollbackAndViewport'
    }, {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitPane {
            direction = 'Right'
        }
    }, {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitPane {
            direction = 'Down'
        }
    }, {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane {
            confirm = false
        }
    }}
}
