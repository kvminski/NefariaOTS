function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Cannot use opened door
	if item.itemid == 9178 then
		return false
	end

	if item.uid == 9677 and item.itemid == 9177 then
		if player:getStorageValue(40171) == 1 then
			item:transform(item.itemid + 1)
		player:teleportTo(toPosition, true)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have not looted the chest in the sewers.')
		end
	end
	return true
end
