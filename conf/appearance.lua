-- ===================================================================================
--  █████╗ ██████╗ ██████╗ ███████╗ █████╗ ██████╗  █████╗ ███╗   ██╗ ██████╗███████╗
-- ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝
-- ███████║██████╔╝██████╔╝█████╗  ███████║██████╔╝███████║██╔██╗ ██║██║     █████╗  
-- ██╔══██║██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██║██╔══██╗██╔══██║██║╚██╗██║██║     ██╔══╝  
-- ██║  ██║██║     ██║     ███████╗██║  ██║██║  ██║██║  ██║██║ ╚████║╚██████╗███████╗
-- ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
-- ===================================================================================

-- Configuration options (General & Decoration)
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 2,

        ["col.active_border"] = "rgba(cdd6f4aa)",
        ["col.inactive_border"] = "rgba(595959aa)",

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 2,
        rounding_power = 2.0,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 6,
            passes = 2,
            new_optimizations = true,
            ignore_opacity = true,
        },
    },
})

-- Layer rules (Blur & Alpha rules)

-- Waybar blur
hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
})

-- wlogout blur
hl.layer_rule({
    match = { namespace = "logout_dialog" },
    blur = true,
})

-- swaync blur & ignore_alpha
hl.layer_rule({
    match = { namespace = "swaync-control-center" },
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    match = { namespace = "swaync-notification-window" },
    blur = true,
    ignore_alpha = 0.5,
})