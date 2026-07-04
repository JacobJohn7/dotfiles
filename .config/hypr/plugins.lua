-- PLUGIN CONFIGURATION
-- Configures the hyprland-scroll-overview plugin

hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 300,
            scale = 0.5,
            workspace_gap = 100,
            layout = "vertical",
            wallpaper = 0,
            blur = false,

            shadow = {
                enabled = false,
                range = 50,
                render_power = 3,
                color = 0xee1a1a1a,
            },
        },
    },
})

-- split-monitor-workspaces configuration
package.path = package.path .. ";/home/mello/.config/hypr/plugins/?.lua;/home/mello/.config/hypr/plugins/?/init.lua"
_G.smw = require("split-monitor-workspaces")
_G.smw.setup({
    workspace_count = 5,
    enable_persistent_workspaces = true,
    monitor_priority = { "DP-3", "HDMI-A-2" }
})

-- hyprglass configuration for premium liquid-glass effects
if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    hg.config({
        default_theme = "dark",
        default_preset = "clear",
        tint_color = 0x0505101a, -- subtle dark-blue/black tint (10% opacity)

        brightness = 0.92,
        dark = {
            brightness = 0.85,
            tint_color = 0x0505101e, -- dark-blue/black glass tint with ~12% opacity (0x1e)
        },
        light = {
            brightness = 1.15,
            tint_color = 0xffffff15, -- light frosted tint with ~8% opacity
        },

        layers = { enabled = 1 },
    })

    -- Presets: modern premium glass configurations
    hg.preset("clear", {
        glass_opacity = 0.35,      -- elegant transparency
        blur_strength = 2.5,       -- deep background blur
        blur_iterations = 4,       -- super smooth gaussian pass
        refraction_strength = 0.45, -- realistic glass refraction at edges
        chromatic_aberration = 0.25,-- subtle rainbow chromatic dispersion at bevels
        fresnel_strength = 0.65,    -- glowing edge highlights
        specular_strength = 0.85,   -- sleek specular reflection
        edge_thickness = 0.035,    -- thin modern bezel
        lens_distortion = 0.0,     -- zero magnification to keep text sharp and legible
    })

    hg.preset("subtle", {
        glass_opacity = 0.20,
        blur_strength = 1.5,
        blur_iterations = 3,
        refraction_strength = 0.15,
        chromatic_aberration = 0.0,
        fresnel_strength = 0.3,
        specular_strength = 0.4,
        edge_thickness = 0.02,
        lens_distortion = 0.0,
    })

    hg.preset("glass", {
        glass_opacity = 0.55,
        blur_strength = 3.5,
        blur_iterations = 5,
        refraction_strength = 0.65,
        chromatic_aberration = 0.4,
        fresnel_strength = 0.8,
        specular_strength = 0.9,
        edge_thickness = 0.05,
        lens_distortion = 0.1,
    })

    -- Whitelist specific UI layers to receive the glass effect
    hg.layer("waybar", { preset = "subtle", mask_threshold = 0.05 })
    hg.layer("swaync", { preset = "glass" })
end

