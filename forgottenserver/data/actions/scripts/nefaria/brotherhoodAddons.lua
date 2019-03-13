function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = 55005
		if storage > 65535 then
			return false
		end

	local player = Player(cid)
	if player:getStorageValue(storage) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have Nightmare or Brotherhood outfit.')
		return true
	end

	player:addExperience(50000, true)
	player:addOutfitAddon(279, 3)
	player:addOutfitAddon(278, 3)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have picked Full Brotherhood outfit.')
	player:setStorageValue(storage, 1)
	return true
end