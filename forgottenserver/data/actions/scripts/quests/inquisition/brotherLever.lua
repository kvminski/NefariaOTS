local config = {
	[9017] = {
		wallPositions = {
			Position(1822, 1674, 11),
			Position(1823, 1674, 11),
			Position(1824, 1674, 11),
			Position(1825, 1674, 11),
			Position(1826, 1674, 11),
			Position(1827, 1674, 11),
			Position(1828, 1674, 11),
			Position(1829, 1674, 11),
			Position(1830, 1674, 11),
			Position(1831, 1674, 11),
			Position(1832, 1674, 11),
			Position(1833, 1674, 11),
			Position(1834, 1674, 11)
		},
		wallDown = 1524,
		wallUp = 1050
	},
	[9018] = {
		wallPositions = {
			Position(1819, 1677, 11),
			Position(1819, 1678, 11),
			Position(1819, 1679, 11),
			Position(1819, 1680, 11),
			Position(1819, 1681, 11),
			Position(1819, 1682, 11),
			Position(1819, 1683, 11)
		},
		wallDown = 1526,
		wallUp = 1049
	},
	[9019] = {
		wallPositions = {
			Position(1822, 1686, 11),
			Position(1823, 1686, 11),
			Position(1824, 1686, 11),
			Position(1825, 1686, 11),
			Position(1826, 1686, 11),
			Position(1827, 1686, 11),
			Position(1828, 1686, 11),
			Position(1829, 1686, 11),
			Position(1830, 1686, 11),
			Position(1831, 1686, 11),
			Position(1832, 1686, 11),
			Position(1833, 1686, 11),
			Position(1834, 1686, 11)
		},
		wallDown = 1524,
		wallUp = 1050
	},
	[9020] = {
		wallPositions = {
			Position(1837, 1677, 11),
			Position(1837, 1678, 11),
			Position(1837, 1679, 11),
			Position(1837, 1680, 11),
			Position(1837, 1681, 11),
			Position(1837, 1682, 11),
			Position(1837, 1683, 11)
		},
		wallDown = 1526,
		wallUp = 1049
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetLever = config[item.uid]
	if not targetLever then
		return true
	end

	local tile, thing
	for i = 1, #targetLever.wallPositions do
		tile = Tile(targetLever.wallPositions[i])
		if tile then
			thing = tile:getItemById(item.itemid == 1945 and targetLever.wallDown or targetLever.wallUp)
			if thing then
				thing:transform(item.itemid == 1945 and targetLever.wallUp or targetLever.wallDown)
			end
		end
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end