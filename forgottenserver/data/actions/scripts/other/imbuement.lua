function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	
	player:openImbuementWindow(itemEx)
	
	return true
end
