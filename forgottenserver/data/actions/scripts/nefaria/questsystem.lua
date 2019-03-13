local specialQuests = {
	[2215] = 2215, -- Annihilator
	[40000] = 40000, --dhq
	[40001] = 40001, --dhq
	[40002] = 40002, --dhq
	[26300] = 26300, -- svargrond arena
	[26400] = 26400, -- svargrond arena
	[26500] = 26500, -- svargrond arena
	[27300] = 27300, -- svargrond arena
	[27400] = 27400, -- svargrond arena
	[27500] = 27500, -- svargrond arena
	[28300] = 28300, -- svargrond arena
	[28400] = 28400, -- svargrond arena
	[28500] = 28500, -- svargrond arena
	[40003] = 40003, --holy tible
	[40004] = 40004, -- firewalker boots
	--azerus quest
	[40005] = 40005, --1of8
	[40006] = 40006, --1of8
	[40007] = 40007, --1of8
	[40008] = 40008, --1of8
	[40009] = 40009, --1of8
	[40010] = 40010, --1of8
	[40011] = 40011, --1of8
	[40012] = 40012, --1of8
	[40013] = 40013,
	[40014] = 40014,
	[40015] = 40015,
	[40016] = 40016,
	[40017] = 40017,
	--asd
	--forgotten
	[40050] = 40050, --forgotten1of3
	[40051] = 40051, --forgotten1of3
	[40052] = 40052, --forgotten1of3
	[40053] = 40053, --forgottenDONTDEL
	[40054] = 40054, --forgottenDONTDEL
	[40055] = 40055, --forgottenEVIL
	[40056] = 40056, --forgottenGOOD
	--ss
	[40067] = 40067, --poi1of3
	[40068] = 40068, --poi1of3
	[40069] = 40069, --poi1of3
	[40070] = 40070, --poi soft boots
	[40071] = 40071, --poi
	[40072] = 40072, --poi
	[40073] = 40073, --poi
	[40074] = 40074, --poi
	[40075] = 40075, --poi
	[40076] = 40076, --anni
	[40077] = 40077, --anni
	[40078] = 40078, --anni
	[40079] = 40079, --anni
	[40080] = 40080, --nvm
	[40081] = 40081, --oak
	[40082] = 40082, --oak
	[40083] = 40083, --oak
	[40084] = 40084, --oak
	[40085] = 40085, --oak
	[40086] = 40086, -- svargrond arena
	[40087] = 40087, -- svargrond arena
	[40088] = 40088, -- svargrond arena
	[40089] = 40089, -- svargrond arena
	[40090] = 40090, -- svargrond arena
	[40091] = 40091, -- svargrond arena
	[40092] = 40092, -- svargrond arena
	[40093] = 40093, -- svargrond arena
	[40094] = 40094, -- svargrond arena
	[40095] = 40095, --bonelord quest
	[40096] = 40096, --bonelord quest
	[40097] = 40097, --bonelord quest
	[40098] = 40098, --djinnblade lichstaff nobleaxe
	[40099] = 40099, --djinnblade lichstaff nobleaxe
	[40100] = 40100, --djinnblade lichstaff nobleaxe
	[40101] = 40101, --GS Quest
	[40102] = 40102, --GS Quest
	[40103] = 40103, --ceiron wolftoothchain
	[40104] = 40104, --orc fortress
	[40105] = 40105, --orc fortress
	[40106] = 40106, --orc fortress
	[40107] = 40107, --wyrm quest
	[40108] = 40108, --wyrm quest
	[40109] = 40109, --wyrm quest
	[40110] = 40110, --coral comb
	[40111] = 40111, --paladin armor
	[40112] = 40112, --botanist and rh
	[40113] = 40113, --botanist and rh
	[40114] = 40114, --elf fort
	[40115] = 40115, --elf fort
	[40116] = 40116, --elf fort
	[40117] = 40117, --hotd
	[40118] = 40118, --fur bag
	[40119] = 40119, --4item40knightsQ
	[40120] = 40120, --4item40knightsQ
	[40121] = 40121, --4item40knightsQ
	[40122] = 40122, --4item40knightsQ
	[40123] = 40123, --bk
	[40124] = 40124, --bk
	[40125] = 40125, --medusashieldq
	[40126] = 40126, --medusashieldq
	[40127] = 40127, --medusashieldq
	[40128] = 40128, --springrod book of enl
	[40129] = 40129, --springrod book of enl
	[40130] = 40130, --springrod book of enl
	[40131] = 40131, --4item40knightsQ
	[40132] = 40132, --dwarvenset
	[40133] = 40133, --dwarvenset
	[40134] = 40134, --dwarvenset
	[40135] = 40135, --banshee
	[40136] = 40136, --banshee
	[40137] = 40137, --banshee
	[40138] = 40138, --banshee
	[40139] = 40139, --necro
	[40140] = 40140, --necro
	[40141] = 40141, --necro
	[40142] = 40142, --necro
	[40143] = 40143, --herowrl
	[40144] = 40144, --herowrl
	[40145] = 40145, --herowrl
	[40146] = 40146, --phoenix shield
	[40147] = 40147, --DL Quest
	[40148] = 40148, --DL Quest
	[40149] = 40149, --behe Q
	[40150] = 40150, --behe Q
	[40151] = 40151, --behe Q
	[40152] = 40152, --behe Q
	[40153] = 40153, --DL Quest
	[40154] = 40154, --Fibula Deep
	[40155] = 40155, --Fibula Deep
	[40156] = 40156, --Fibula Deep
	[40157] = 40157, --Fibula Deep
	[40158] = 40158, --ZAO SET
	[40159] = 40159, --ZAO SET
	[40160] = 40160, --ZAO SET
	[40161] = 40161, --ROYAL DRAKEN
	[40162] = 40162, --ROYAL DRAKEN
	[40163] = 40163, --ROYAL DRAKEN
	[40164] = 40164, --ROYAL DRAKEN
	[40165] = 40165, --LABIRYNTH
	[40166] = 40166, --LABIRYNTH
	[40167] = 40167, --LABIRYNTH
	[40168] = 40168, --NIGHTMARE
	[40169] = 40169, --NIGHTMARE
	[40170] = 40170, --NIGHTMARE
	[40171] = 40171, --NIGHTMARE
	[40172] = 40172, --Desert Q
	[40173] = 40173, --Desert Q
	[40174] = 40174, --MYTH Axe
	[40175] = 40175, --MYTH Axe
	[40176] = 40176, --MYTH Axe
	[40178] = 40178, --tarantula exp
	[40179] = 40179, --FACTORY
	[40180] = 40180, --FACTORY
	[40181] = 40181, --FACTORY
	[40182] = 40182, --WRL SPELLBOOK OF LOST SOUl
	[40183] = 40183, --WRL SPELLBOOK OF LOST SOUl
	[40184] = 40184, --WRL SPELLBOOK OF LOST SOUl
	[40185] = 40185, -- WRL PHOENIX SHIELD
	[40186] = 40186, -- WRL PHOENIX SHIELD
	[40187] = 40187, --FROST DRAGON
	[40188] = 40188, --FROST DRAGON
	[40189] = 40189, --FROST DRAGON
	[40190] = 40190, --ELITE DRAKEN MAIL
	[40191] = 40191, --ELITE DRAKEN MAIL
	[40192] = 40192, --ELITE DRAKEN MAIL
	[40193] = 40193, --SWAMP ROD
	[40194] = 40194, --SWAMP ROD
	[40195] = 40195, --SWAMP ROD
	[40196] = 40196, --FERU TOWER
	[40197] = 40197, --FERU TOWER
	[40198] = 40198, --FERU TOWER
	[40199] = 40199, --ROSH FIRST
	[40200] = 40200, --OGRE
	[40201] = 40201, --OGRE
	[40202] = 40202, --OGRE

}

