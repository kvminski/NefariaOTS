local BOSSkk = "Obujos" -- boss name
local BOSS_POSkk = {x = 1714, y = 168, z = 10} -- boss spawn coord
local roomkk = {fromx = 1695, tox = 1722, fromy = 158, toy = 180, z = 10} -- boss room
local BOSS_GLOBAL_STORAGEkk = 80510 -- dont change
local BOSS_GLOBAL_STORAGE_SUMMONkk = 25001 -- dont change
local TEMPO_RESPkk = 10 * 60 -- em segundos -- respawn time

function onTime()
--function onThink(interval, lastExecution)

local bosskk = 0
for x = roomkk.fromx, roomkk.tox do
for y = roomkk.fromy, roomkk.toy do
for z = roomkk.z, roomkk.z do

creaturekk = {x = x, y = y, z = z}
mobkk = getTopCreature(creaturekk).uid

    if getCreatureName(mobkk) == BOSSkk then
        bosskk = 1
    end
end
end
end

if bosskk == 1 then
end

if bosskk == 0 then
   local monster1 = Game.createMonster("Obujos", Position(1714, 168, 10))
 monster1:setReward(true)
end

return true
end
