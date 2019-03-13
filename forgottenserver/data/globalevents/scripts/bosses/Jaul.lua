local BOSSgg = "Jaul" -- boss name
local BOSS_POSgg = {x = 1758, y = 92, z = 10} -- boss spawn coord  
local roomgg = {fromx = 1744, tox = 1770, fromy = 75, toy = 97, z = 10} -- boss room
local BOSS_GLOBAL_STORAGEgg = 80512 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONgg = 25003 -- dont change
local TEMPO_RESPgg = 10 * 60 -- em segundos -- respawn time

function onTime()

local bossgg = 0
for x = roomgg.fromx, roomgg.tox do
for y = roomgg.fromy, roomgg.toy do
for z = roomgg.z, roomgg.z do

creaturegg = {x = x, y = y, z = z}
mobgg = getTopCreature(creaturegg).uid

    if getCreatureName(mobgg) == BOSSgg then
        bossgg = 1
    end
end
end
end

if bossgg == 1 then
end

if bossgg == 0 then
 local monster = Game.createMonster("Jaul", Position(1758, 92, 10))
 monster:setReward(true)


end

return true
end
