local function doPlayerAddCoins(cid, count)
        db.query('UPDATE accounts SET coins = coins+'.. count ..' WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    doPlayerAddCoins(cid, 300)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have received 30 tibia coins!")
    doSendMagicEffect(getCreaturePosition(cid), 28)
    doRemoveItem(item.uid,1)
    return true
end