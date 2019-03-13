local portals = {
	--Thais
	[9073] = {position = Position(803, 760, 8), vocation = 2, storage = 10018}, --ice
	[9074] = {position = Position(775, 762, 8), vocation = 2, storage = 10018}, --earth
	[9075] = {position = Position(772, 790, 8), vocation = 1, storage = 10018}, --fire
	[9076] = {position = Position(803, 787, 8), vocation = 1, storage = 10018}, --electric
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if not portal or player:getVocation():getBase():getId() ~= portal.vocation or player:getLevel() < 30 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Only ' .. (portal.vocation == 1 and 'Sorcerers' or 'Druids') .. ' of level 30 or higher may enter this portal.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(portal.position)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(portal.storage, 1)
	return true
end
