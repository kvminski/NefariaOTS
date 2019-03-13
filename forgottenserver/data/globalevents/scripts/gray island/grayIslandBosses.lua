-- <globalevent type="startup" name="grayIslandBosses" script="spawn/grayIslandBosses.lua" />

local config = {
	teleportId = 1387,
	dias = {
		["Saturday"] = {Position(1882, 109, 9), Position(1880, 102, 9)}, -- tanjis
		
		["Friday"] = {Position(1773, 99, 10), Position(1760, 80, 10)}, -- jaul
		
		
		["Sunday"] = {Position(1717, 153, 10), Position(1698, 160, 10)}, -- obujos
	}
}

function onStartup()

	local dia = config.dias[os.date("%A")]

	if dia then
		local item = Game.createItem(config.teleportId, 1, dia[1])
		if not item:isTeleport() then
			item:remove()
			return false
		end
		item:setDestination(dia[2])
	end

	return true
end