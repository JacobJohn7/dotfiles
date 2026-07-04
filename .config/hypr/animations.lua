-- ANIMATIONS AND CURVES
-- For curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

--------------------------------------------------------------------------------
-- 1. CURVE AND SPRING DEFINITIONS
--------------------------------------------------------------------------------

-- Custom modern curves
hl.curve("winSnappy", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } }) -- Snappy with modern overshoot
hl.curve("linear",    { type = "bezier", points = { {0, 0},      {1, 1}      } })

-- Physics-based Spring for dragging/moving windows (elastic spring behavior)
hl.curve("springDrag", { type = "spring", mass = 1, stiffness = 120, dampening = 15 })

--------------------------------------------------------------------------------
-- 2. ACTIVE CONFIGURATION (MODERN MOODY SNAPPY PRESET)
--------------------------------------------------------------------------------

-- Global master toggle
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })

-- Windows: Scale + fade on open/close with minor scale offset (85% size)
hl.animation({ leaf = "windows",     enabled = true, speed = 5.2, bezier = "winSnappy" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 5.2, bezier = "winSnappy", style = "popin 85%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4.8, bezier = "winSnappy", style = "popin 85%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5.2, bezier = "winSnappy" })

-- Fading transitions: Very fast and snappy
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 4.5, bezier = "winSnappy" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 4.5, bezier = "winSnappy" })
hl.animation({ leaf = "fade",          enabled = true, speed = 5.0, bezier = "winSnappy" })

-- Borders: Fast border color transitions
hl.animation({ leaf = "border",      enabled = true, speed = 6.0, bezier = "winSnappy" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 6.0, bezier = "linear" })

-- Layers: Fast slides and fades
hl.animation({ leaf = "layers",        enabled = true, speed = 4.8, bezier = "winSnappy" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4.8, bezier = "winSnappy" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 4.8, bezier = "winSnappy" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 4.5, bezier = "winSnappy" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4.5, bezier = "winSnappy" })

-- Workspaces: Smooth slide + fade (directionally aware)
hl.animation({ leaf = "workspaces",    enabled = true, speed = 4.8, bezier = "winSnappy", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 4.8, bezier = "winSnappy", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4.8, bezier = "winSnappy", style = "slidefade 20%" })

-- Special Workspace: Vertical sliding zoom
hl.animation({ leaf = "specialWorkspace",    enabled = true, speed = 4.8, bezier = "winSnappy", style = "slidefade vertical" })
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 4.8, bezier = "winSnappy", style = "slidefade vertical" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 4.8, bezier = "winSnappy", style = "slidefade vertical" })

-- Utility Zooming
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6.0, bezier = "winSnappy" })
