-- CONFIG BEGINS HERE --
local arena = {
  frompos = {x=1006, y=803, z=8},
  topos = {x=1014, y=811, z=8},
  exitpos = {x=1019, y=798, z=8} 
}
local checkpvparena = true -- checks if someone is blocking the arena
local duel_limit = 15 * 60 -- in seconds
local player1pos = {x = 1016, y = 806, z = 8}
local leverpos = {x = 1016, y = 807, z = 8}
local player2pos = {x = 1016, y = 808, z = 8}
local nplayer1pos = {x = 1006, y = 807, z = 8}
local nplayer2pos = {x = 1014, y = 807, z = 8}
-- CONFIG ENDS HERE --
 
 
function lever_back(uid)
   doTransformItem(uid,1945)
   return true
end
 
function kick_r()
if getCreaturesInQuestArea(TYPE_PLAYER, arena.frompos, arena.topos, GET_COUNT) > 1 then
   for a = arena.frompos.x, arena.topos.x do
   for b = arena.frompos.y, arena.topos.y do
     pos = {x=a,y=b,z=8,stackpos = 255}
     if(isPlayer(getTopCreature(pos).uid)) then
       doPlayerSendTextMessage(getTopCreature(pos).uid,MESSAGE_INFO_DESCR,"Time up. Round drawn.")
       doTeleportThing(getTopCreature(pos).uid,arena.exitpos)
     end
   end
   end
end
   return true
end
 
local TYPE_PLAYER = 1
local TYPE_MONSTER = 2
local TYPE_NPC = 3
local TYPE_ALL = 4
local GET_COUNT = 1
local GET_UID = 2
 
function getCreaturesInQuestArea(type, fromPos, toPos, get, countSummon)
   local types =
   {
     [TYPE_PLAYER] = isPlayer,
     [TYPE_MONSTER] = isMonster,
     [TYPE_NPC] = isNpc,
     [TYPE_ALL] = isCreature
   }
   local tmp = {}
   local t = types[type]
   if not t then
     return print("[!] --> [Warning - Function::getCreaturesInQuestArea] Unknown type " .. (type or "(nil value)"))
   end
   local thing
   local pos
   for x = fromPos.x, toPos.x do
     for y = fromPos.y, toPos.y do
       for z = fromPos.z, toPos.z do
         pos = {x = x, y = y, z = z}
         thing = getTopCreature(pos)
         if t(thing.uid) then
           table.insert(tmp, thing.uid)
           if not countSummon and isSummon(thing.uid) then
             for i = 1, #tmp do
               if tmp[i] == thing.uid then
                 table.remove(tmp, i)
                 break
               end
             end
           end
         end
       end
     end
   end
   return (get == GET_COUNT and #tmp or get == GET_UID and tmp or print("[Warning - Function::getCreaturesInQuestArea] Unknown type to get " .. (get or "(nil value)")))
end
 
function onUse(player, item, frompos, item2, topos)
local cid = player:getId()
   if item.itemid == 1945 then
     if isPlayer(getTopCreature(player1pos).uid) == true and isPlayer(getTopCreature(player2pos).uid) == true then
       if checkpvparena then
         if getCreaturesInQuestArea(TYPE_PLAYER, arena.frompos, arena.topos, GET_COUNT) > 0 then
           if getCreaturesInQuestArea(TYPE_PLAYER, arena.frompos, arena.topos, GET_COUNT) == 1 then
             for c = arena.frompos.x, arena.topos.x do
             for d = arena.frompos.y, arena.topos.y do
               pos = {x=c,y=d,z=8, stackpos = 255}
               if(isPlayer(getTopCreature(pos).uid)) then
                 doPlayerSendTextMessage(getTopCreature(pos).uid,MESSAGE_INFO_DESCR,"You have been kicked from the arena.")
                 doTeleportThing(getTopCreature(pos).uid,arena.exitpos)
               end
             end
             end
           else
           arena_counter = getGlobalStorageValue(24519) - os.time()
           if arena_counter < 0 then
             for c = arena.frompos.x, arena.topos.x do
             for d = arena.frompos.y, arena.topos.y do
               pos = {x=c,y=d,z=8, stackpos = 255}
               if(isPlayer(getTopCreature(pos).uid)) then
                 doPlayerSendTextMessage(getTopCreature(pos).uid,MESSAGE_INFO_DESCR,"You have been kicked from the arena.")
                 doTeleportThing(getTopCreature(pos).uid,arena.exitpos)
               end
             end
             end
           else
           doCreatureSay(cid, "There is still active duel.\n" .. showTimeLeft(arena_counter, true) .. " left.\nPlease wait for your turn.", TALKTYPE_ORANGE_1)
           pvpaback = addEvent(lever_back, 5000, item.uid)
           return false
           end
           end
         end
       end
       -- let the match begin
       doSendMagicEffect(player1pos,CONST_ME_POFF)
       doSendMagicEffect(player2pos,CONST_ME_POFF)
       doPlayerSendTextMessage(getTopCreature(player1pos).uid,MESSAGE_STATUS_WARNING,"Fight!")
       doPlayerSendTextMessage(getTopCreature(player2pos).uid,MESSAGE_STATUS_WARNING,"Fight!")
       doTeleportThing(getTopCreature(player1pos).uid,nplayer1pos)
       doTeleportThing(getTopCreature(player2pos).uid,nplayer2pos)
       doSendMagicEffect(nplayer1pos,CONST_ME_TELEPORT)
       doSendMagicEffect(nplayer2pos,CONST_ME_TELEPORT)
       doTransformItem(getTileItemById(leverpos, 1945).uid,item.itemid+1)
       setGlobalStorageValue(24519,os.time() + duel_limit)
       pvpaback = addEvent(lever_back, 5000, item.uid)
       if arena_kick_r then
       stopEvent(arena_kick_r)
       end
       arena_kick_r = addEvent(kick_r, duel_limit * 1000)
     else
       doCreatureSay(cid, "You need two players to enter the arena.", TALKTYPE_ORANGE_1)
       pvpaback = addEvent(lever_back, 5000, item.uid)
       return false
     end
   else
     -- if timer or checking is offline player can push the lever manually
     if pvpaback then
     doPlayerSendDefaultCancel(cid, RETURNVALUE_CANNOTUSETHISOBJECT)
     else
     doTransformItem(getTileItemById(leverpos, 1946).uid,1945)
     end
   end
return true
end