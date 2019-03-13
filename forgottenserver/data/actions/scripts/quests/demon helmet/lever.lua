function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
	local tile = Position(1689, 536, 12):getTile()
		if tile then
			local bars = tile:getItemById(1546)
			if bars then
				bars:remove()
			end
		end

	local tile2 = Position(1689,537,12):getTile()
		if tile2 then
			local bars = tile2:getItemById(1546)
			if bars then
				bars:remove()
			end
	end

	elseif item.itemid == 1946 then
	Game.createItem(1546, 1, Position(1689, 536, 12))
	Game.createItem(1546, 1, Position(1689, 537, 12))
	end
return item:transform(item.itemid == 1945 and 1946 or 1945)
end
