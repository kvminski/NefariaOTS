local t = {
depot = {x = 1065, y = 1067, z = 7},
}

function onStepIn(cid, item, position, lastPosition)

doTeleportThing(cid, t.depot)
doSendMagicEffect(t.depot, CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You left last man standing event!")
setPlayerStorageValue(cid, 25001, 0)
setGlobalStorageValue(25002,getGlobalStorageValue(25002)-1)


end