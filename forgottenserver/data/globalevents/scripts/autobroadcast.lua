-- 

function onThink(interval, lastExecution)
    local MESSAGE = {
        "Come on forum.nefaria.pl, say hello! ;-)",
    }
    Game.broadcastMessage(MESSAGE[math.random(1, #MESSAGE)], MESSAGE_EVENT_ADVANCE) 
    return true
end
