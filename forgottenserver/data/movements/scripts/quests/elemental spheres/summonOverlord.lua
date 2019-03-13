local config = {
	[8568] = {
		storage = GlobalStorage.ElementalSphere.KnightBoss,
		corpse = 8967,
		charged = 1495,
		inactive = 0,
		boss = 'Energy Overlord',
		effect = CONST_ME_BIGCLOUDS,
		summonPos = Position(212, 1530, 8),
		positions = {
			Position(211, 1530, 8),
			Position(214, 1530, 8),
			Position(216, 1532, 8),
			Position(216, 1535, 8),
			Position(214, 1537, 8),
			Position(211, 1537, 8),
			Position(209, 1535, 8),
			Position(209, 1532, 8)
		}
	},
	[8569] = {
		storage = GlobalStorage.ElementalSphere.SorcererBoss,
		corpse = 8969,
		charged = 8575,
		inactive = 8573,
		boss = 'Fire Overlord',
		effect = CONST_ME_FIREAREA,
		summonPos = Position(316, 1450, 8),
		positions = {
			Position(315, 1450, 8),
			Position(318, 1450, 8),
			Position(320, 1448, 8),
			Position(320, 1445, 8),
			Position(318, 1443, 8),
			Position(315, 1443, 8),
			Position(313, 1445, 8),
			Position(313, 1448, 8)
		}
	},
	[8570] = {
		storage = GlobalStorage.ElementalSphere.PaladinBoss,
		corpse = 8968,
		charged = 8574,
		inactive = 8571,
		boss = 'Ice Overlord',
		effect = CONST_ME_ICETORNADO,
		summonEffect = CONST_ME_ICEAREA,
		summonPos = Position(403, 1445, 8),
		positions = {
			Position(402, 1445, 8),
			Position(405, 1445, 8),
			Position(407, 1443, 8),
			Position(407, 1440, 8),
			Position(405, 1438, 8),
			Position(402, 1438, 8),
			Position(400, 1440, 8),
			Position(400, 1443, 8)
		}
	},
	[8578] = {
		storage = GlobalStorage.ElementalSphere.DruidBoss,
		corpse = 8934,
		charged = 8576,
		inactive = 8572,
		boss = 'Earth Overlord',
		effect = CONST_ME_BIGPLANTS,
		summonPos = Position(464, 1544, 8),
		positions = {
			Position(463, 1544, 8),
			Position(466, 1544, 8),
			Position(468, 1546, 8),
			Position(468, 1549, 8),
			Position(466, 1551, 8),
			Position(463, 1551, 8),
			Position(461, 1549, 8),
			Position(461, 1546, 8)
		}
	}
}

function onAddItem(moveitem, tileitem, position)
	local target = config[tileitem.itemid]
	if not target then
		return true
	end

	local cStorage = target.storage
	if target.corpse ~= moveitem.itemid or Game.getStorageValue(cStorage) == 1 then
		return true
	end

	for i = 1, #target.positions do
		if not Tile(target.positions[i]):getItemById(target.charged) then
			return true
		end
	end

	moveitem:remove()
	position:sendMagicEffect(target.effect)
	target.summonPos:sendMagicEffect(target.summonEffect or target.effect)
	Game.createMonster(target.boss, target.summonPos)
	Game.setStorageValue(cStorage, 1)
	return true
end
