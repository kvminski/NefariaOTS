--- [[ Warzone 1 feito por Yuri Lagrotta ]] ---

local kickposs = {x=950, y=1867, z=8}  
 
local function deDeathstrike()
if(getGlobalStorageValue(91139) < 1) then
    TOP_LEFT_CORNER = {x=1040, y=1917, z=9, stackpos=253}
    BOTTOM_RIGHT_CORNER = {x=1075, y=1947, z=9, stackpos=253}
	for Py = TOP_LEFT_CORNER.y, BOTTOM_RIGHT_CORNER.y do
		for Px = TOP_LEFT_CORNER.x, BOTTOM_RIGHT_CORNER.x do
			creature = getThingfromPos({x=Px, y=Py, z=9, stackpos=253})
			if isMonster(creature.uid) then
				if getCreatureName(creature.uid) == "Deathstrike" then
					doRemoveCreature(creature.uid)
					setGlobalStorageValue(91139, 1)
					addEvent(setGlobalStorageValue, 5 * 60 * 1000, 91139, 0) 
					end
				end
			end
		end
    end
    return FALSE
end
       
function onStepIn(cid, item, position, topos, frompos)
    if not isPlayer(cid) then
        return false
    end
           
if item.actionid == 5157 then
	doPlayerSendTextMessage(cid, 19, "You have half an hour to heroically defeat Deathstrike. Otherwise you'll be teleported out by the gnomish emergency device.")
	deDeathstrike()
elseif item.actionid == 5158 then
		doTeleportThing(cid, kickposs)
	end
	return true
end