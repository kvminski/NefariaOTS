local config = {
	{position = Position(331, 648, 8), itemid = 8300, toPosition = Position(336, 648, 9), vocationId = 3},
	{position = Position(329, 651, 8), itemid = 8305, toPosition = Position(330, 654, 9), vocationId = 2},
	{position = Position(327, 648, 8), itemid = 8306, toPosition = Position(327, 648, 9), vocationId = 4},
	{position = Position(329, 646, 8), itemid = 8304, toPosition = Position(330, 645, 9), vocationId = 1}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		item:transform(1945)
		return true
	end

	if player:getPosition() ~= Position(331, 648, 8) then
		return false
	end

	local spectators = Game.getSpectators(Position(332, 650, 9), false, true, 21, 21, 21, 21)
	if #spectators > 0 or Game.getStorageValue(GlobalStorage.ElementalSphere.BossRoom) > 0 then
		player:say('Wait for the current team to exit.', TALKTYPE_MONSTER_SAY, false, 0, Position(329, 648, 8))
		return true
	end

	local players = {}
	for i = 1, #config do
		local creature = Tile(config[i].position):getTopCreature()
		if not creature or not creature:isPlayer() then
			player:say('You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.', TALKTYPE_MONSTER_SAY, false, 0, Position(329, 648, 8))
			return true
		end

		local vocationId = creature:getVocation():getBase():getId()
		if vocationId ~= config[i].vocationId or creature:getItemCount(config[i].itemid) < 1 or creature:getStorageValue(Storage.ElementalSphere.QuestLine) < 1 then
			player:say('You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.', TALKTYPE_MONSTER_SAY, false, 0, Position(329, 648, 8))
			return true
		end

		players[#players + 1] = creature
	end

	for i = 1, #players do
		players[i]:teleportTo(config[i].toPosition)
		config[i].position:sendMagicEffect(CONST_ME_TELEPORT)
		config[i].toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	item:transform(item.itemid + 1)
	return true
end
