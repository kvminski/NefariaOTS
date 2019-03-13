local config = {
	[28810] = Position(1749, 1220, 8),
	[28811] = Position(1763, 1229, 8),
	[28812] = Position(1766, 1213, 8),
	[28813] = Position(1777, 1202, 8),
	[28814] = Position(1762, 1223, 8),
	[28815] = Position(1776, 1229, 8),
	[28816] = Position(1780, 1202, 8),
	[28817] = Position(1778, 1195, 8),
	[28818] = Position(1777, 1224, 8)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	return true
end
