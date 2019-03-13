local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local talkState = {}
local rtnt = {}
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I can make addons to outfits for some materials. Just say {addons} or {help} if you don't know what to do.")

addoninfos = {
['first citizen'] = {cost = 0, items = {{5878,100}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 9746},
['second citizen'] = {cost = 0, items = {{5890,100}, {5902,50}, {2480,1}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 9741},
['second hunter'] = {cost = 0, items = {{5875,1}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 9742},
['first druid'] = {cost = 0, items = {{5896,50}, {5897,50}}, outfit_female = 148, outfit_male = 144, addon = 1, storageID = 9743},
['first nobleman'] = {cost = 100000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 9744},
['second nobleman'] = {cost = 100000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 9745},
}
function creatureSayCallback(cid, type, msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if addoninfos[msg] ~= null then
		if (getPlayerStorageValue(cid, addoninfos[msg].storageID) ~= -1) then
				npcHandler:say('You already have this addon!', cid)
				npcHandler:resetNpc()
		else
		local itemsTable = addoninfos[msg].items
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
			if (addoninfos[msg].cost > 0) then
				text = addoninfos[msg].cost .. ' gp'
			elseif table.maxn(addoninfos[msg].items) then
				text = items_list
			elseif (addoninfos[msg].cost > 0) and table.maxn(addoninfos[msg].items) then
				text = items_list .. ' and ' .. addoninfos[msg].cost .. ' gp'
			end
			npcHandler:say('For ' .. msg .. ' you will need ' .. text .. '. Do you have it all with you?', cid)
			rtnt[talkUser] = msg
			talkState[talkUser] = addoninfos[msg].storageID
			return true
		end
	elseif msgcontains(msg, "yes") then
		if (talkState[talkUser] > 9740 and talkState[talkUser] < 9746) then
			local items_number = 0
			if table.maxn(addoninfos[rtnt[talkUser]].items) > 0 then
				for i = 1, table.maxn(addoninfos[rtnt[talkUser]].items) do
					local item = addoninfos[rtnt[talkUser]].items[i]
					if (getPlayerItemCount(cid,item[1]) >= item[2]) then
						items_number = items_number + 1
					end
				end
			end
			if(getPlayerMoney(cid) >= addoninfos[rtnt[talkUser]].cost) and (items_number == table.maxn(addoninfos[rtnt[talkUser]].items)) then
				doPlayerRemoveMoney(cid, addoninfos[rtnt[talkUser]].cost)
				if table.maxn(addoninfos[rtnt[talkUser]].items) > 0 then
					for i = 1, table.maxn(addoninfos[rtnt[talkUser]].items) do
						local item = addoninfos[rtnt[talkUser]].items[i]
						doPlayerRemoveItem(cid,item[1],item[2])
					end
				end
				doPlayerAddOutfit(cid, addoninfos[rtnt[talkUser]].outfit_male, addoninfos[rtnt[talkUser]].addon)
				doPlayerAddOutfit(cid, addoninfos[rtnt[talkUser]].outfit_female, addoninfos[rtnt[talkUser]].addon)
				setPlayerStorageValue(cid,addoninfos[rtnt[talkUser]].storageID,1)
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('You do not have needed items!', cid)
			end
			rtnt[talkUser] = nil
			talkState[talkUser] = 0
			npcHandler:resetNpc()
		end
	elseif msgcontains(msg, "addon") then
		npcHandler:say('I can give you both addons to citizen, second hunter, first druid addon and both addons to nobleman. My dad learned me how to do only those addons.', cid)
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