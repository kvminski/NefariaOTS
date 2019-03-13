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
		selfSay("Hello. How may I help you?", cid)
		Topic[cid] = 0
		npcHandler:addFocus(cid)


	elseif msgcontains(msg, "join") and getPlayerStorageValue(cid, 38993) == -1 and npcHandler:isFocused(cid) then
		selfSay("So you want to be one of us... Do you have me 5 pirate voodoo dolls?", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, "yes") then
			if doPlayerRemoveItem(cid, 5810, 5) then
				selfSay("Now you're one of us, wear this outfit.", cid)
				doPlayerAddOutfit(cid, 151)
    			doPlayerAddOutfit(cid, 155)
    			setPlayerStorageValue(cid, 38993, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				Topic[cid] = 0
			else
				selfSay("You don't have dolls.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "no") then
			selfSay("Okay then.", cid)
			Topic[cid] = 0
		end

	elseif msgcontains(msg, "travel") and getPlayerStorageValue(cid, 38993) == 1 and npcHandler:isFocused(cid) then
		selfSay("I can bring you to: {x1}, {x2} and {x3}. Where you want to go?", cid)

	local travelNode = keywordHandler:addKeyword({'x1'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You want to go to {x1} for 500 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 500, destination = {x=440, y=503, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Mrgh'})

	local travelNode = keywordHandler:addKeyword({'x2'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You want to go to {x2} for 500 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 500, destination = {x=440, y=503, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Mrgh'})

	local travelNode = keywordHandler:addKeyword({'x3'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You want to go to {x3} for 500 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 500, destination = {x=440, y=503, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Mrgh'})


	elseif(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") and npcHander:isFocused(cid) then
		selfSay("Good bye.", cid, TRUE)
		Topic[cid] = nil
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, "job") then
		selfSay("I'm a pirate.", cid)
		Topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")