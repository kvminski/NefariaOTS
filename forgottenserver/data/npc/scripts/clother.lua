local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and (not npcHandler:isFocused(cid)) then
		npcHandler:say(getPlayerSex(cid) == 0 and "Well hello there lovely lady! How may I help you today?" or "Well hello sir, how may I help you today?", cid)
		Topic[cid] = 0
		npcHandler:addFocus(cid)
	elseif msgcontains(msg, "red robe") and npcHandler:isFocused(cid) then
		npcHandler:say("You want a red piece of cloth in exchange for a {red robe}?", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2655, 1) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 5911, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have a red robe to exchange.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			npcHandler:say("Okay then.", cid)
			Topic[cid] = 0
		end
	elseif msgcontains(msg, "green tunic") and npcHandler:isFocused(cid) then
		npcHandler:say("You want a green piece of cloth in exchange for a 10 {green tunic}s?", cid)
		Topic[cid] = 2
	elseif Topic[cid] == 2 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2652, 10) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 5910, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have 10 green tunics to exchange.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			npcHandler:say("Okay then.", cid)
			Topic[cid] = 0
		end
	elseif msgcontains(msg, "mystic turban") and npcHandler:isFocused(cid) then
		npcHandler:say("You want a blue piece of cloth in exchange for a {mystic turban}?", cid)
		Topic[cid] = 3
	elseif Topic[cid] == 3 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2663, 1) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 5912, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have a mystic turban to exchange.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			npcHandler:say("Okay then.", cid)
			Topic[cid] = 0
		end
	elseif(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") and npcHander:isFocused(cid) then
		npcHandler:say("Good bye.", cid, TRUE)
		Topic[cid] = nil
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, "help") then
		npcHandler:say("I can make for you blue, red or green piece of clothes for some old cloths like {mystic turban}, {red robe} or 10 {green tunic}s.", cid)
		Topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")