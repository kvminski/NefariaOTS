function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Cannot use opened door
	if item.itemid == 19991 then
		return false
	end

	if item.uid == 9680 and item.itemid == 19989 then
		if player:getStorageValue(40199) == 1 then
			item:transform(item.itemid + 1)
		player:teleportTo(toPosition, true)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have not looted the chest on the Roshamuul Mountain.')
		end
	end
	return true
end
