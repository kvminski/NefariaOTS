function onKill(cid, target)


if (string.lower(getCreatureName(target)) == "Parasite" and getGlobalStorageValue(3144) < 100) then
pos = {
{x = 1047, y = 1944, z = 10},
{x = 1047, y = 1945, z = 10},
{x = 1047, y = 1946, z = 10},
{x = 1047, y = 1947, z = 10} 
}
barrier = false
for i = 1, 4 do
if(getCreaturePosition(target).x == pos.x and
getCreaturePosition(target).y == pos.y and
getCreaturePosition(target).z == pos.z
) then
barrier = true
end
end
last = false
if(barrier == true) then
for i = 1, 4 do
barrier = {
{x = 1048, y = 1944, z = 10},
{x = 1048, y = 1945, z = 10},
{x = 1048, y = 1946, z = 10},
{x = 1048, y = 1947, z = 10}
}
if(getTileItemById(barrier, 18459).uid > 0) then
doTransformItem(getTileItemById(barrier, 18459).uid, getTileItemById(barrier, 18459), 19460, 1)
elseif(getTileItemById(barrier, 18460).uid > 0) then
doTransformItem(getTileItemById(barrier, 18460).uid, getTileItemById(barrier, 18459), 19461, 1)
elseif(getTileItemById(barrier, 18459).uid > 0) then
doRemoveItem(getTileItemById(barrier, 18461).uid, 1)
addEvent(doCreateItem, 30 * 60 * 1000, 18459, 1, barrier)
last = true
end
end
end
if(barrier == true and last == true) then
setGlobalStorageValue(3144, 1)
addEvent(setGlobalStorageValue, 30 * 60 * 1000, 3144, 0)
end
end
return true
end