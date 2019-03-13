local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local talkState = {}
local rtnt = {}
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I can make few nice addons for you! Just say {addons} or {help} if you don't know what to do.")

addoninfo = {
['first citizen'] = {cost = 0, items = {{5878,100}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 10042},
['second citizen'] = {cost = 0, items = {{5890,100}, {5902,50}, {2480,1}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 10043},
['first hunter'] = {cost = 0, items = {{5876,100}, {5948,100}, {5891,5}, {5887,1}, {5889,1}, {5888,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10044},
['second hunter'] = {cost = 0, items = {{5875,1}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10045},
['first knight'] = {cost = 0, items = {{5880,100}, {5892,1}}, outfit_female = 139, outfit_male = 131, addon = 1, storageID = 10046},
['second knight'] = {cost = 0, items = {{5893,100}, {11422,1}, {5885,1}, {5887,1}}, outfit_female = 139, outfit_male = 131, addon = 2, storageID = 10047},
['first mage'] = {cost = 0, items = {{2182,1}, {2186,1}, {2185,1}, {8911,1}, {2181,1}, {2183,1}, {2190,1}, {2191,1}, {2188,1}, {8921,1}, {2189,1}, {2187,1}, {5904,10}, {5809,1}, {2193,20}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 10048},
['second mage'] = {cost = 0, items = {{5903,1}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = 10049},
['first summoner'] = {cost = 0, items = {{5958,1}}, outfit_female = 141, outfit_male = 133, addon = 1, storageID = 10050},
['second summoner'] = {cost = 0, items = {{5894,70}, {5911,20}, {5883,40}, {5922,35}, {5886,10}, {5881,60}, {5882,40}, {2392,3}, {5905,30}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 10051},
['first barbarian'] = {cost = 0, items = {{5884,1}, {5885,1}, {5910,50}, {5911,50}, {5886,10}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 10011},
['second barbarian'] = {cost = 0, items = {{5880,100}, {5892,1}, {5893,50}, {5876,50}}, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 10012},
['first druid'] = {cost = 0, items = {{5896,50}, {5897,50}}, outfit_female = 148, outfit_male = 144, addon = 1, storageID = 10013},
['second druid'] = {cost = 0, items = {{5906,100}, {5938,1}, {5937,1}, {5940,1}}, outfit_female = 148, outfit_male = 144, addon = 2, storageID = 10014},
['first nobleman'] = {cost = 300000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10015},
['second nobleman'] = {cost = 300000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10016},
['first oriental'] = {cost = 0, items = {{5945,1}}, outfit_female = 150, outfit_male = 146, addon = 1, storageID = 10017},
['second oriental'] = {cost = 0, items = {{5883,100}, {5895,100}, {5891,2}, {5912,100}}, outfit_female = 150, outfit_male = 146, addon = 2, storageID = 10018},
['first warrior'] = {cost = 0, items = {{5925,100}, {5899,100}, {5884,1}, {5919,1}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10019},
['second warrior'] = {cost = 0, items = {{5880,100}, {5887,1}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10020},
['first wizard'] = {cost = 0, items = {{5922,50}}, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 10021},
['second wizard'] = {cost = 0, items = {{2536,1}, {2492,1}, {2488,1}, {2123,1}}, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 10022},
['first assassin'] = {cost = 0, items = {{5912,50}, {5910,50}, {5911,50}, {5913,50}, {5914,50}, {5909,50}, {5886,10}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10023},
['second assassin'] = {cost = 0, items = {{5804,1}, {5930,10}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10024},
['first beggar'] = {cost = 0, items = {{5883,50}, {5878,30}, {5921,20}, {5913,10}, {5894,10}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10025},
['second beggar'] = {cost = 0, items = {{6107,1}, {2160,2}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10026},
['first pirate'] = {cost = 0, items = {{6098,100}, {6126,100}, {6097,100}}, outfit_female = 155, outfit_male = 151, addon = 1, storageID = 10027},
['second pirate'] = {cost = 0, items = {{6101,1}, {6102,1}, {6100,1}, {6099,1}}, outfit_female = 155, outfit_male = 151, addon = 2, storageID = 10028},
['first shaman'] = {cost = 0, items = {{3967,5}, {5015,1}}, outfit_female = 158, outfit_male = 154, addon = 1, storageID = 10029},
['second shaman'] = {cost = 0, items = {{3966,5}, {3955,5}}, outfit_female = 158, outfit_male = 154, addon = 2, storageID = 10030},
--['first norseman'] = {cost = 0, items = {{7290,5}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031},
--['second norseman'] = {cost = 0, items = {{7290,10}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032},
['first jester'] = {cost = 0, items = {{5912,5}, {5913,5}, {5914,5}, {5909,5}, {5910,5}, {5886,1}, {5877,25}}, outfit_female = 270, outfit_male = 273, addon = 1, storageID = 10033},
['second jester'] = {cost = 0, items = {{5912,10}, {5913,10}, {5914,10}, {5909,10}, {5910,10}, {5886,3}, {5877,50}}, outfit_female = 270, outfit_male = 273, addon = 2, storageID = 10034},
--['first demonhunter'] = {cost = 0, items = {{5808,1}, {2460,1}, {5891,6}}, outfit_female = 288, outfit_male = 289, addon = 1, storageID = 10035},
--['second demonhunter'] = {cost = 0, items = {{5906,50}, {6500,100}, {5893,50}, {5894,50}, {2650,1}}, outfit_female = 288, outfit_male = 289, addon = 2, storageID = 10036},
--['first nightmare'] = {cost = 0, items = {{5944,50}, {2517,1}, {2414,1}, {5888,1}}, outfit_female = 269, outfit_male = 268, addon = 1, storageID = 10037},
--['second nightmare'] = {cost = 0, items = {{2481,1}, {5889,1}, {6500,100}}, outfit_female = 269, outfit_male = 268, addon = 2, storageID = 10038},
--['first brotherhood'] = {cost = 0, items = {{5944,50}, {5888,2}, {2151,50}, {2550,1}}, outfit_female = 279, outfit_male = 278, addon = 1, storageID = 10039},
--['second brotherhood'] = {cost = 0, items = {{7463,1}, {2151,50}, {5904,10}, {2461,1}, {5883,40}}, outfit_female = 279, outfit_male = 278, addon = 2, storageID = 10040},
--['first yalaharian'] = {cost = 0, items = {{2427,1}, {8900,1}, {2178,1}, {2349,1}, {2177,20}}, outfit_female = 324, outfit_male = 325, addon = 1, storageID = 10041},
--['second yalaharian'] = {cost = 0, items = {{2427,1}, {5480,1}, {2479,1}, {2177,20}, {2353,1}}, outfit_female = 324, outfit_male = 325, addon = 2, storageID = 10041},
-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052 --
--['first warmaster'] = {cost = 0, items = {{11332,100}, {11333,100}, {11330,100}, {11334,100}}, outfit_female = 336, outfit_male = 335, addon = 1, storageID = 10052},
--['second warmaster'] = {cost = 0, items = {{11322,50}, {11206,50}, {11361,50}, {5919,1}}, outfit_female = 336, outfit_male = 335, addon = 2, storageID = 10053},
--['first wayfarer'] = {cost = 0, items = {{10581,35}, {10553,80}, {10584,100}, {5919,1}}, outfit_female = 366, outfit_male = 367, addon = 1, storageID = 10054},
--['second wayfarer'] = {cost = 0, items = {{11199,100}, {11226,50}, {10611,50}}, outfit_female = 366, outfit_male = 367, addon = 2, storageID = 10055},
--['first elementalist'] = {cost = 0, items = {{2354,1}, {10562,50}, {10600,50}, {11193,50}}, outfit_female = 433, outfit_male = 432, addon = 1, storageID = 10056},
--['second elementalist'] = {cost = 0, items = {{8752,1}, {10563,50}, {2155,1}, {2156,1}, {2158,1}, {2154,1}, {2153,1}}, outfit_female = 433, outfit_male = 432, addon = 2, storageID = 10057},
}
function creatureSayCallback(cid, type, msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if addoninfo[msg] ~= null then
		if (getPlayerStorageValue(cid, addoninfo[msg].storageID) ~= -1) then
				npcHandler:say('You already have this addon!', cid)
				npcHandler:resetNpc()
		else
		local itemsTable = addoninfo[msg].items
		local items_list = ''
			if table.maxn(itemsTable) > 0 then
				for i = 1, table.maxn(itemsTable) do
					local item = itemsTable[i]
					items_list = items_list .. item[2] .. ' ' .. getItemName (item[1])
					if i ~= table.maxn(itemsTable) then
						items_list = items_list .. ', '
					end
				end
			end
		local text = ''
			if (addoninfo[msg].cost > 0) then
				text = addoninfo[msg].cost .. ' gp'
			elseif table.maxn(addoninfo[msg].items) then
				text = items_list
			elseif (addoninfo[msg].cost > 0) and table.maxn(addoninfo[msg].items) then
				text = items_list .. ' and ' .. addoninfo[msg].cost .. ' gp'
			end
			npcHandler:say('For ' .. msg .. ' you will need ' .. text .. '. Do you have it all with you?', cid)
			rtnt[talkUser] = msg
			talkState[talkUser] = addoninfo[msg].storageID
			return true
		end
	elseif msgcontains(msg, "yes") then
		if (talkState[talkUser] > 10010 and talkState[talkUser] < 10100) then
			local items_number = 0
			if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then
				for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do
					local item = addoninfo[rtnt[talkUser]].items[i]
					if (getPlayerItemCount(cid,item[1]) >= item[2]) then
						items_number = items_number + 1
					end
				end
			end
			if(getPlayerMoney(cid) >= addoninfo[rtnt[talkUser]].cost) and (items_number == table.maxn(addoninfo[rtnt[talkUser]].items)) then
				doPlayerRemoveMoney(cid, addoninfo[rtnt[talkUser]].cost)
				if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then
					for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do
						local item = addoninfo[rtnt[talkUser]].items[i]
						doPlayerRemoveItem(cid,item[1],item[2])
					end
				end
				doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_male, addoninfo[rtnt[talkUser]].addon)
				doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_female, addoninfo[rtnt[talkUser]].addon)
				setPlayerStorageValue(cid,addoninfo[rtnt[talkUser]].storageID,1)
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('You do not have needed items!', cid)
			end
			rtnt[talkUser] = nil
			talkState[talkUser] = 0
			npcHandler:resetNpc()
		end
	elseif msgcontains(msg, "addon") then
		npcHandler:say('I can give you citizen, hunter, knight, mage, nobleman, summoner, warrior, barbarian, druid, wizard, oriental, pirate, assassin, beggar, shaman, norseman, nighmare, jester, yalaharian, brotherhood, warmaster, wayfarer and elementalist addons. I will have more soon, remind our god about that.', cid)
		rtnt[talkUser] = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc()
	elseif msgcontains(msg, "help") then
		npcHandler:say('To buy the first addon say \'{first NAME}\', for the second addon say \'{second NAME}\'.', cid)
		rtnt[talkUser] = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc()
	else
		npcHandler:say('Come back when you get these items.', cid)
		rtnt[talkUser] = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc()
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())