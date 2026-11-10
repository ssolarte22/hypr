-- Configuration options
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        initial_workspace_tracking = 1,
        vrr = 0, -- Set to 0 to prevent frame pacing stutter on Intel iGPU
    },
    
    render = {
        direct_scanout = 1, -- Moved from misc. Set to 1 (or true) to enable direct scanout for low latency
    },

    debug = {
        vfr = true, -- Moved from misc to debug section
    },
})