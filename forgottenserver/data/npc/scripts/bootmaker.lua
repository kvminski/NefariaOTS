local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local random_texts = {'Welcome to my service.', 'What a day.', 'Come in, don\'t be shy', 'You are what you wear.'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
random_word_boots = 0
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()
	if(random_word_boots < os.time()) then
		random_word_boots = (os.time() + random_texts_interval)
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
		"Welcome to my humble service.", 
		"Be greeted," .. getPlayerName(cid) .. ".", 
		"Welcome, " .. getPlayerName(cid) .. ". How may I help you?", 
		"Hello.", 
		"Looks like we are meeting again, " .. getPlayerName(cid) .. "."
	}
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	talkState[talkUser] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local msgrepair = {
		"What a terrible smell! I will do my best to fix them, but I want 10000 gold as a fee for hard work. Are you ready to pay?", 
		"I'm unable to work with such smelly thing! No offense, I want 10000 gold for that. Do you have money with you?", 
		"You know... These boots are magical and expensive and... VERY SMELLY. Where you were walking? Nevermind. Would you pay me 10000 gold for hard work?", 
		"Do you have money with you?", 
		"It's you again, " .. getPlayerName(cid) .. "? Please be more careful next time. 10000 gold and I'll repair them for you. Deal?"
	}
	
	if(msgcontains(msg, 'soft')) then
		if ((getPlayerItemCount(cid, 6530) >= 1) or (getPlayerItemCount(cid, 10021) >= 1)) then
		selfSay(msgrepair[math.random(1, #msgrepair)], cid)
		talkState[talkUser] = 1
		else
			selfSay('Your boots are in good state. They don\'t need repair yet.', cid)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'yes') and talkState[talkUser] == 1) or (msgcontains(msg, 'deal') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 6530) >= 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				local item = getPlayerItemById(cid, true, 6530)
				doTransformItem(item.uid, 6132)
				selfSay('Be more careful next time.', cid)
				talkState[talkUser] = 0
			else
				selfSay('You lied. You are too poor to pay. Don\'t even try to scam me!', cid)
				talkState[talkUser] = 0
			end
		elseif(getPlayerItemCount(cid, 10021) >= 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				local item = getPlayerItemById(cid, true, 10021)
				doTransformItem(item.uid, 6132)
				selfSay('Be more careful next time.', cid)
				talkState[talkUser] = 0
			else
				selfSay('You lied. You are too poor to pay. Don\'t even try to scam me!', cid)
				talkState[talkUser] = 0
			end
		else
			selfSay('Child. I have really bad day, stop playing with these boots.', cid)
			talkState[talkUser] = 0
		end
		talkState[talkUser] = 0
	end	
	if(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
		talkState[talkUser] = 0
		selfSay('Good.', cid)
	end
	local msgrepairfrw = {
		"These ones smell even worse than soft boots. If you want me to do this I want 10000 gold as a fee for hard work. Are you ready to pay?", 
		"Internal magic harmony of these ones seems to be disturbed. I want 10000 gold to cover cost of fixing that. Do you have money with you?", 
		"You know... These boots are magical and expensive. Would you pay me 10000 gold for recharging their magic?", 
		"Do you have money with you?", 
		"Please be more careful next time. 10000 gold and I'll repair them for you. Deal?"
	}
	if(msgcontains(msg, 'firewalker')) then
		if ((getPlayerItemCount(cid, 9934) >= 1) or (getPlayerItemCount(cid, 10022) >= 1)) then
		selfSay(msgrepairfrw[math.random(1, #msgrepairfrw)], cid)
		talkState[talkUser] = 2
		else
			selfSay('Your boots are in good state. They don\'t need repair yet.', cid)
			talkState[talkUser] = 0
		end
	end
	if(msgcontains(msg, 'yes') and talkState[talkUser] == 2) or (msgcontains(msg, 'deal') and talkState[talkUser] == 2) then
		if(getPlayerItemCount(cid, 9934) >= 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				local item = getPlayerItemById(cid, true, 9934)
				doTransformItem(item.uid, 9933)
				selfSay('Be more careful next time.', cid)
				talkState[talkUser] = 0
			else
				selfSay('You lied. You are too poor to pay. Don\'t even try to scam me!', cid)
				talkState[talkUser] = 0
			end
		elseif(getPlayerItemCount(cid, 10022) >= 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				local item = getPlayerItemById(cid, true, 10022)
				doTransformItem(item.uid, 9933)
				selfSay('Be more careful next time.', cid)
				talkState[talkUser] = 0
			else
				selfSay('You lied. You are too poor to pay. Don\'t even try to scam me!', cid)
				talkState[talkUser] = 0
			end
		else
			selfSay('Child. I have really bad day, stop playing with these boots.', cid)
			talkState[talkUser] = 0
		end
		talkState[talkUser] = 0
	end	
	if(msgcontains(msg, 'no') and talkState[talkUser] == 2) then
		talkState[talkUser] = 0
		selfSay('Good.', cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
