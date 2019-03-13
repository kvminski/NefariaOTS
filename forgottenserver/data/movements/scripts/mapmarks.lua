local config = {
    storage = 39328,
    version = 1
    marks = {
        {mark = 5, pos = {x = 1071, y = 1061, z = 7}, desc = "Temple, DP & TP Room"},
        {mark = 7, pos = {x = 1100, y = 1065, z = 7}, desc = "NPC with tools!"}
    }
}
 
local f_addMark = doPlayerAddMapMark
if(not f_addMark) then f_addMark = doAddMapMark end
 
function onStepIn(cid, item, position, fromPosition)
    if(isPlayer(cid) ~= TRUE or getPlayerStorageValue(cid, config.storage) == config.version) then
        return
    end
 
    for _, m  in pairs(config.marks) do
        f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
    end
    setPlayerStorageValue(cid, config.storage, config.version)
    return TRUE
end