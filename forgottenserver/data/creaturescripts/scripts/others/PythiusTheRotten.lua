function onKill(player, target)
	if not target:isMonster() or target:getName():lower() ~= "pythius the rotten" then
		return true
	end

	target:say("NICE FIGHTING LITTLE WORM, YOUR VICTORY SHALL BE REWARDED!", TALKTYPE_MONSTER_SAY, false, player, Position(2030, 308, 13))

	player:teleportTo(Position(2030, 298, 13))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
