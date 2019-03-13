local destination = {
	[4121] = {position = Position(888, 1727, 8), storageValue = 1, needCrystal = false},
	--[3220] = {position = Position(32627, 31863, 11), storageValue = 1, needCrystal = false},
	[3128] = {position = Position(955, 1776, 8), storageValue = 14},
	[3129] = {position = Position(876, 1726, 8), storageValue = 14},
	[3130] = {position = Position(1011, 1715, 8), storageValue = 15},
	[3131] = {position = Position(884, 1710, 8), storageValue = 15},
	[3132] = {position = Position(936, 1830, 8), storageValue = 1}, -- Gnomebase Alpha
	[3133] = {position = Position(877, 1745, 8), storageValue = 1}, -- City
	[3134] = {position = Position(909, 1921, 8), storageValue = 16}, -- Golems
	[3135] = {position = Position(951, 1883, 8), storageValue = 16}, -- Gnomebase Alpha
	[3136] = {position = Position(811, 1835, 8), storageValue = 16},
	[3137] = {position = Position(929, 1875, 8), storageValue = 16},
	[35669] = {position = Position(936, 1832, 8), storageValue = 1}, -- leave warzone 3
	[3215] = {position = Position(966, 713, 8), storageValue = 1, needCrystal = false}, --TEMPLE
	--[3216] = {position = Position(32212, 31133, 7), storageValue = 1, needCrystal = false},
	--[3217] = {position = Position(32317, 32825, 7), storageValue = 1, needCrystal = false},
	--[3218] = {position = Position(33213, 32454, 1), storageValue = 1, needCrystal = false},
	--[3219] = {position = Position(33217, 31814, 8), storageValue = 1, needCrystal = false}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleportCrystal = destination[item.actionid]
	if not teleportCrystal then
		return
	end

	if player:getStorageValue(Storage.BigfootBurden.QuestLine) < 1 then -- add by luanluciano
		player:setStorageValue(Storage.BigfootBurden.QuestLine, 1) -- add by luanluciano
	end -- add by luanluciano


	if player:getStorageValue(Storage.BigfootBurden.QuestLine) >= teleportCrystal.storageValue then
		if not teleportCrystal.needCrystal or player:removeItem(18457, 1) then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(teleportCrystal.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need a teleport crystal to use this device.')
		end
		return true
	end

	-- There is no destination with storageValue == 2, should this check for storage?
	if teleportCrystal.storageValue == 2 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have no idea on how to use this device. Xelvar in Kazordoon might tell you more about it.')
	else
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Sorry, you don\'t have access to use this teleport!')
	end
	return true
end
