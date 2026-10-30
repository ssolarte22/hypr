-- ==============================================================================
-- WINDOW RULES
-- ==============================================================================

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Disable blur for floating XWayland windows
hl.window_rule({
    match = {
        xwayland = true,
        float = true,
    },
    no_blur = true,
})