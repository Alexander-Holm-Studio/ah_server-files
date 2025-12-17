local Config = {}

Config.Recoil = {
    -- ============================================
    -- PISTOLS (Light to Medium Recoil)
    -- ============================================
    [GetHashKey("weapon_pistol")] = 0.8,
    [GetHashKey("weapon_pistol_mk2")] = 0.9,
    [GetHashKey("weapon_combatpistol")] = 0.7,
    [GetHashKey("weapon_appistol")] = 0.6,
    [GetHashKey("weapon_pistol50")] = 1.4,
    [GetHashKey("weapon_snspistol")] = 0.5,
    [GetHashKey("weapon_snspistol_mk2")] = 0.6,
    [GetHashKey("weapon_heavypistol")] = 1.1,
    [GetHashKey("weapon_vintagepistol")] = 0.9,
    [GetHashKey("weapon_flaregun")] = 0.4,
    [GetHashKey("weapon_marksmanpistol")] = 1.2,
    [GetHashKey("weapon_revolver")] = 1.8,
    [GetHashKey("weapon_revolver_mk2")] = 2.0,
    [GetHashKey("weapon_doubleaction")] = 1.5,
    [GetHashKey("weapon_raypistol")] = 0.3,
    [GetHashKey("weapon_ceramicpistol")] = 0.7,
    [GetHashKey("weapon_navyrevolver")] = 1.9,
    [GetHashKey("weapon_gadgetpistol")] = 0.5,

    -- ============================================
    -- SUBMACHINE GUNS (Low to Medium Recoil)
    -- ============================================
    [GetHashKey("weapon_microsmg")] = 0.8,
    [GetHashKey("weapon_smg")] = 0.9,
    [GetHashKey("weapon_smg_mk2")] = 1.0,
    [GetHashKey("weapon_assaultsmg")] = 1.1,
    [GetHashKey("weapon_combatpdw")] = 0.9,
    [GetHashKey("weapon_machinepistol")] = 0.7,
    [GetHashKey("weapon_minismg")] = 0.8,
    [GetHashKey("weapon_raycarbine")] = 0.4,

    -- ============================================
    -- SHOTGUNS (High Recoil)
    -- ============================================
    [GetHashKey("weapon_pumpshotgun")] = 3.5,
    [GetHashKey("weapon_pumpshotgun_mk2")] = 3.8,
    [GetHashKey("weapon_sawnoffshotgun")] = 4.2,
    [GetHashKey("weapon_assaultshotgun")] = 2.8,
    [GetHashKey("weapon_bullpupshotgun")] = 3.0,
    [GetHashKey("weapon_musket")] = 5.0,
    [GetHashKey("weapon_heavyshotgun")] = 3.2,
    [GetHashKey("weapon_dbshotgun")] = 4.5,
    [GetHashKey("weapon_autoshotgun")] = 2.5,
    [GetHashKey("weapon_combatshotgun")] = 3.3,

    -- ============================================
    -- ASSAULT RIFLES (Medium to High Recoil)
    -- ============================================
    [GetHashKey("weapon_assaultrifle")] = 1.4,
    [GetHashKey("weapon_assaultrifle_mk2")] = 1.5,
    [GetHashKey("weapon_carbinerifle")] = 1.2,
    [GetHashKey("weapon_carbinerifle_mk2")] = 1.3,
    [GetHashKey("weapon_advancedrifle")] = 1.1,
    [GetHashKey("weapon_specialcarbine")] = 1.2,
    [GetHashKey("weapon_specialcarbine_mk2")] = 1.3,
    [GetHashKey("weapon_bullpuprifle")] = 1.3,
    [GetHashKey("weapon_bullpuprifle_mk2")] = 1.4,
    [GetHashKey("weapon_compactrifle")] = 1.5,
    [GetHashKey("weapon_militaryrifle")] = 1.6,
    [GetHashKey("weapon_heavyrifle")] = 1.8,
    [GetHashKey("weapon_tacticalrifle")] = 1.4,

    -- ============================================
    -- LIGHT MACHINE GUNS (High Recoil)
    -- ============================================
    [GetHashKey("weapon_mg")] = 2.2,
    [GetHashKey("weapon_combatmg")] = 2.4,
    [GetHashKey("weapon_combatmg_mk2")] = 2.5,
    [GetHashKey("weapon_gusenberg")] = 1.8,

    -- ============================================
    -- SNIPER RIFLES (Very High Recoil)
    -- ============================================
    [GetHashKey("weapon_sniperrifle")] = 3.5,
    [GetHashKey("weapon_heavysniper")] = 5.0,
    [GetHashKey("weapon_heavysniper_mk2")] = 5.2,
    [GetHashKey("weapon_marksmanrifle")] = 2.8,
    [GetHashKey("weapon_marksmanrifle_mk2")] = 3.0,
    [GetHashKey("weapon_precisionrifle")] = 3.2,

    -- ============================================
    -- HEAVY WEAPONS (Extreme Recoil)
    -- ============================================
    [GetHashKey("weapon_rpg")] = 6.0,
    [GetHashKey("weapon_grenadelauncher")] = 4.5,
    [GetHashKey("weapon_grenadelauncher_smoke")] = 3.0,
    [GetHashKey("weapon_minigun")] = 3.5,
    [GetHashKey("weapon_firework")] = 2.0,
    [GetHashKey("weapon_railgun")] = 4.0,
    [GetHashKey("weapon_hominglauncher")] = 5.0,
    [GetHashKey("weapon_compactlauncher")] = 4.0,
    [GetHashKey("weapon_rayminigun")] = 2.5,
    [GetHashKey("weapon_emplauncher")] = 3.5,

    -- ============================================
    -- MELEE WEAPONS (No Recoil)
    -- ============================================
    [GetHashKey("weapon_knife")] = 0.0,
    [GetHashKey("weapon_nightstick")] = 0.0,
    [GetHashKey("weapon_hammer")] = 0.0,
    [GetHashKey("weapon_bat")] = 0.0,
    [GetHashKey("weapon_golfclub")] = 0.0,
    [GetHashKey("weapon_crowbar")] = 0.0,
    [GetHashKey("weapon_bottle")] = 0.0,
    [GetHashKey("weapon_dagger")] = 0.0,
    [GetHashKey("weapon_hatchet")] = 0.0,
    [GetHashKey("weapon_knuckle")] = 0.0,
    [GetHashKey("weapon_machete")] = 0.0,
    [GetHashKey("weapon_flashlight")] = 0.0,
    [GetHashKey("weapon_switchblade")] = 0.0,
    [GetHashKey("weapon_poolcue")] = 0.0,
    [GetHashKey("weapon_wrench")] = 0.0,
    [GetHashKey("weapon_battleaxe")] = 0.0,
    [GetHashKey("weapon_stone_hatchet")] = 0.0,

    -- ============================================
    -- THROWABLES (Minimal Recoil)
    -- ============================================
    [GetHashKey("weapon_grenade")] = 0.3,
    [GetHashKey("weapon_bzgas")] = 0.2,
    [GetHashKey("weapon_molotov")] = 0.3,
    [GetHashKey("weapon_stickybomb")] = 0.2,
    [GetHashKey("weapon_proxmine")] = 0.2,
    [GetHashKey("weapon_snowball")] = 0.1,
    [GetHashKey("weapon_pipebomb")] = 0.3,
    [GetHashKey("weapon_ball")] = 0.1,
    [GetHashKey("weapon_smokegrenade")] = 0.2,
    [GetHashKey("weapon_flare")] = 0.2,

    -- ============================================
    -- SPECIAL WEAPONS
    -- ============================================
    [GetHashKey("weapon_petrolcan")] = 0.0,
    [GetHashKey("weapon_fireextinguisher")] = 0.1,
    [GetHashKey("weapon_parachute")] = 0.0,
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        if IsPedShooting(playerPed) then
            local weaponHash = GetSelectedPedWeapon(playerPed)
            local recoil = Config.Recoil[weaponHash] or 0.0

            if recoil > 0.0 then
                local camPitch = GetGameplayCamRelativePitch()
                SetGameplayCamRelativePitch(camPitch + recoil, 0.8)
                ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1 + (recoil * 0.03))
            end
        end
    end
end)
