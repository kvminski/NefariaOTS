function onThink(interval, lastExecution)

local BOSS_GLOBAL_STORAGEhh = 25003 -- dont change
local BOSShh = "Jaul" -- boss name
local BOSS_POShh = {x = 1758, y = 92, z = 10} -- spawn coord

    if getGlobalStorageValue(BOSS_GLOBAL_STORAGEhh) == -1 then
        Game.createMonster(BOSShh, BOSS_POShh)
            setGlobalStorageValue(BOSS_GLOBAL_STORAGEhh, 1)
        end
return TRUE
end