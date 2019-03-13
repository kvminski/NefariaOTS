local t = {
depot = {x = 1032, y = 1873, z = 11},
}

function onStepIn(cid, item, position, lastPosition)
if not isPlayer(cid) then
        return false
    end
doTeleportThing(cid, t.depot)
doSendMagicEffect(t.depot, CONST_ME_TELEPORT)


end