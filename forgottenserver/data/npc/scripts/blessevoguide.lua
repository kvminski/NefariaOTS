local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local random_texts = {'Welcome to our humble temple.', 'If you are hurt ask me, I\'ll heal you.', 'Feeling lost? Ask me for help.', 'Praise our God. He has power to revive adventurers whose adventure is not over yet!'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
random_word_bless = 0
local talkState = {}
local function round(num, idp)
    local mult = 10^(idp or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()
	if(random_word_bless < os.time()) then
		random_word_bless = (os.time() + random_texts_interval)
		if(math.random(1, 100) < random_texts_chance) then
			selfSay(random_texts[math.random(1, #random_texts)])
		end
	end
	npcHandler:onThink()
end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end
		function greetCallback(cid)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local msg = {
		"Be greeted. If you need {something} just ask me.", 
		"Welcome to our humble temple, " .. getPlayerName(cid) .. ".", 
		"Welcome, " .. getPlayerName(cid) .. "! Welcome to the temple of {Enigma City}. If you need {healing}, I can help you.", 
		"Hello. How may I help you " .. getPlayerName(cid) .. "?", 
		"Come in, " .. getPlayerName(cid) .. "."
	}
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	talkState[talkUser] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
local blessformula = (2000 + ((math.min(130, getPlayerLevel(cid)) - 30) * 200))
if blessformula < 2000 then blessformula = 2000 end

local function allformula(cid)
havebless = {}
local blessformula = (2000 + ((math.min(130, getPlayerLevel(cid)) - 30) * 200))
if blessformula < 2000 then blessformula = 2000 end

for i = 1, 5 do
if(getPlayerBlessing(cid, i)) then
table.insert(havebless,i)
end
end
return ((5 - #havebless) * blessformula)
end

local node1 = keywordHandler:addKeyword({'wisdom'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want me to grant you Wisdom of Solitude blessing for ' .. blessformula .. ' gold?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 1, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 130})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Okay.'})

local node2 = keywordHandler:addKeyword({'spark'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want me to grant you Spark of The Phoenix blessing for ' .. blessformula .. ' gold?'})
	node2:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 2, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 130})
	node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Okay.'})

local node3 = keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want me to grant you double sun power of our local Fire of Two Suns blessing for ' .. blessformula .. ' gold?'})
	node3:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 3, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 130})
	node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Okay.'})

local node4 = keywordHandler:addKeyword({'spiritual'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to grant you ancient Spiritual Shielding blessing for ' .. blessformula .. ' gold?'})
	node4:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 4, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 130})
	node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Okay.'})

local node5 = keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wish to receive Embrace of Tibia blessing for ' .. blessformula .. ' gold?'})
	node5:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 5, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 130})
	node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Okay.'})
	
local node6 = keywordHandler:addKeyword({'all'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to receive all blessings for ' .. allformula(cid) .. ' gold?'})
	node6:addChildKeyword({'yes'}, StdModule.allbless, {npcHandler = npcHandler, premium = true, blessCost = 2000, levelCost = 200, startLevel = 30, endLevel = 130})
	node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Okay.'})

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'map') or msgcontains(msg, 'mark')) then
	selfSay('Do you want me to mark your map with important locations in our town?', cid)
	talkState[talkUser] = 1
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		local marks = {
		{mark = 5, pos = {x = 256, y = 256, z = 7}, desc = "Enigma City Temple"},
		{mark = 10, pos = {x = 287, y = 254, z = 7}, desc = "Depot with bank"},
		{mark = 13, pos = {x = 303, y = 247, z = 7}, desc = "Food store"},
		{mark = 8, pos = {x = 278, y = 236, z = 7}, desc = "Smithery"},
		{mark = 8, pos = {x = 271, y = 226, z = 7}, desc = "Distance weapons shop"},
		{mark = 13, pos = {x = 268, y = 241, z = 7}, desc = "Jewellery, magic shop and music instruments shop"},
		{mark = 13, pos = {x = 303, y = 247, z = 7}, desc = "Food store and magic shop"},
		{mark = 7, pos = {x = 252, y = 242, z = 7}, desc = "Tools and furniture"},
		{mark = 13, pos = {x = 258, y = 237, z = 7}, desc = "Creature products and fashion"},
		{mark = 9, pos = {x = 234, y = 215, z = 7}, desc = "Boat"},
	}
	local f_addMark = doPlayerAddMapMark
	if(not f_addMark) then f_addMark = doAddMapMark end
	for _, m  in pairs(marks) do
		f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
	end
	selfSay('Here you are.', cid)
	talkState[talkUser] = 0
	end
	if (msgcontains(msg, "no") and talkState[talkUser] == 1) or (msgcontains(msg, "no") and talkState[talkUser] == 9) then
	selfSay('May God guide your path then.', cid)
	talkState[talkUser] = 0
	end
	if msgcontains(msg, "heal") then
		if getCreatureCondition(cid, CONDITION_FIRE) == TRUE then
			npcHandler:say("You are burning. I will use water on you.", cid)
			doRemoveCondition(cid, CONDITION_FIRE)
			doSendMagicEffect(getCreaturePosition(cid), 14)
		elseif getCreatureCondition(cid, CONDITION_POISON) == TRUE then
			npcHandler:say("You are poisoned. I will cure you.", cid)
			doRemoveCondition(cid, CONDITION_POISON)
			doSendMagicEffect(getCreaturePosition(cid), 13)
		elseif getCreatureCondition(cid, CONDITION_ENERGY) == TRUE then
			npcHandler:say("You are electrificed. I will help you.", cid)
			doRemoveCondition(cid, CONDITION_ENERGY)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		elseif getCreatureCondition(cid, CONDITION_PARALYZE) == TRUE then
			npcHandler:say("You are paralyzed. I will cure you.", cid)
			doRemoveCondition(cid, CONDITION_PARALYZE)
			doSendMagicEffect(getCreaturePosition(cid), 14)
		elseif getCreatureCondition(cid, CONDITION_DROWN) == TRUE then
			npcHandler:say("You are drowing. I will help you.", cid)
			doRemoveCondition(cid, CONDITION_DROWN)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		elseif getCreatureCondition(cid, CONDITION_FREEZING) == TRUE then
			npcHandler:say("You are cold! I will burn you.", cid)
			doRemoveCondition(cid, CONDITION_FREEZING)
			doSendMagicEffect(getCreaturePosition(cid), 15)

		elseif getCreatureCondition(cid, CONDITION_DAZZLED) == TRUE then
			npcHandler:say("You are dazzled! Do not mess with holy creatures anymore!", cid)
			doRemoveCondition(cid, CONDITION_DAZZLED)
			doSendMagicEffect(getCreaturePosition(cid), 47)
		elseif getCreatureCondition(cid, CONDITION_CURSED) == TRUE then
			npcHandler:say("You are cursed! I will remove it.", cid)
			doRemoveCondition(cid, CONDITION_CURSED)
			doSendMagicEffect(getCreaturePosition(cid), 47)
		elseif getCreatureHealth(cid) < 65 then
			npcHandler:say("You are looking really bad. Let me heal your wounds.", cid)
			doCreatureAddHealth(cid, 65 - getCreatureHealth(cid))
			doSendMagicEffect(getCreaturePosition(cid), 12)
		elseif getCreatureHealth(cid) < 2000 then
			npcHandler:say("I did my best to fix your wounds.", cid)
			doCreatureAddHealth(cid, 2000 - getCreatureHealth(cid))
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			local msgheal = {
				"You aren't looking really bad, " .. getCreatureName(cid) .. ". I only help in cases of real emergencies. Raise your health simply by eating {food}.", 
				"Seriously? It's just a scratch", 
				"Don't be a child. You don't need any help with your health.", 
				"I'm not an expert. If you need help find a medic.", 
				"Don't even waste my time, I have bigger problems than your scratched armor."
			}
			npcHandler:say("" .. msgheal[math.random(1, #msgheal)] .. "", cid)
		end
	end
	if(msgcontains(msg, 'white') and msgcontains(msg, 'magic')) then
	selfSay('The white magic book, I saw it recently in library. If you are lucky enough you may still find it there.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'expert') and msgcontains(msg, 'spell')) then
	selfSay('They are available only for highest level wizards. They are mostly support and protection spells.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'stationary') and msgcontains(msg, 'shield')) then
	selfSay('Princess Estalice told me to learn this spell. It might be useful during assault of the hive one day.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'age') and msgcontains(msg, 'spell')) then
	selfSay('This one is available only for highest level wizards. I am not skilled enough to cast it.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'soft') and msgcontains(msg, 'wings')) then
	selfSay('This one allows to fly and walk on clouds by summoning mentioned wings, but they are very fragile and the spell is very complicated itself. I casted this spell once, but its user didn\'t appreciated my effort.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'lightbringer')) then
	selfSay('They are very rare creatures. Seeing one is like spotting a unicorn. They live in highest layers of clouds, a very little is known about them.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'cloudwalking')) then
	local spelldur = round((getPlayerStorageValue(cid, 22444)-os.time())/3600)
		if getPlayerStorageValue(cid,22444) < os.time() then
			if getPlayerMoney(cid) > 4999 then
			selfSay('The cloudwalking spell is simpler alternative of {soft wings} spell, but it\'s more dangerous also. You have to watch youself - if you fall from a cloud, nothing can save you. This spell lasts for three days. Do you want me to cast it on you for a small donation of 5000 gold?', cid)
			talkState[talkUser] = 9
			else
			selfSay('The cloudwalking spell is simpler alternative of {soft wings} spell, but it\'s more dangerous also. You have to watch youself - if you fall from a cloud, nothing can save you. This spell lasts for three days.', cid)
			talkState[talkUser] = 0
			end
		else
			if getPlayerMoney(cid) > 4999 then
			if spelldur == 1 then rt = '' else rt = 's' end
			selfSay('It seems you still have ' .. spelldur .. ' hour' .. rt .. ' of spell left. Do you want to extend your spell for 5000 gold? It will work for three days from now.', cid)			talkState[talkUser] = 9
			else
			selfSay('The cloudwalking spell is simpler alternative of {soft wings} spell, but it\'s more dangerous also. You have to watch youself - if you fall from a cloud, nothing can save you. This spell lasts for three days. You have ' .. spelldur .. ' hour' .. rt .. ' of spell left.', cid)
			talkState[talkUser] = 0
			end		
		end
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 9 then
	if(doPlayerRemoveMoney(cid, 5000)) then
	doCreatureSetStorage(cid, 22444, os.time() + (86400 * 3))
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
	selfSay('So be it! I hope you know what you are doing.', cid)
	talkState[talkUser] = 0
	else
	selfSay('Come back when you decide to bring me donation for serious. I don\'t work with cheaters.', cid)
	talkState[talkUser] = 0
	end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
