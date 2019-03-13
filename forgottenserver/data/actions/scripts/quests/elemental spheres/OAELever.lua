local config = {
	exitPosition = Position(329, 649, 8),
	area = {
		from = Position(311, 628, 9),
		to = Position(355, 670, 9)
	},
	positions = {
		Position(334, 652, 9),
		Position(329, 652, 9),
		Position(329, 647, 9),
		Position(334, 647, 9)
	},
	leverPositions = {
		Position(335, 647, 9),
		Position(335, 652, 9),
		Position(328, 652, 9),
		Position(328, 647, 9)
	},
	walls = {
		{from = Position(338, 648, 9), to = Position(338, 652, 9), wallId = 5072, soundPosition = Position(338, 650, 9)},
		{from = Position(330, 656, 9), to = Position(334, 656, 9), wallId = 5071, soundPosition = Position(332, 656, 9)},
		{from = Position(325, 648, 9), to = Position(325, 652, 9), wallId = 5072, soundPosition = Position(325, 650, 9)},
		{from = Position(330, 643, 9), to = Position(334, 643, 9), wallId = 5071, soundPosition = Position(332, 643, 9)}
	},
	roomArea = {
		from = Position(326, 644, 9),
		to = Position(337, 655, 9)
	},
	machineStorages = {GlobalStorage.ElementalSphere.Machine1, GlobalStorage.ElementalSphere.Machine2, GlobalStorage.ElementalSphere.Machine3, GlobalStorage.ElementalSphere.Machine4},
	centerPosition = Position(331, 650, 9),
	effectPositions = {
		Position(327, 645, 9), Position(328, 646, 9), Position(329, 647, 9),
		Position(330, 648, 9), Position(331, 649, 9), Position(332, 650, 9),
		Position(333, 651, 9), Position(334, 652, 9), Position(335, 653, 9),
		Position(336, 654, 9), Position(336, 645, 9), Position(335, 646, 9),
		Position(334, 647, 9), Position(333, 648, 9), Position(332, 649, 9),
		Position(331, 650, 9), Position(330, 651, 9), Position(329, 652, 9),
		Position(328, 653, 9), Position(327, 654, 9)
	}
}


local function resetRoom(players)
	for i = 1, #players do
		local player = Player(players[i])
		if player and isInRange(player:getPosition(), config.area.from, config.area.to) then
			player:teleportTo(config.exitPosition)
			config.exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end
	end

	for i = 1, #config.walls do
		local wall = config.walls[i]
		for x = wall.from.x, wall.to.x do
			for y = wall.from.y, wall.to.y do
				local wallItem = Tile(Position(x, y, wall.from.z)):getItemById(wall.wallId)
				if wallItem then
					wallItem:remove()
				end
			end
		end
	end

	local creature = Creature('lord of the elements')
	if creature then
		creature:remove()
	end

	for i = 1, #config.leverPositions do
		local leverItem = Tile(config.leverPositions[i]):getItemById(1946)
		if leverItem then
			leverItem:transform(1945)
		end
	end

	Game.setStorageValue(GlobalStorage.ElementalSphere.BossRoom, -1)
	for i = 1, #config.machineStorages do
		Game.setStorageValue(config.machineStorages[i], -1)
	end
	return true
end

local function warnPlayers(players)
	local player
	for i = 1, #players do
		player = Player(players[i])
		if player and isInRange(player:getPosition(), config.roomArea.from, config.roomArea.to) then
			break
		end
		player = nil
	end

	if not player then
		return
	end

	player:say('You have 5 minutes from now on until you get teleported out.', TALKTYPE_MONSTER_YELL, false, 0, Position(331, 649, 10))
end

local function areMachinesCharged()
	for i = 1, #config.machineStorages do
		if Game.getStorageValue(config.machineStorages[i]) <= 0 then
			return false
		end
	end
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return true
	end

	for i = 1, #config.machineStorages do
		Game.setStorageValue(config.machineStorages[i], 1)
	end

	if not areMachinesCharged() then
		return false
	end

	local index = table.find(config.positions, player:getPosition())
	if not index then
		return false
	end

	item:transform(1946)
	local leverCount = 0
	for i = 1, #config.leverPositions do
		if Tile(config.leverPositions[i]):getItemById(1946) then
			leverCount = leverCount + 1
		end
	end

	local walls = config.walls[index]
	for x = walls.from.x, walls.to.x do
		for y = walls.from.y, walls.to.y do
			Game.createItem(walls.wallId, 1, Position(x, y, walls.from.z))
		end
	end
	player:say('ZOOOOOOOOM', TALKTYPE_MONSTER_SAY, false, 0, walls.soundPosition)

	if leverCount ~= #config.leverPositions then
		return true
	end

	local players = {}
	for i = 1, #config.positions do
		local creature = Tile(config.positions[i]):getTopCreature()
		if creature then
			players[#players + 1] = creature.uid
		end
	end

	Game.setStorageValue(GlobalStorage.ElementalSphere.BossRoom, 1)
	Game.createMonster('Lord of the Elements', config.centerPosition)
	player:say('You have 10 minutes from now on until you get teleported out.', TALKTYPE_MONSTER_YELL, false, 0, config.centerPosition)
	addEvent(warnPlayers, 5 * 60 * 1000, players)
	addEvent(resetRoom, 10 * 60 * 1000, players)

	for i = 1, #config.effectPositions do
		config.effectPositions[i]:sendMagicEffect(CONST_ME_ENERGYHIT)
	end
	return true
end
