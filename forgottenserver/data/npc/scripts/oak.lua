local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local random_texts = {'I should find a way to fix that house.', 'Come in, please.', 'I want to paaaaaarty!', 'Come in, I have candies.', '<sings> A true, true friend helps a friend in need,\na friend will be there to help them see...', '<sings>All you have to do is take a cup of flour,\nadd it to the mix!', 'Neki! You should stop talking to yourself... starting from Now!'}
local random_texts_chance = 10 -- percent
local random_texts_interval = 5 -- seconds
local talkState = {}
local function round(num, idp)
    local mult = 10^(idp or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end
random_word_neki = 0
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()
	if(random_word_neki < os.time()) then
		random_word_neki = (os.time() + random_texts_interval)
		if(math.random(1, 100) < random_texts_chance) then
			selfSay(random_texts[math.random(1, #random_texts)])
		end
	end
	npcHandler:onThink()
end

function greetCallback(cid)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local msg = {
		"Hi. What are you doing here? Are you alone? Because, you know I don't meet guests here often.", 
		"So your name is " .. getPlayerName(cid) .. ". Come and be my guest.", 
		"Finally! Somepo... someone! I don't meet guests often, come in.", 
		"Come, I was about to make {cupcakes}, it appears I don't need to eat them alone!", 
	}
	local msgknow = {
		"Welcome again. Oh I am so happy you're back. It was like eternity when you ran last time, you know?", 
		"Hey, I remember you, you are that po... person I met last time, aren't you?", 
		"Come in, my little warrior. Have you enjoyed your last visit here?", 
		"Hello again, " .. getPlayerName(cid) .. ". I was just wondering why don't move to the {city} centre and have a massive party here! Is that good idea?", 
	}
	if getPlayerStorageValue(cid, 49950) < 1 then
	npcHandler:setMessage(MESSAGE_GREET, msg[math.random(1, #msg)])
	talkState[talkUser] = 0
	doCreatureSetStorage(cid, 49950, 1)
	else
	npcHandler:setMessage(MESSAGE_GREET, msgknow[math.random(1, #msgknow)])
	talkState[talkUser] = 5
	end
	return true
end

function creatureSayCallback(cid, type, msg)
 local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, "page") then
			if getCreatureStorage(cid, 49951) < 1 then
				selfSay("What? Someone took that page? No! It was one of stories of my childhood. Find it and bring it back.", cid)
				doCreatureSetStorage(cid, 49951, 1)
				talkState[talkUser] = 0
			else
				if getCreatureStorage(cid, 49951) == 1 then
					selfSay("Did you found that missing page?", cid)
					talkState[talkUser] = 7
				else
					selfSay("Thank you for your hard work. My childhood memory is complete again.", cid)
					talkState[talkUser] = 0
				end
			end
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 7 then
		if doPlayerRemoveItem(cid,9663,1) then
			if getCreatureStorage(cid, 35712) == 1 then
				selfSay("You found it where? Yesim did what? It wasn't nice, he didn't even told me. Great work! Really wonderful. I should reward you, but I don't have anything. Take these clothes as a reward.", cid)
				doCreatureSetStorage(cid, 49951, 2)
				doPlayerAddOutfit(cid, 514, 1)
				doPlayerAddOutfit(cid, 516, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				talkState[talkUser] = 0	
			else
				selfSay("You found it where? I have no idea how could I lose that. Great work! Really wonderful. I should reward you, but I don't have anything. Take these clothes as a reward.", cid)
				doCreatureSetStorage(cid, 49951, 2)
				doPlayerAddOutfit(cid, 514, 1)
				doPlayerAddOutfit(cid, 516, 1)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				talkState[talkUser] = 0
			end
		else
			selfSay("This is not the page we are looking for.", cid)
			talkState[talkUser] = 0
		end
	end
	if msgcontains(msg, "no") and talkState[talkUser] == 16 then
		selfSay("Go to temple and let the priestess heal you. I will not teleport you due to my lack of magic skill.", cid)
		talkState[talkUser] = 0
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 16 then
		selfSay("Good. If you would try it again one day, ask me.", cid)
		talkState[talkUser] = 0
	end
	if msgcontains(msg, "no") and talkState[talkUser] == 7 then
		selfSay('Well, things hide from us sometimes, teehee.', cid)
		talkState[talkUser] = 0
	end
 	if msgcontains(msg, "yes") and talkState[talkUser] == 5 then
		selfSay("I knew you would answer like that. Come in, let's have a {party}!", cid)
	talkState[talkUser] = 0
	end
	if msgcontains(msg, "no") and talkState[talkUser] == 5 then
	selfSay('Why? Where I made mistake? What have I done wrong? Why do all the people run from me that fast?', cid)
	talkState[talkUser] = 0
	end
	if msgcontains(msg, "enchant") then
	if getCreatureStorage(cid, 35715) < 1 then
	selfSay("Hmm... strange stuff, I would try, but I forgot how to enchant. Bring me something to try... hmm... My last {axe} was broken on a tree near my house. Would be nice if you could bring me a new one and I will see what I can do with that. Maybe it will be able to work longer than normal one.", cid)
	talkState[talkUser] = 0
	doCreatureSetStorage(cid, 35715, 1)
	else
	if getPlayerItemCount(cid, 2386) > 0 then
	selfSay("Yes, this one looks perfect! Would you give it to me now?", cid)
	talkState[talkUser] = 8
	else
	selfSay("This one is too complicated to enchant. I don't even know how to use it if it's really an axe as you think.", cid)
	talkState[talkUser] = 0
	end
	end
	end
	
	if msgcontains(msg, "yes") and talkState[talkUser] == 8 then
		if getPlayerItemCount(cid, 2386) > 0 then
		local random = math.random(1,100)
		doPlayerTakeItem(cid, 2386, 1)
		if random >= 50 then
		doPlayerAddItem(cid, 8293, 1)
		selfSay("It worked, it worked! I can't believe I still can do such stuff. When you finish testing leave it near my house.",cid)
		talkState[talkUser] = 0
		else
		selfSay("Looks like my {destiny} is not for this. Try to find another one while I will read a book about enchanting.",cid)
		talkState[talkUser] = 0
		end
		else
			selfSay("Come on, I know you have that axe, stop kidding and give it to me.",cid)
			talkState[talkUser] = 0
		end
	end
	
	if msgcontains(msg, "axe") then
		selfSay("I've broken my axe last time I was earning some wood. Maybe enchanted one will stay longer. Do you have any axe with you?", cid)
		talkState[talkUser] = 8
	end
	
	if msgcontains(msg, "no") and talkState[talkUser] == 8 then
		selfSay('Okay. Then go and bring me some wood yourself.', cid)
		talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "vanilla") then
		selfSay("Did you found some? Where? Did you found it?", cid)
		talkState[talkUser] = 9
	end
	
	if msgcontains(msg, "no") and talkState[talkUser] == 9 then
		selfSay("It's really hard to find one these days.", cid)
		talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "yes") and talkState[talkUser] == 9 then
		selfSay("This doesn't even look like vanilla. Keep searching.", cid)
		talkState[talkUser] = 0
	end
	if msgcontains(msg, "demon") or msgcontains(msg, "oak") then
		if getCreatureStorage(cid, oakStorages.done) == 1 then
			if getCreatureStorage(cid, 49952) < 1 then
				selfSay("What? A tree which cannot be defeated by giggling? Interesting. And what have you done for that? Ouch. I have some stuff after my grandad, he was some kind of enchanter or something. I think you are the warrior worth wearing it. Do you accept with my point of view?", cid)
				talkState[talkUser] = 4
			else
				selfSay("Thank you once again. If outfit wasn't enough you may eat some {candies} from upper floor.", cid)
				talkState[talkUser] = 0
			end
		else
		selfSay("There are no demon trees. I'm telling you. Giggle at them, you will see.", cid)
		talkState[talkUser] = 0
		end
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 4 then
		selfSay("Take them. Wear them with pride and listen. There is old legend nana told me when I was little girl: Where the brambles are thickest, there you will find a pond, beyond the most twisted of vines, the mirror pool... I don't know maybe it helps you somehow, who knows?", cid)
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
		doCreatureSetStorage(cid, 49952, 1)
		talkState[talkUser] = 0
	end
	if msgcontains(msg, "no") and talkState[talkUser] == 4 then
		selfSay("Get back here instantly when you change your mind.", cid)
		talkState[talkUser] = 0
	end
		if(msgcontains(msg, 'white') and msgcontains(msg, 'magic')) then
	selfSay('The white magic book, I saw it in library when I was young enchantress. I have no idea if its still there.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'expert') and msgcontains(msg, 'spell')) then
	selfSay('Looks like my {destiny} is not for this. Try to find another one while I will read a book about enchanting.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'stationary') and msgcontains(msg, 'shield')) then
	selfSay('How was this going? From one to another, another to one... no, no, no. This wasn\'t it. Better not cast anything without proper lecture.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'age') and msgcontains(msg, 'spell')) then
	selfSay('I tried it once, nothing happend.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'soft') and msgcontains(msg, 'wings')) then
	selfSay('Ha! I heard about it! Flying was always my dream, but my skill was too poor to cast it.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'lightbringer')) then
	selfSay('I saw one, maybe two. One rider owned one, but refused to tell where he found it.', cid)
	talkState[talkUser] = 0
	end
	if(msgcontains(msg, 'cloudwalking')) then
	local spelldur = round((getPlayerStorageValue(cid, 22444)-os.time())/3600)
		if getPlayerStorageValue(cid,22444) < os.time() then
			if getPlayerLevel(cid) > 499 and getPlayerItemCount(cid, 6500) > 2 then
			selfSay('I think I know how to cast it, but I failed in finding a good ladder to the sky, <giggles>. I need three demonic essences <whines> which are obviously less rare than vanilla. I have no idea if this spell works, but consumes essences so it\'s worth a try! Do you have them with you?', cid)
			talkState[talkUser] = 15
			else
			selfSay('I think I know how to cast it, but I failed in finding a good ladder to the sky, <giggles>. I need three demonic essences <whines> which are obviously less rare than vanilla. I have no idea if this spell works, but consumes essences so it\'s worth a try!', cid)
			talkState[talkUser] = 0
			end
		else
			if getPlayerLevel(cid) > 499 and getPlayerItemCount(cid, 6500) > 2 then
			if spelldur == 1 then rt = '' else rt = 's' end
			selfSay('It seems you still have ' .. spelldur .. ' hour' .. rt .. ' of spell more or something. Do you want me to try to extend your spell?', cid)			talkState[talkUser] = 15
			else
			selfSay('You should take a break. Last time you fell off that cloud I ran as fast as I could to bring you back to temple! I\'m not going to cast it for you soon, but if you want to risk you still have ' .. spelldur .. ' hour' .. rt .. ' of spell left.', cid)
			talkState[talkUser] = 0
			end		
		end
	end
	if msgcontains(msg, "yes") and talkState[talkUser] == 15 then
	if doPlayerTakeItem(cid, 6500, 3) then
	local hurt = math.random(1,100)
	if hurt >= 70 then
			if getCreatureHealth(cid) < 300 then
				npcHandler:say("I think it went wrong. Are you alright?", cid)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_EXPLOSIONAREA)
				doSendMagicEffect(getCreaturePosition(cid), 13)
			else
				npcHandler:say("Sweet Estalice! I didn't mean to hurt you. I'm sorry. Are you alright?", cid)
				doCreatureAddHealth(cid, -200)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_EXPLOSIONAREA)
				doSendMagicEffect(getCreaturePosition(cid), 13)
			end
		talkState[talkUser] = 16
	else
	doCreatureSetStorage(cid, 22444, os.time() + (86400 * 3))
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
	selfSay('I have no idea if it worked, but if you know any heaven lift <laughs>, you should try it out.', cid)
	talkState[talkUser] = 0
	end
	else
	selfSay('No, silly! They ain\'t essences. Not demonic either.', cid)
	talkState[talkUser] = 0
	end
	end
	if msgcontains(msg, "no") and talkState[talkUser] == 15 then
		selfSay("Get back here instantly when you change your mind.", cid)
		talkState[talkUser] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())