-- ==============================================================================
-- LAYER RULES
-- ==============================================================================

-- Disable animations for hyprshot selection overlay to prevent coordinate offsets
hl.layer_rule({
    name = "fix-hyprshot-slurp",
    match = {
        namespace = "selection",
    },
    no_anim = true,
})

-- Disable animations for hyprpicker color picker layer
hl.layer_rule({
    name = "fix-hyprshot-hyprpicker",
    match = {
        namespace = "hyprpicker",
    },
    no_anim = true,
})