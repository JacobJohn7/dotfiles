-- LOOK AND FEEL
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(d4af37ee)", "rgba(ffbf00ee)"}, angle = 45 },
            inactive_border = "rgba(080808aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 8,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows (enabled for hyprglass)
        active_opacity   = 0.88,
        inactive_opacity = 0.80,

        shadow = {
            enabled      = true,
            range        = 8,
            render_power = 4,
            color        = 0x33000000,
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 2,
            vibrancy  = 0.15,
        },
    },

    animations = {
        enabled = true,
    },
})
