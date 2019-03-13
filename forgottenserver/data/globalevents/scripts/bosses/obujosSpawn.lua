function onThink(interval, lastExecution)

local BOSS_GLOBAL_STORAGEll = 25001 -- dont change
local BOSSll = "Obujos" -- boss name
local BOSS_POSll = {x = 1714, y = 168, z = 10} -- spawn coord

    if getGlobalStorageValue(BOSS_GLOBAL_STORAGEll) == -1 then
        Game.createMonster(BOSSll, BOSS_POSll)
            setGlobalStorageValue(BOSS_GLOBAL_STORAGEll, 1)
        end
return TRUE
end