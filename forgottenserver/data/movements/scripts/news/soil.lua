local portals1 = {
	
	--Soils
	[24541] = {position = Position(202, 1437, 8), vocation = 4, storage = 10130}, -- EK 
	[24542] = {position = Position(380, 1542, 8), vocation = 3, storage = 10131}, -- RP 
	[24543] = {position = Position(447, 1416, 8), vocation = 2, storage = 10132}, -- ED 
	[24544] = {position = Position(298, 1539, 8), vocation = 1, storage = 10133} -- SORC 
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals1[item.uid]
	if not portal or player:getVocation():getBase():getId() ~= portal.vocation or player:getLevel() < 10 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Your vocation cant enter in this portal.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(portal.position)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(portal.storage, 1)
	return true
end


---- ENTRADA