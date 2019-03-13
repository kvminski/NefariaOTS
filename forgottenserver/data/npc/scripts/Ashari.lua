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
		npcHandler:say(getPlayerSex(cid) == 0 and "Hello lady! How may I help you?" or "Hello sir, how may I help you?", cid)
		Topic[cid] = 0
		npcHandler:addFocus(cid)
	elseif msgcontains(msg, "helmet of the ancients") and npcHandler:isFocused(cid) then
		npcHandler:say("You want a helmet of the ancient in exchange for these parts?", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2336, 1) and 
				doPlayerRemoveItem(cid, 2337, 1) and 
				doPlayerRemoveItem(cid, 2335, 1) and
				doPlayerRemoveItem(cid, 2339, 1) and
				doPlayerRemoveItem(cid, 2340, 1) and
				doPlayerRemoveItem(cid, 2338, 1) and
				doPlayerRemoveItem(cid, 2341, 1) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 2342, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have parts to exchange.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			npcHandler:say("Okay then.", cid)
			Topic[cid] = 0
		end

	elseif msgcontains(msg, "enchanted chicken wing") and npcHandler:isFocused(cid) then
		npcHandler:say("You want an enchanted chicken wing in exchange for boots of haste?", cid)
		Topic[cid] = 2
	elseif Topic[cid] == 2 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2195, 1) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 5891, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have boots of haste.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			npcHandler:say("Okay then.", cid)
			Topic[cid] = 0
		end

		elseif msgcontains(msg, "fighting spirit") and npcHandler:isFocused(cid) then
		npcHandler:say("You want a fighting spirit in exchange for 2 royal helmets?", cid)
		Topic[cid] = 3
	elseif Topic[cid] == 3 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2498, 2) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 5884, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have 2 royal helmets.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			npcHandler:say("Okay then.", cid)
			Topic[cid] = 0
		end

		elseif msgcontains(msg, "magic sulphur") and npcHandler:isFocused(cid) then
		npcHandler:say("You want a magic sulphur in exchange for 3 fire swords?", cid)
		Topic[cid] = 4
	elseif Topic[cid] == 4 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2392, 3) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 5904, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have 3 fire swords.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			npcHandler:say("Okay then.", cid)
			Topic[cid] = 0
		end

		elseif msgcontains(msg, "flask of warrior's sweat") and npcHandler:isFocused(cid) then
		npcHandler:say("You want a flask of warrior's sweat in exchange for 4 warrior helmets?", cid)
		Topic[cid] = 5
	elseif Topic[cid] == 5 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 2475, 4) then
				npcHandler:say("Here you are.", cid)
				doPlayerAddItem(cid, 5885, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				npcHandler:say("You do not have 4 warrior helmets.", cid)
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
	elseif msgcontains(msg, "job") then
		npcHandler:say("I can make for you helmet of the ancients, if you have every needed part of course.", cid)
		Topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")