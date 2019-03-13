local config = {
	[1] = Position(299, 1540, 8),
	[2] = Position(448, 1417, 8),
	[3] = Position(381, 1545, 8),
	[4] = Position(204, 1437, 8)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if isInArray({7911, 7912}, item.itemid) then
		local gemCount = player:getStorageValue(Storage.ElementalSphere.MachineGemCount)
		if isInArray({329, 330}, toPosition.x) and toPosition.y == 643 and toPosition.z == 8 and gemCount >= 20 then
			player:setStorageValue(Storage.ElementalSphere.MachineGemCount, gemCount - 20)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config[player:getVocation():getBase():getId()], false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
		toPosition.x = toPosition.x + (item.itemid == 7911 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7911 and 7912 or 7911)
			if thing then
				thing:transform(thing.itemid + 4)
			end
		end
		item:transform(item.itemid + 4)
	else
		toPosition.x = toPosition.x + (item.itemid == 7915 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7915 and 7916 or 7915)
			if thing then
				thing:transform(thing.itemid - 4)
			end
		end
		item:transform(item.itemid - 4)
	end
	return true
end