-- WINDOWS AND WORKSPACES RULES
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Assign workspaces to specific monitors (Main monitor = DP-3, Second monitor = HDMI-A-2)
-- hl.workspace_rule({ workspace = "1", monitor = "DP-3", default = true })
-- hl.workspace_rule({ workspace = "2", monitor = "DP-3" })
-- hl.workspace_rule({ workspace = "3", monitor = "DP-3" })
-- hl.workspace_rule({ workspace = "4", monitor = "DP-3" })
-- hl.workspace_rule({ workspace = "5", monitor = "DP-3" })
-- hl.workspace_rule({ workspace = "6", monitor = "DP-3" })

-- hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-2", default = true })
-- hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-2" })
-- hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-2" })

-- Example window rules that are useful
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "float-dialogs",
    match = { title = "^(Open File|Save File|Select Folder|Choose File|Confirm|Attention)$" },
    float = true,
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- QuickShell Layer Rules
hl.layer_rule({
    name  = "quickshell-anim",
    match = { namespace = "^quickshell.*$" },
    animation = "popin",
})
hl.layer_rule({
    name  = "quickshell-blur",
    match = { namespace = "^quickshell.*$" },
    blur = true,
})
hl.layer_rule({
    name  = "quickshell-ignorealpha",
    match = { namespace = "^quickshell.*$" },
    ignore_alpha = 0.3,
})
hl.window_rule({
    name  = "quickshell-float",
    match = { class = "^quickshell$" },
    float = true,
})
hl.window_rule({
    name  = "quickshell-noblur",
    match = { class = "^quickshell$", title = "^quickshell$" },
    no_blur = true,
})

-- Zen Browser Picture-in-Picture (PiP) Window Rules
hl.window_rule({
    name             = "zen-pip",
    match            = { class = "^zen$", title = "^Picture-in-Picture$" },
    float            = true,
    pin              = true,
    no_initial_focus = true,
    size             = { 400, 225 },
    move             = "onscreen 100%-w-20 100%-h-20",
    opacity          = "1.0 override 1.0 override",
})

-- Automatically start games in borderless fullscreen mode
hl.window_rule({
    name       = "auto-borderless-games",
    match      = { class = "^(steam_app_[0-9]+|gamescope|[wW]ine|[lL]utris|[hH]eroic|.*\\.exe)$" },
    fullscreen = true,
})

-- Enable immediate tearing for games (lowers input lag when VSync is off in game settings)
hl.window_rule({
    name       = "gaming-immediate-tearing",
    match      = { class = "^(steam_app_[0-9]+|gamescope|[wW]ine|[lL]utris|[hH]eroic|.*\\.exe)$" },
    immediate  = true,
})

-- Blur Waybar background layer
hl.layer_rule({
    name  = "waybar-blur",
    match = { namespace = "^waybar$" },
    blur  = true,
})
hl.layer_rule({
    name  = "waybar-ignorealpha",
    match = { namespace = "^waybar$" },
    ignore_alpha = 0.3,
})

-- Waybar Layer Animations (Slide from the left edge)
hl.layer_rule({
    name  = "waybar-anim",
    match = { namespace = "^waybar$" },
    animation = "slide left",
})

-- Wofi Layer Animations (Pop-in from center)
hl.layer_rule({
    name  = "wofi-anim",
    match = { namespace = "^wofi$" },
    animation = "popin 85%",
})

-- Notification Daemon Layer Animations (Slide from the right edge)
hl.layer_rule({
    name  = "swaync-anim",
    match = { namespace = "^swaync$" },
    animation = "slide right",
})


-- Sized Floating Rules for Utility Windows
hl.window_rule({
    name    = "float-utilities",
    match   = { class = "^(org.gnome.Calculator|pavucontrol)$" },
    float   = true,
    size    = { 420, 550 },
    center  = true,
})

-- Routing for Launchers (DP-3 Monitor)
hl.window_rule({
    name      = "launchers-workspace",
    match     = { class = "^(steam|steamwebhelper|hydra|hydra-launcher|[Hh]eroic|[lL]utris)$" },
    monitor   = "DP-3",
})

-- Workspace Routing for Games (DP-3 Monitor)
hl.window_rule({
    name      = "gaming-workspace",
    match     = { class = "^(steam_app_[0-9]+|gamescope|.*\\.exe)$" },
    monitor   = "DP-3",
})

-- Desktop Virtual Pet Window Rules
hl.window_rule({
    name             = "desktop-pet",
    match            = { title = "^desktop-pet$" },
    float            = true,
    pin              = true,
    no_initial_focus = true,
})


