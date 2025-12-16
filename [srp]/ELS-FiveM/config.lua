outputLoading = false
playButtonPressSounds = true
printDebugInformation = false

vehicleSyncDistance = 150
environmentLightBrightness = 0.006

-- ⚡ Politi‑lys hastighed (Danmark stil)
lightDelay = 50 -- tid mellem lys tænd/sluk i ms
flashDelay = 75 -- tid mellem blink i ms

-- Per-vehicle light delay overrides (in ms). Use the VCF filename key (eg. 'police3')
-- to set a slower/more conservative flashing rate for specific vehicles.
vehicleLightDelayOverrides = {
    police3 = 120, -- slower, Danish-style police flash timing
}

panelEnabled = true
panelType = "original"
panelOffsetX = 0.0
panelOffsetY = 0.0

allowedPanelTypes = {
    "original",
    "old"
}

-- https://docs.fivem.net/game-references/controls

shared = {
    horn = 86,
}

keyboard = {
    modifyKey = 132,
    stageChange = 85,     -- E
    guiKey = 199,         -- P
    takedown = 83,        -- =
    siren = {
        tone_one = 157,   -- 1
        tone_two = 158,   -- 2
        tone_three = 160, -- 3
    },
    pattern = {
        primary = 163,   -- 9
        secondary = 162, -- 8
        advisor = 161,   -- 7
    },
    warning = 246,       -- Y
    secondary = 303,     -- U
    primary = 7,         -- ??
}

controller = {
    modifyKey = 73,
    stageChange = 80,
    takedown = 74,
    siren = {
        tone_one = 173,
        tone_two = 85,
        tone_three = 172,
    },
}
