local events = {
	'ElementalSpheresOverlords',
	'BigfootBurdenVersperoth',
	'Razzagorn',
	'Shatterer',
	'Zamulosh',
	'The Hunger',
	'The Rage',
	'Eradicator',
	'Eradicator1',
	'Rupture',
	'World Devourer',
	'Tarbaz',
	'Shulgrax',
	'Ragiaz',
	'Plagirath',
	'Mazoran',
	'Destabilized',
	'BigfootBurdenWiggler',
	'SvargrondArenaKill',
	'NewFrontierShardOfCorruption',
	'NewFrontierTirecz',
	'ServiceOfYalaharDiseasedTrio',
	'ServiceOfYalaharAzerus',
	'ServiceOfYalaharQuaraLeaders',
	'InquisitionBosses',
	'InquisitionUngreez',
	'KillingInTheNameOfKills',
	'KillingInTheNameOfKillss',
	'KillingInTheNameOfKillsss',
	'MastersVoiceServants',
	'SecretServiceBlackKnight',
	'ThievesGuildNomad',
	'WotELizardMagistratus',
	'WotELizardNoble',
	'WotEKeeper',
	'WotEBosses',
	'WotEZalamon',
	'WarzoneThree',
	'PlayerDeath',
	'AdvanceSave',
	'bossesWarzone',
	'AdvanceRookgaard',
	'PythiusTheRotten',
	'DropLoot',
	'Yielothax',
	'BossParticipation',
	'Energized Raging Mage',
	'Raging Mage',
	'modalMD1',
	'VibrantEgg',
	'DeathCounter',
	'KillCounter',
	'bless1',
	'Recompense',
	'lowerRoshamuul'
}

local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)
	local loginStr = 'Welcome to ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. ' Please choose your outfit.'
		player:sendOutfitWindow()
		player:sendTutorial(1)
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format('Your last visit was on %s.', os.date('%a %b %d %X %Y', player:getLastLoginSaved()))
	end

	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	local playerId = player:getId()

	-- Stamina
	nextUseStaminaTime[playerId] = 1
 
	-- EXP Stamina
	nextUseXpStamina[playerId] = 1

	--Prey Stamina
	nextUseStaminaPrey[playerId+1] = {Time = 1}
	nextUseStaminaPrey[playerId+2] = {Time = 1}
	nextUseStaminaPrey[playerId+3] = {Time = 1}

	-- Prey Data
	if (player:getVocation():getId() ~= 0) then
		local columnUnlocked = getUnlockedColumn(player)
		if (not columnUnlocked) then
			columnUnlocked = 0
		end

		for i = 0, columnUnlocked do
			sendPreyData(player, i)
		end
	end

	-- SPECIAL EVENTS
	--[[
		-- STAMINA DUE TO FALLS START
		local stamina_full = 42 * 60 -- config. 42 = horas
		if player:getStamina() >= stamina_full then
			player:sendCancelMessage("Your stamina is already full.")
		elseif player:getPremiumDays() < 1 then
			player:sendCancelMessage("You must have a premium account.")
		else
			player:setStamina(stamina_full)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Your stamina has been refilled.")
		end

		-- Promotion
		local vocation = player:getVocation()
		local promotion = vocation:getPromotion()
		if player:isPremium() then
			local value = player:getStorageValue(Storage.Promotion)
			if not promotion and value ~= 1 then
				player:setStorageValue(Storage.Promotion, 1)
			elseif value == 1 then
				player:setVocation(promotion)
			end
		elseif not promotion then
			player:setVocation(vocation:getDemotion())
		end
	]]

	-- Rewards
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have %d %s in your reward chest.", rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end


	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Welcome to Nefaria.pl! Feel free to join us at forum.nefaria.pl.')
	player:openChannel(6)
	player:openChannel(4)
	player:openChannel(3)
	player:openChannel(5)

	-- Events
	for i = 1, #events do
		player:registerEvent(events[i])
	end

	if player:getStorageValue(Storage.combatProtectionStorage) <= os.time() then
		player:setStorageValue(Storage.combatProtectionStorage, os.time() + 10)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end

	return true
end
