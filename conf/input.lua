-- ========================================================================
-- ██╗███╗   ██╗██████╗ ██╗   ██╗████████╗
-- ██║████╗  ██║██╔══██╗██║   ██║╚══██╔══╝
-- ██║██╔██╗ ██║██████╔╝██║   ██║   ██║   
-- ██║██║╚██╗██║██╔═══╝ ██║   ██║   ██║   
-- ██║██║ ╚████║██║     ╚██████╔╝   ██║   
-- ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝    ╚═╝   
-- ========================================================================

-- Global Input & Touchpad Configuration
hl.config({
    input = {
        kb_layout = "latam",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.175,
        },
    },
})

-- Gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.gesture({
    fingers = 3,
    direction = "up",
    action = "fullscreen",
})

-- Per-Device Overrides
hl.device({
    name = "epic-mouse-v1",
    sensitivity = 0,
})

hl.device({
    name = "asue1306:00-04f3:3284-touchpad",
    sensitivity = 0.8, -- Adjust this value between -1.0 and 1.0
})