local questsExperience = {
	[2215] = 100000, --anni
	[40000] = 50000, --dhq
	[40001] = 50000, --dhq
	[40002] = 50000, --dhq
	[26300] = 5000, -- svargrond arena
	[26400] = 1000, -- svargrond arena
	[26500] = 1000, -- svargrond arena
	[27300] = 20000, -- svargrond arena
	[27400] = 5000, -- svargrond arena
	[27500] = 5000, -- svargrond arena
	[28300] = 50000, -- svargrond arena
	[28400] = 10000, -- svargrond arena
	[28500] = 10000, -- svargrond arena
	[40003] = 5000, --holy tible
	[40004] = 50000,
	[40067] = 10000, --poi1of3
	[40068] = 10000, --poi2of3
	[40069] = 10000, --poi3of3
	[40070] = 10000, --poi soft boots and assa outfit
	[40071] = 10000, --poi
	[40072] = 10000, --poi
	[40073] = 10000, --poi
	[40074] = 10000, --poi
	[40075] = 10000, --poidontdelete
	[40076] = 100000, --anni1of4
	[40077] = 100000, --anni2of4
	[40078] = 100000, --anni3of4
	[40079] = 100000, --anni4of4
	[40080] = 0, --nvm
	[40081] = 200000, --oak
	[40082] = 200000, --oak
	[40083] = 200000, --oak
	[40084] = 200000, --oak
	[40085] = 0, --oakdontdelete
	[40086] = 0, --frizenarena1
	[40087] = 0, --frizenarena1
	[40088] = 0, --frizenarena1
	[40089] = 0, --frizenarena2
	[40090] = 0, --frizenarena2
	[40091] = 0, --frizenarena2
	[40092] = 0, --frizenarena3
	[40093] = 0, --frizenarena3
	[40094] = 0, --frizenarena3
	[40017] = 50000, --azerus
	[40013] = 2000, --azerus
	[40014] = 2000, --azerus
	[40015] = 2000, --azerus
	[40016] = 2000, --azerus
	[40053] = 100000, --forgotten1of3
	[40056] = 50000, --forgottenAddon
	[40055] = 50000, --forgottenAddon
	[40095] = 1500, --bonelord quest
	[40096] = 1500, --bonelord quest
	[40097] = 1500, --bonelord quest
	[40098] = 5000, --djinnblade lichstaff nobleaxe
	[40099] = 5000, --djinnblade lichstaff nobleaxe
	[40100] = 5000, --djinnblade lichstaff nobleaxe
	[40101] = 5000, --GS Quest
	[40102] = 5000, --GS Quest
	[40103] = 5000, --ceiron wolftoothchain
	[40104] = 6000, --orc fortress
	[40105] = 6000, --orc fortress
	[40106] = 6000, --orc fortress
	[40107] = 8000, --wyrm quest
	[40108] = 8000, --wyrm quest
	[40109] = 8000, --wyrm quest
	[40110] = 10000, --coral comb
	[40111] = 8000, --paladin armor q
	[40112] = 8000, --botanist and rh
	[40113] = 8000, --botanist and rh
	[40114] = 2000, --elf fort
	[40115] = 2000, --elf fort
	[40116] = 2000, --elf fort
	[40117] = 8000, --hotd
	[40118] = 3000, --fur bag
	[40119] = 5000, --4item40knightsQ
	[40120] = 5000, --4item40knightsQ
	[40121] = 5000, --4item40knightsQ
	[40122] = 5000, --4item40knightsQ
	[40123] = 10000, --bk
	[40124] = 10000, --bk
	[40125] = 6000, --medusashieldq
	[40126] = 6000, --medusashieldq
	[40127] = 6000, --medusashieldq
	[40128] = 3000, --springrod book of enl
	[40129] = 3000, --springrod book of enl
	[40130] = 3000, --springrod book of enl
	[40131] = 5000, --4item40knightsQ
	[40132] = 4000, --dwarvenset
	[40133] = 4000, --dwarvenset
	[40134] = 4000, --dwarvenset
	[40135] = 15000, --banshee
	[40136] = 15000, --banshee
	[40137] = 15000, --banshee
	[40138] = 15000, --banshee
	[40139] = 6000, --necro
	[40140] = 6000, --necro
	[40141] = 6000, --necro
	[40142] = 6000, --necro
	[40143] = 6000, --herowrl
	[40144] = 6000, --herowrl
	[40145] = 6000, --herowrl
	[40146] = 30000, --phoenix shield
	[40147] = 12000, --DL Quest
	[40148] = 12000, --DL Quest
	[40149] = 20000, --behe Q
	[40150] = 20000, --behe Q
	[40151] = 20000, --behe Q
	[40152] = 20000, --behe Q
	[40153] = 12000, --DL Quest
	[40154] = 15000, --Fibula Deep
	[40155] = 15000, --Fibula Deep
	[40156] = 15000, --Fibula Deep
	[40157] = 15000, --Fibula Deep
	[40158] = 30000, --ZAO SET
	[40159] = 30000, --ZAO SET
	[40160] = 30000, --ZAO SET
	[40164] = 150000, --ROYAL DRAKEN
	[40165] = 75000, --LABIRYNTH
	[40166] = 75000, --LABIRYNTH
	[40167] = 75000, --LABIRYNTH
	[40170] = 100000, --NIGHTMARE
	[40171] = 50000, --NIGHTMARE
	[40172] = 1500, --Desert Q
	[40173] = 1500, --Desert Q
	[40174] = 40000, --MYTH Axe
	[40175] = 40000, --MYTH Axe
	[40176] = 40000, --MYTH Axe
	[40178] = 2000, --tarantula
	[40179] = 40000, --FACTORY
	[40180] = 40000, --FACTORY
	[40181] = 40000, --FACTORY
	[40182] = 30000, --WRL SPELLBOOK OF LOST SOUl
	[40183] = 30000, --WRL SPELLBOOK OF LOST SOUl
	[40184] = 30000, --WRL SPELLBOOK OF LOST SOUl
	[40185] = 30000, -- WRL PHOENIX SHIELD
	[40186] = 30000, -- WRL PHOENIX SHIELD 
	[40187] = 20000, --FROST DRAGON
	[40188] = 20000, --FROST DRAGON
	[40189] = 20000, --FROST DRAGON
	[40190] = 30000, --ELITE DRAKEN MAIL
	[40191] = 30000, --ELITE DRAKEN MAIL
	[40192] = 30000, --ELITE DRAKEN MAIL
	[40193] = 25000, --SWAMP ROD
	[40194] = 25000, --SWAMP ROD
	[40195] = 25000, --SWAMP ROD
	[40196] = 75000, --FERU TOWER
	[40197] = 75000, --FERU TOWER
	[40198] = 75000, --FERU TOWER
	[40199] = 50000, --ROSH FIRST
	[40200] = 7000, --OGRE
	[40201] = 7000, --OGRE
	[40202] = 7000, --OGRE
}

