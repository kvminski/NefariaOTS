

local posdotp = {x= 1054, y=1876, z=9} -- Posicao que o tp vai ser criado (Eh o tp que leva pra sala do Deathstriker)


function removerTp(tp)
    local t = getTileItemById(posdotp, 1387)
    if t then
        doRemoveItem(t.uid, 1)
        doSendMagicEffect(posdotp, CONST_ME_POFF)
    end
end

function TirarCristal()
    local cristal = getTileItemById(posdotp, 17999) -- Id do cristal azul que some para dar lugar ao tp
    if cristal then
        doRemoveItem(cristal.uid, 1)
    end
    return true
end
     
function onTimer5() --creates wall back
doCreateItem(17999,1,posdotp)-- Stone pos
end

function onTimer6()
local tp = Game.createItem(1387, 1, posdotp)
tp:setActionId(45702)
 end

function onUse(cid, item, fromPosition, itemEx, toPosition)
  if(getGlobalStorageValue(99974) < 1) then
		setGlobalStorageValue(99974, 1)
			for i = 1, 6 do
				for k = 1, 10 do
					creatures = {
						"minion of versperoth"
					}
				pos = {x = math.random(1018, 1032), y = math.random(1840, 1851), z = 11}    
				addEvent(doSummonCreature, i * 20 * 1000, creatures[math.random(1, 2)], pos)
				addEvent(doSendMagicEffect, i * 20 * 1000, pos, CONST_ME_TELEPORT)
			end
	 end
        
   	 doCreatureSay(cid, "The crystals are damaging!", TALKTYPE_ORANGE_1, false, cid, toPosition)
  			
   	 addEvent(TirarCristal, 6*20*1000)
  	 addEvent(onTimer6, 100+6*20*1000) -- Warzone TP 
   	 addEvent(removerTp, 60000+6*20*1000)
	 addEvent(onTimer5, 61000+6*20*1800) --2minutes
	 addEvent(setGlobalStorageValue, 6*20*1000 + 10*60*1000, 99974, 0)
    else
        doPlayerSendCancel(cid, "Wait 10 minutes to start again.")
    end
    return true
end