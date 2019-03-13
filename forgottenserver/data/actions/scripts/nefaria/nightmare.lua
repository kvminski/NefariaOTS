function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
	local tile = Position(613, 1489, 10):getTile()
		if tile then
			local stone = tile:getItemById(1304)
			if stone then
				stone:remove()
			end
		end

	elseif item.itemid == 1946 then
	Game.createItem(1304, 1, Position(613, 1489, 10))
	end
return item:transform(item.itemid == 1945 and 1946 or 1945)
end
