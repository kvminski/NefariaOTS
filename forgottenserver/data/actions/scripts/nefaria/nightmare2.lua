function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
	local tile = Position(613, 1491, 9):getTile()
		if tile then
			local gate = tile:getItemById(9485)
			if gate then
				gate:remove()
			end
		end

	elseif item.itemid == 1946 then
	Game.createItem(9485, 1, Position(613, 1491, 9))
	end
return item:transform(item.itemid == 1945 and 1946 or 1945)
end