local questOutfits = {
    [2215] = {female = 542, male = 541}, --anni demon outfit
    [40070] = {female = 632, male = 633}, --poi champion outfit
    [40017] = {female = 575, male = 574}, --azerus cave outfit
    [40054] = {female = 324, male = 325}, --forgotten yalahari outfit
    [26300] = {female = 252, male = 251}, --NORSEMAN OUTFIT GREENHORN
}

local questAddons = {
	[40070] = {female = 632, male = 633, addon = 3}, --poi champion addons
	[40001] = {female = 542, male = 541, addon = 2}, -- dhq demon second
	[2215] = {female = 542, male = 541, addon = 1}, --anni demon first
	[40017] = {female = 575, male = 574, addon = 3}, --azerus cave explorer full
	[40164] = {female = 366, male = 367, addon = 3}, --royal draken wayfarer full
	[40166] = {female = 956, male = 955, addon = 3}, --LABIRYNTH pharaoh full
	[40179] = {female = 618, male = 610, addon = 3}, --FACTORY
	[27300] = {female = 252, male = 251, addon = 1}, --NORSEMAN FIRST SCRAPPER
	[28300] = {female = 252, male = 251, addon = 2}, --NORSEMAN SECOND WARLORD
	[40192] = {female = 336, male = 335, addon = 1}, --WARMASTER 1ST
	[40158] = {female = 336, male = 335, addon = 2}, --WARMASTER 2ND
}

