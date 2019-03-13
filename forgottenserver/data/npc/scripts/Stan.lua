-- Collecting items missions by Limos
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid)           npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)          npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg) end
function onThink()              npcHandler:onThink() end

local missions = {
    [1] = {items = {
     {id = 8859, count = 5},
     },
     message = "Great, I need few animal items, but you can start with",
     level = 2, -- minimum level voor this mission
     rewarditem = {id = 2152, count = 1},
     rewardexp = 250
   },
   [2] = {items = {
     {id = 5890, count = 3},
     {id = 5902, count = 1},
     },
     message = "Good, now bring me",
     level = 4, -- minimum level voor this mission
     rewarditem = {id = 2152, count = 1},
     rewardexp = 250
   },
   [3] = {items = {
     {id = 5897, count = 5},
     },
     message = "Thank you, the next items are",
     level = 5,
     rewarditem = {id = 2152, count = 2},
     rewardexp = 500
   },
   [4] = {items = {
     {id = 5896, count = 5},
     },
     message = "Awesome, now get",
     level = 5,
     rewarditem = {id = 2152, count = 2},
     rewardexp = 500
   },
   [5] = {items = {
     {id = 10606, count = 10},
     },
     message = "Thanks, now I need",
     level = 5,
     rewarditem = {id = 2152, count = 3},
     rewardexp = 750 
   },
   [6] = {items = {
     {id = 12435, count = 5},
     {id = 11113, count = 5},
     },
     message = "Good, now bring me",
     level = 6,
     rewarditem = {id = 2152, count = 5},
     rewardexp = 1000
   },
   [7] = {items = {
     {id = 5878, count = 5},
     },
     message = "Great, now get",
     level = 7,
     rewarditem = {id = 2152, count = 5},
     rewardexp = 1000
   },
   [8] = {items = {
     {id = 10609, count = 5},
     },
     message = "Good, now I need",
     level = 10,
     rewarditem = {id = 2152, count = 10},
     rewardexp = 2000
   },
   [9] = {items = {
     {id = 11208, count = 10},
     },
     message = "Awesome, bring me now",
     level = 13,
     rewarditem = {id = 2152, count = 50},
     rewardexp = 3000
   },
   [10] = {items = {
     {id = 5877, count = 15},
     },
     message = "Thanks, now I need",
     level = 25,
     rewarditem = {id = 2160, count = 2},
     rewardexp = 15000
   },
   [11] = {items = {
     {id = 5879, count = 5},
     },
     message = "Good, only a few items left,",
     level = 70,
     rewarditem = {id = 2160, count = 10},
     rewardexp = 200000
   },
}

local storage = 45555

local function getItemsFromTable(itemtable)
     local text = ""
     for v = 1, #itemtable do
         count, info = itemtable[v].count, getItemInfo(itemtable[v].id)
         local ret = ", "
         if v == 1 then
             ret = ""
         elseif v == #itemtable then
             ret = " and "
         end
         text = text .. ret
         text = text .. (count > 1 and count or info.article).." "..(count > 1 and info.plural or info.name)
     end
     return text
end

function creatureSayCallback(cid, type, msg)

     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

     local xstorage = getPlayerStorageValue(cid, storage)
     local x = missions[xstorage]

     if not npcHandler:isFocused(cid) then
         return false
     end

     if msgcontains(msg, 'mission') then
         if xstorage == -1 then
             selfSay("I am a tanner and I am currently doing some research, do you think you can help me out?", cid)
             talkState[talkUser] = 1
         elseif x then
             if getPlayerLevel(cid) >= x.level then
                 selfSay("Did you get the {items} I asked you?", cid)
                 talkState[talkUser] = 1
             else
                 selfSay("The mission I gave you is for level "..x.level..", come back later.", cid)
             end
         else
             selfSay("Thanks again for all your items, it helped me alot.", cid)
             npcHandler:releaseFocus(cid)
         end
     elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 then
         if xstorage == -1 then
             setPlayerStorageValue(cid, storage, 1)
             local x = missions[getPlayerStorageValue(cid, storage)]
             selfSay(x.message.." "..getItemsFromTable(x.items)..".", cid)
         elseif x then
             local amount = 0
             for i = 1, #x.items do
                 if getPlayerItemCount(cid, x.items[i].id) >= x.items[i].count then
                     amount = amount + 1
                 end
             end
             if amount == #x.items then
                 for i = 1, #x.items do
                     doPlayerRemoveItem(cid, x.items[i].id, x.items[i].count)
                 end
                 if x.rewarditem then
                     local count, info = x.rewarditem.count, getItemInfo(x.rewarditem.id)
                     doPlayerAddItem(cid, x.rewarditem.id, count)
                     doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You received "..(count > 1 and count or info.article).." "..(count > 1 and info.plural or info.name)..".")
                 end
                 if x.rewardexp then
                     doPlayerAddExp(cid, x.rewardexp)
                     doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You received "..x.rewardexp.." experience.")
                 end
                 setPlayerStorageValue(cid, storage, xstorage + 1)
                 local x = missions[getPlayerStorageValue(cid, storage)]
                 if x then
                     selfSay(x.message.." "..getItemsFromTable(x.items)..".", cid)
                 else
                     selfSay("Thanks alot! I can finish my research now.", cid)
                 end
             else
                 local n = 0
                 for i = 1, #x.items do
                     if getPlayerItemCount(cid, x.items[i].id) < x.items[i].count then
                         n = n + 1
                     end
                 end
                 local text = ""
                 local c = 0
                 for v = 1, #x.items do
                     count, info = x.items[v].count - getPlayerItemCount(cid, x.items[v].id), getItemInfo(x.items[v].id)
                     if getPlayerItemCount(cid, x.items[v].id) < x.items[v].count then
                         c = c + 1
                         local ret = ", "
                         if c == 1 then
                             ret = ""
                         elseif c == n then
                             ret = " and "
                         end
                         text = text .. ret
                         text = text .. (count > 1 and count or info.article).." "..(count > 1 and info.plural or info.name)
                     end
                 end
                 selfSay("You don't have all items, you still need to get "..text..".", cid)
             end
         end
         talkState[talkUser] = 0
     elseif msgcontains(msg, 'items') and x then
         selfSay("The items I asked you are "..getItemsFromTable(x.items)..".", cid)
     elseif msgcontains(msg, 'no') and talkState[talkUser] == 1 then
         selfSay("Oh well, I guess not then.", cid)
     end
     return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Bye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye? I guess...")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())