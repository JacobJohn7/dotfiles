-- MISCELLANEOUS & INPUT
-- Layouts, Input Devices, Gestures, and other Misc settings

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- Misc Settings
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        enable_swallow          = true,  -- Enable terminal window swallowing
        swallow_regex           = "^(ghostty)$", -- Swallowed by ghostty terminal
        splash_random           = {
            "No crown is won without blood.",
            "Silence rules the ruined throne.",
            "A king of ashes, a crown of dust.",
            "The shadows bow to the golden crown.",
            "Heavy is the head that wears the crown.",
            "Reign in the dark, decay in the light.",
            "Born of blood, bound to the throne.",
            "The empire falls, the legend remains.",
            "Only ashes remember the king's name."
        }
    },
})

-- Input Settings
-- See https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = -0.5, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Cursor Settings
-- See https://wiki.hypr.land/Configuring/Variables/#cursor
hl.config({
    cursor = {
        default_monitor = "DP-3",
    },
})


hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
