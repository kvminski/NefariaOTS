function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(40) == 1 then
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		player:say("Congratulations! You won a prize!", TALKTYPE_MONSTER_SAY)
		item:transform(5958)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:say("Sorry, you did not win.", TALKTYPE_MONSTER_SAY)
		item:remove(1)
	end
	return true
end
