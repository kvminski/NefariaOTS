function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = 55008
		if storage > 65535 then
			return false
		end

	local player = Player(cid)
	if player:getStorageValue(storage) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have Good or Evil addon.')
		return true
	end

	player:addExperience(50000, true)
	player:addOutfitAddon(324, 2)
	player:addOutfitAddon(325, 2)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have picked Evil addon.')
	player:setStorageValue(storage, 1)
	return true
end