local BOSSoo = "Tanjis" -- boss name
local BOSS_POSoo = {x = 1880, y = 90, z = 9} -- boss spawn coord 
local roomoo = {fromx = 1866, tox = 1889, fromy = 78, toy = 103, z = 9} -- boss room
local BOSS_GLOBAL_STORAGEoo = 80511 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONoo = 25002 -- dont change
local TEMPO_RESPoo = 10 * 60 -- em segundos -- respawn time

function onTime()
--function onThink(interval, lastExecution)

local bossoo = 0
for x = roomoo.fromx, roomoo.tox do
for y = roomoo.fromy, roomoo.toy do
for z = roomoo.z, roomoo.z do

creatureoo = {x = x, y = y, z = z}
moboo = getTopCreature(creatureoo).uid

    if getCreatureName(moboo) == BOSSoo then
        bossoo = 1
    end
end
end
end

if bossoo == 1 then
end

if bossoo == 0 then
  local monster2 = Game.createMonster("Tanjis", Position(1880, 90, 9))
 monster2:setReward(true)
end

return true
end
