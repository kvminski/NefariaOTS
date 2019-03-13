local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creature.uid)) then
                    return true
                end
            end
        end
    end
    return false
end



function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
        if(itemEx.itemid == 24733) then 
	        if player:getStorageValue(1) and not isPlayerInArea({x = 998, y = 769, z = 9, stackpos = 255}, {x = 1021, y = 789, z = 9, stackpos = 255}) then
				pos1 = {x = 1024, y = 780, z = getCreaturePosition(cid).z} -- {x = 32270, y = 32180, z = 8}
				pos2 = {x = 1023, y = 780, z = getCreaturePosition(cid).z} -- {x = 32269, y = 32180, z = 8}
				
				
				
				
				
				-- team 1
				if(isPlayer(getTopCreature(pos1).uid)) then
				if(isPlayer(getTopCreature(pos2).uid)) then
				
				
				
				
				-- team 1
					doTeleportThing(getTopCreature(pos1).uid, {x = 1001, y = 778, z = 9})
					doTeleportThing(getTopCreature(pos2).uid, {x = 1018, y = 778, z = 9})
					
	       
				
		doRemoveItem(item.uid, 1)
		else doCreatureSay(cid, "You need 2 players for enter in Arena.", TALKTYPE_ORANGE_1)
			end
		    	  
     
else doCreatureSay(cid, "You need 2 players for enter in Arena.", TALKTYPE_ORANGE_1)
end
else doCreatureSay(cid, "Please wait for the fighters come out of the arena.", TALKTYPE_ORANGE_1)
end 

end
	return true
end

