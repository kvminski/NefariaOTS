local spheres = {
	[8300] = {3, 7},
	[8304] = {1, 5},
	[8305] = {2, 6},
	[8306] = {4, 8}
}

local globalTable = {
	[1] = 10005,
	[2] = 10006,
	[3] = 10007,
	[4] = 10008
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray({7917, 7918, 7913, 7914}, target.itemid) then
		return false
	end

	if not isInRange(toPosition, {x=311, y=628, z=9}, {x=355, y=670, z=9}) then
		return false
	end

	if not isInArray(spheres[item.itemid], player:getVocation():getId()) then
		return false
	end

	if isInArray({7917, 7918}, target.itemid) then
		player:say('Turn off the machine first.', TALKTYPE_MONSTER_SAY)
		return true
	end

	toPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
	Game.setStorageValue(globalTable[player:getVocation():getBase():getId()], 1)
	item:remove(1)
	return true
end