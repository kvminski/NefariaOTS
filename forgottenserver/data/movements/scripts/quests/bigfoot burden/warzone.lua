local bosses = {
	[3144] = {position = Position(1049, 1918, 9), name = 'deathstrike'},
	[3145] = {position = Position(1053, 1919, 10), name = 'gnomevil'},
	[3146] = {position = Position(1031, 1870, 11), name = 'abyssador', checkItemId = 18463},
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if boss.checkItemId then
		if Tile(position):getItemById(boss.checkItemId) then
			return true
		end
	end

	player:teleportTo(boss.position)
	boss.position:sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have half an hour to heroically defeat ' .. boss.name .. '. Otherwise you\'ll be teleported out by the gnomish emergency device.')
	return true
end