local questMount = {
	[40004] = {mountId = 50},
	[40167] = {mountId = 109},
}

local tutorialIds = {
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = specialQuests[item.actionid]
	if not storage then
		storage = item.uid
		if storage > 65535 then
			return false
		end
	end

	local player = Player(cid)
	if player:getStorageValue(storage) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
		return true
	end

	local targetItem = Item(item.uid)
	local items = {}
	local reward = nil

	local size = targetItem:isContainer() and Container(item.uid):getSize() or 0
	if size == 0 then
		reward = targetItem:clone()
	else
		local container = Container(item.uid)
		for i = 0, container:getSize() - 1 do
			table.insert(items, container:getItem(i):clone())
		end
	end

	size = #items
	if size == 1 then
		reward = items[1]:clone()
	end

	local result = ''
	local weight = 0
	if reward then
		local ret = ItemType(reward:getId())
		if ret:isRune() then
			result = ret:getArticle() .. ' ' ..  ret:getName() .. ' (' .. reward:getSubType() .. ' charges)'
		elseif ret:isStackable() and reward:getCount() > 1 then
			result = reward:getCount() .. ' ' .. ret:getPluralName()
		else
			result = ret:getArticle() .. ' ' .. ret:getName()
		end
		weight = weight + ret:getWeight(reward:getCount())
	else
		if size > 20 then
			reward = Game.createItem(item.itemid, 1)
		elseif size > 8 then
			reward = Game.createItem(1988, 1)
		else
			reward = Game.createItem(1987, 1)
		end

		for i = 1, size do
			local tmp = items[i]
			if reward:addItemEx(tmp) ~= RETURNVALUE_NOERROR then
				print('[Warning] QuestSystem:', 'Could not add quest reward to container')
			else
				local ret = ', '
				if i == size then
					ret = ' and '
				elseif i == 1 then
					ret = ''
				end
				result = result .. ret

				local ret = ItemType(tmp:getId())
				if ret:isRune() then
					result = result .. ret:getArticle() .. ' ' .. ret:getName() .. ' (' .. tmp:getSubType() .. ' charges)'
				elseif ret:isStackable() and tmp:getCount() > 1 then
					result = result .. tmp:getCount() .. ' ' .. ret:getPluralName()
				else
					result = result .. ret:getArticle() .. ' ' .. ret:getName()
				end
				weight = weight + ret:getWeight(tmp:getCount())
			end
		end
		weight = weight + ItemType(reward:getId()):getWeight()
	end

	if player:addItemEx(reward) ~= RETURNVALUE_NOERROR then
		if player:getFreeCapacity() < weight then
			player:sendCancelMessage('You have found ' .. result .. ' weighing ' .. string.format('%.2f', weight) .. ' oz. You have no capacity.')
		else
			player:sendCancelMessage('You have found ' .. result .. ', but you have no room to take it.')
		end
		return true
	end

	if questsExperience[storage] then
		player:addExperience(questsExperience[storage], true)
	end

	if questOutfits[storage] then
    player:addOutfit(questOutfits[storage].female)
    player:addOutfit(questOutfits[storage].male)
	end

	if questAddons[storage] then
	player:addOutfitAddon(questAddons[storage].female, questAddons[storage].addon)
	player:addOutfitAddon(questAddons[storage].male, questAddons[storage].addon)
	end

	if questMount[storage] then
	player:addMount(questMount[storage].mountId)
	end

	if tutorialIds[storage] then
		player:sendTutorial(tutorialIds[storage])
		if item.uid == 50080 then
			player:setStorageValue(Storage.RookgaardTutorialIsland.SantiagoNpcGreetStorage, 3)
		end
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found ' .. result .. '.')
	player:setStorageValue(storage, 1)
	return true
end
