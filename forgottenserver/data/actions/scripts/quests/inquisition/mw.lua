 local shadowNexusPosition = Position(1825, 1580, 12)
local effectPositions = {
    Position(1823, 1580, 12),
    Position(1826, 1580, 12)
}

local function nexusMessage(player, message)
    local spectators = Game.getSpectators(shadowNexusPosition, false, true, 3, 3)
    for i = 1, #spectators do
        player:say(message, TALKTYPE_MONSTER_YELL, false, spectators, shadowNexusPosition)
    end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(Storage.TheInquisition.Questline) < 22 then
        -- The Inquisition Questlog- 'Mission 7: The Shadow Nexus'
        player:setStorageValue(Storage.TheInquisition.Mission07, 2)
        player:setStorageValue(Storage.TheInquisition.Questline, 22)

        for i = 1, #effectPositions do
            effectPositions:sendMagicEffect(CONST_ME_HOLYAREA)
        end
    
        nexusMessage(player, player:getName() .. ' destroyed the shadow nexus!')
        player:teleportTo(Position(1119, 1005, 10))
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end 
