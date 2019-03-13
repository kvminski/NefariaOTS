local destinations = {
	[3140] = {teleportPosition = Position(946, 1890, 9), storage = 955, value = 1},
	[3141] = {teleportPosition = Position(961, 1911, 10), storage = 956, value = 2},
	[3142] = {teleportPosition = Position(939, 1877, 11), storage = 957, value = 3},
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local destination = destinations[item.uid]
	if not destination then
		return true
	end
	
	if player:getStorageValue(destination.storage) > os.time() then -- add luanluciano
		player:teleportTo(fromPosition)
		return true
	end

	player:teleportTo(destination.teleportPosition)
	destination.teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
