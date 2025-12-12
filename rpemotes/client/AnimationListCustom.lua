-- Emotes you add in the file will automatically be added to AnimationList.lua
-- If you have multiple custom list files they MUST be added between AnimationList.lua and Emote.lua in fxmanifest.lua!
-- Don't change 'CustomDP' it is local to this file!

-- Remove the } from the = {} then enter your own animation code ---
-- Don't forget to close the tables.

---@type AnimationListConfig?
---@diagnostic disable-next-line: missing-fields
local CustomDP = {}

CustomDP.Expressions = {}
CustomDP.Walks = {}
CustomDP.Shared = {}
CustomDP.Dances = {}
CustomDP.AnimalEmotes = {}
CustomDP.Exits = {}
CustomDP.Emotes = {
    ["radio2"] = {
        "random@arrests",
        "radio_chatter",
        "Radio 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["radiochest"] = {
        "anim@cop_mic_pose_002",
        "chest_mic",
        "Radio Chest",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["earpiece"] = {
        "cellphone@",
        "cellphone_call_listen_base",
        "Earpiece",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
}
CustomDP.PropEmotes = {}

-----------------------------------------------------------------------------------------
--| I don't think you should change the code below unless you know what you are doing |--
-----------------------------------------------------------------------------------------

function LoadAddonEmotes()
    local prefixes = {
        Shared = '🤼 ',
        AnimalEmotes = '🐶 ',
        PropEmotes = '📦 '
    }

    assert(CustomDP ~= nil, 'Addon emotes can only be loaded once')
    for arrayName, array in pairs(CustomDP) do
        if RP[arrayName] then
            local prefix = prefixes[arrayName]
            for emoteName, emoteData in pairs(array) do
                if prefix then
                    emoteData[3] = prefix .. emoteData[3]
                end
                RP[arrayName][emoteName] = emoteData
            end
        end
    end
    -- Free memory
    CustomDP = nil
end
