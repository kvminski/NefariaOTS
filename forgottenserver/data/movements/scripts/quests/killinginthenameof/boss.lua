local function roomIsOccupied(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(centerPosition, false, true, rangeX, rangeX, rangeY, rangeY)
	if #spectators ~= 0 then
		return true
	end

	return false
end

function clearBossRoom(playerId, bossId, centerPosition, rangeX, rangeY, exitPosition)
	local spectators, spectator = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isPlayer() and spectator.uid == playerId then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end

		if spectator:isMonster() and spectator.uid == bossId then
			spectator:remove()
		end
	end
end

local bosses = {
	[3260] = {bossName = 'the snapper', storage = 35000, playerPosition = Position(872, 738, 12), bossPosition = Position(880, 738, 12), centerPosition = Position(876, 738, 12), rangeX = 4, rangeY = 4, flamePosition = Position(870, 732, 12)},
	[3231] = {bossName = 'hide', storage = 35001, playerPosition = Position(921, 738, 12), bossPosition = Position(929, 738, 12), centerPosition = Position(924, 738, 12), rangeX = 4, rangeY = 4, flamePosition = Position(919, 732, 12)},
	[3232] = {bossName = 'deathbine', storage = 35002, playerPosition = Position(897, 738, 12), bossPosition = Position(905, 738, 12), centerPosition = Position(901, 738, 12), rangeX = 4, rangeY = 4, flamePosition = Position(895, 732, 12)},
	[3233] = {bossName = 'the bloodtusk', storage = 35003, playerPosition = Position(948, 738, 12), bossPosition = Position(955, 738, 12), centerPosition = Position(951, 738, 12), rangeX = 4, rangeY = 4, flamePosition = Position(945, 732, 12)},
	[3234] = {bossName = 'shardhead', storage = 35004, playerPosition = Position(973, 738, 12), bossPosition = Position(980, 738, 12), centerPosition = Position(976, 738, 12), rangeX = 4, rangeY = 4, flamePosition = Position(970, 732, 12)},
	[3235] = {bossName = 'esmeralda', storage = 35005, playerPosition = Position(897, 763, 12), bossPosition = Position(905, 763, 12), centerPosition = Position(901, 763, 12), rangeX = 4, rangeY = 4, flamePosition = Position(895, 757, 12)},
	[3236] = {bossName = 'fleshcrawler', storage = 35006, playerPosition = Position(872, 763, 12), bossPosition = Position(880, 763, 12), centerPosition = Position(876, 763, 12), rangeX = 4, rangeY = 4, flamePosition = Position(870, 757, 12)},
	[3237] = {bossName = 'ribstride', storage = 35007, playerPosition = Position(996, 763, 12), bossPosition = Position(1004, 763, 12), centerPosition = Position(1000, 763, 12), rangeX = 4, rangeY = 4, flamePosition = Position(994, 757, 12)},
	[3238] = {bossName = 'the bloodweb', storage = 35008, playerPosition = Position(997, 738, 12), bossPosition = Position(1004, 738, 12), centerPosition = Position(1000, 738, 12), rangeX = 4, rangeY = 4, flamePosition = Position(994, 732, 12)},
	[3239] = {bossName = 'thul', storage = 35009, playerPosition = Position(872, 789, 12), bossPosition = Position(880, 789, 12), centerPosition = Position(876, 789, 12), rangeX = 4, rangeY = 4, flamePosition = Position(870, 783, 12)},
	[3240] = {bossName = 'the old widow', storage = 35010, playerPosition = Position(972, 763, 12), bossPosition = Position(980, 763, 12), centerPosition = Position(976, 763, 12), rangeX = 4, rangeY = 4, flamePosition = Position(970, 757, 12)},
	[3241] = {bossName = 'hemming', storage = 35011, playerPosition = Position(947, 763, 12), bossPosition = Position(955, 763, 12), centerPosition = Position(951, 763, 12), rangeX = 4, rangeY = 4, flamePosition = Position(945, 757, 12)},
	[3242] = {bossName = 'tormentor', storage = 35012, playerPosition = Position(996, 789, 12), bossPosition = Position(1004, 789, 12), centerPosition = Position(1000, 789, 12), rangeX = 4, rangeY = 4, flamePosition = Position(994, 783, 12)},
	[3243] = {bossName = 'flameborn', storage = 35013, playerPosition = Position(897, 789, 12), bossPosition = Position(905, 789, 12), centerPosition = Position(901, 789, 12), rangeX = 4, rangeY = 4, flamePosition = Position(895, 783, 12)},
	[3244] = {bossName = 'fazzrah', storage = 35014, playerPosition = Position(921, 789, 12), bossPosition = Position(929, 789, 12), centerPosition = Position(925, 789, 12), rangeX = 4, rangeY = 4, flamePosition = Position(919, 783, 12)},
	[3245] = {bossName = 'tromphonyte', storage = 35015, playerPosition = Position(921, 763, 12), bossPosition = Position(929, 763, 12), centerPosition = Position(925, 763, 12), rangeX = 4, rangeY = 4, flamePosition = Position(919, 757, 12)},
	[3246] = {bossName = 'sulphur scuttler', storage = 35016, playerPosition = Position(947, 789, 12), bossPosition = Position(955, 789, 12), centerPosition = Position(951, 789, 12), rangeX = 4, rangeY = 4, flamePosition = Position(945, 783, 12)},
	[3247] = {bossName = 'bruise payne', storage = 35017, playerPosition = Position(972, 789, 12), bossPosition = Position(980, 789, 12), centerPosition = Position(976, 789, 12), rangeX = 4, rangeY = 4, flamePosition = Position(970, 783, 12)},
	[3248] = {bossName = 'the many', storage = 35018, playerPosition = Position(897, 815, 12), bossPosition = Position(905, 815, 12), centerPosition = Position(901, 815, 12), rangeX = 4, rangeY = 4, flamePosition = Position(895, 809, 12)},
	[3249] = {bossName = 'the noxious spawn', storage = 35019, playerPosition = Position(921, 815, 12), bossPosition = Position(929, 815, 12), centerPosition = Position(925, 815, 12), rangeX = 4, rangeY = 4, flamePosition = Position(919, 809, 12)},
	[3250] = {bossName = 'gorgo', storage = 35020, playerPosition = Position(947, 815, 12), bossPosition = Position(955, 815, 12), centerPosition = Position(951, 815, 12), rangeX = 4, rangeY = 4, flamePosition = Position(945, 809, 12)},
	[3251] = {bossName = 'stonecracker', storage = 35021, playerPosition = Position(972, 815, 12), bossPosition = Position(980, 815, 12), centerPosition = Position(976, 815, 12), rangeX = 4, rangeY = 4, flamePosition = Position(970, 809, 12)},
	[3252] = {bossName = 'leviathan', storage = 35022, playerPosition = Position(897, 841, 12), bossPosition = Position(905, 841, 12), centerPosition = Position(901, 841, 12), rangeX = 4, rangeY = 4, flamePosition = Position(895, 835, 12)},
	[3253] = {bossName = 'kerberos', storage = 35023, playerPosition = Position(921, 841, 12), bossPosition = Position(929, 841, 12), centerPosition = Position(925, 841, 12), rangeX = 4, rangeY = 4, flamePosition = Position(919, 835, 12)},
	[3254] = {bossName = 'ethershreck', storage = 35024, playerPosition = Position(947, 841, 12), bossPosition = Position(955, 841, 12), centerPosition = Position(951, 841, 12), rangeX = 4, rangeY = 4, flamePosition = Position(945, 835, 12)},
	[3255] = {bossName = 'paiz the pauperizer', storage = 35025, playerPosition = Position(972, 841, 12), bossPosition = Position(980, 841, 12), centerPosition = Position(976, 841, 12), rangeX = 4, rangeY = 4, flamePosition = Position(970, 835, 12)},
	[3256] = {bossName = 'bretzecutioner', storage = 35026, playerPosition = Position(996, 815, 12), bossPosition = Position(1004, 815, 12), centerPosition = Position(1000, 815, 12), rangeX = 4, rangeY = 4, flamePosition = Position(994, 809, 12)},
	[3257] = {bossName = 'zanakeph', storage = 35027, playerPosition = Position(996, 841, 12), bossPosition = Position(1004, 841, 12), centerPosition = Position(1000, 841, 12), rangeX = 4, rangeY = 4, flamePosition = Position(994, 835, 12)},

	[3258] = {bossName = 'tiquandas revenge', storage = Storage.KillingInTheNameOf.TiquandasRevengeTeleport, playerPosition = Position(872, 815, 12), bossPosition = Position(880, 815, 12), centerPosition = Position(876, 815, 12), rangeX = 4, rangeY = 4, flamePosition = Position(870, 809, 12)},
	[3259] = {bossName = 'demodras', storage = Storage.KillingInTheNameOf.DemodrasTeleport, playerPosition = Position(872, 841, 12), bossPosition = Position(880, 841, 12), centerPosition = Position(876, 841, 12), rangeX = 4, rangeY = 4, flamePosition = Position(870, 835, 12)},
	[17521] = {bossName = 'necropharus', storage = 17521, playerPosition = Position(872, 867, 12), bossPosition = Position(880, 867, 12), centerPosition = Position(876, 867, 12), rangeX = 4, rangeY = 4, flamePosition = Position(870, 861, 12)},
	[17522] = {bossName = 'the horned fox', storage = 17522, playerPosition = Position(897, 867, 12), bossPosition = Position(905, 867, 12), centerPosition = Position(901, 867, 12), rangeX = 4, rangeY = 4, flamePosition = Position(895, 861, 12)},

	[17523] = {bossName = 'lethal lissy', storage = 17523, playerPosition = Position(31976, 32896, 0), bossPosition = Position(31983, 32897, 0), centerPosition = Position(31982, 32897, 0), rangeX = 4, rangeY = 4, flamePosition = Position(31987, 32896, 0)}

	}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if not boss then
		return true
	end

	if player:getStorageValue(boss.storage) ~= 1 or roomIsOccupied(boss.centerPosition, boss.rangeX, boss.rangeY) then
		player:teleportTo(fromPosition)
		return true
	end

	player:setStorageValue(boss.storage, 0)
	player:teleportTo(boss.playerPosition)
	boss.playerPosition:sendMagicEffect(CONST_ME_TELEPORT)

	local monster = Game.createMonster(boss.bossName, boss.bossPosition)
	if not monster then
		return true
	end

	addEvent(clearBossRoom, 60 * 10 * 1000, player.uid, monster.uid, boss.centerPosition, boss.rangeX, boss.rangeY, fromPosition)
	player:say('You have ten minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
	return true
end
