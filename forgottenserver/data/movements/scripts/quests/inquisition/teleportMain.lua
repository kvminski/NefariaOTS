local teleports = {
	[2150] = {text = 'Entering Ushuriel\'s ward.', newPos = Position(1818, 1764, 11), storage = 0, alwaysSetStorage = true}, -- to ushuriel ward
	[2151] = {text = 'Entering the Crystal Caves.', bossStorage = 200, newPos = Position(1892, 1747, 12), storage = 1}, -- from ushuriel ward
	[2152] = {text = 'Escaping back to the Retreat.', newPos = Position(1595, 1556, 11)}, -- from crystal caves
	[2153] = {text = 'Entering the Crystal Caves.', newPos = Position(1892, 1747, 12), storage = 1}, -- to crystal caves
	[2154] = {text = 'Entering the Sunken Caves.', newPos = Position(1891, 1656, 12)}, -- to sunken caves
	[2155] = {text = 'Entering the Mirror Maze of Madness.', newPos = Position(1887, 1728, 9)}, -- from sunken caves
	[2156] = {text = 'Entering Zugurosh\'s ward.', newPos = Position(1818, 1735, 11)}, -- to zugurosh ward
	[2157] = {text = 'Entering the Blood Halls.', bossStorage = 201, newPos = Position(1820, 1648, 12), storage = 2}, -- from zugurosh ward
	[2158] = {text = 'Escaping back to the Retreat.', newPos = Position(1595, 1556, 11)}, -- from blood halls
	[2159] = {text = 'Entering the Blood Halls.', newPos = Position(1820, 1648, 12), storage = 2}, -- to blood halls
	[2160] = {text = 'Entering the Foundry.', newPos = Position(1843, 1619, 10)}, -- to foundry
	[2161] = {text = 'Entering Madareth\'s ward.', newPos = Position(1827, 1713, 11)}, -- to madareth ward
	[2162] = {text = 'Entering the Vats.', bossStorage = 202, newPos = Position(1888, 1603, 12), storage = 3}, -- from madareth ward
	[2163] = {text = 'Escaping back to the Retreat.', newPos = Position(1595, 1556, 11)}, -- from vats
	[2164] = {text = 'Entering the Vats.', newPos = Position(1888, 1603, 12), storage = 3}, -- to vats
	[2165] = {text = 'Entering the Battlefield.', newPos = Position(1882, 1523, 12)}, -- to battlefield
	[2166] = {text = 'Entering the Vats.', newPos = Position(1957, 1577, 12)}, -- from battlefield
	[2167] = {text = 'Entering the Demon Forge.', newPos = Position(1828, 1684, 11)}, -- to brothers ward
	[2168] = {text = 'Entering the Arcanum.', bossStorage = 203, newPos = Position(1871, 1653, 11), storage = 4}, -- from demon forge
	[2169] = {text = 'Escaping back to the Retreat.', newPos = Position(1595, 1556, 11)}, -- from arcanum
	[2170] = {text = 'Entering the Arcanum.', newPos = Position(1871, 1653, 11), storage = 4}, -- to arcanum
	[2171] = {text = 'Entering the Soul Wells.', newPos = Position(2043, 1600, 11)}, -- to soul wells
	[2172] = {text = 'Entering the Arcanum.', newPos = Position(1945, 1604, 11)}, -- from soul wells
	[2173] = {text = 'Entering the Annihilon\'s ward.', newPos = Position(1832, 1575, 11)}, -- to annihilon ward
	[2174] = {text = 'Entering the Hive.', bossStorage = 204, newPos = Position(1747, 1541, 12), storage = 5}, -- from annihilon ward
	[2175] = {text = 'Escaping back to the Retreat.', newPos = Position(1595, 1556, 11)}, -- from hive
	[2176] = {text = 'Entering the Hive.', newPos = Position(1747, 1541, 12), storage = 5}, -- to hive
	[2177] = {text = 'Entering the Hellgorak\'s ward.', newPos = Position(1831, 1608, 11)}, -- to hellgorak ward
	[2178] = {text = 'Entering the Shadow Nexus. Abandon all Hope.', bossStorage = 205, newPos = Position(1820, 1560, 12), storage = 6}, -- from hellgorak ward
	[2179] = {text = 'Escaping back to the Retreat.', newPos = Position(1595, 1556, 11)}, -- from shadow nexus
	[2180] = {text = 'Entering the Blood Halls.', newPos = Position(1806, 1624, 10)} -- from foundry to blood halls
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = teleports[item.uid]
	if teleport.alwaysSetStorage and player:getStorageValue(Storage.TheInquisition.EnterTeleport) < teleport.storage then
		player:setStorageValue(Storage.TheInquisition.EnterTeleport, teleport.storage)
	end

	if teleport.bossStorage then
		if Game.getStorageValue(teleport.bossStorage) >= 2 then
			if player:getStorageValue(Storage.TheInquisition.EnterTeleport) < teleport.storage then
				player:setStorageValue(Storage.TheInquisition.EnterTeleport, teleport.storage)
				player:setStorageValue(teleport.bossStorage, 0)

			end
		else
			player:teleportTo(Position(1595, 1556, 11))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('Escaping back to the Retreat.', TALKTYPE_MONSTER_SAY)
			return true
		end
	elseif teleport.storage and player:getStorageValue(Storage.TheInquisition.EnterTeleport) < teleport.storage then
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You don\'t have enough energy to enter this portal', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(teleport.newPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:say(teleport.text, TALKTYPE_MONSTER_SAY)
	return true
end
