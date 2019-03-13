local effects = {
{position = Position(1064, 1057, 7), text = 'EXP Room', effect = CONST_ME_MAGIC_BLUE},
{position = Position(1062, 1057, 7), text = 'Quest Room', effect = CONST_ME_MAGIC_BLUE},
{position = Position(1060, 1057, 7), text = 'Training Room', effect = CONST_ME_MAGIC_BLUE},
{position = Position(870, 745, 8), text = 'Temple', effect = CONST_ME_MAGIC_BLUE},
{position = Position(878, 745, 8), text = 'Quest Room', effect = CONST_ME_MAGIC_BLUE},
{position = Position(867, 750, 8), text = 'Medium lvl'},
{position = Position(881, 750, 8), text = 'Medium lvl'},
{position = Position(874, 743, 8), text = 'Higher lvl'},
{position = Position(874, 757, 8), text = 'Lower lvl'},
{position = Position(963, 710, 8), text = 'Temple', effect = CONST_ME_MAGIC_BLUE},
{position = Position(969, 710, 8), text = 'EXP Room', effect = CONST_ME_MAGIC_BLUE},
{position = Position(961, 713, 8), text = 'Lower lvl'},
{position = Position(971, 713, 8), text = 'Medium lvl'},
{position = Position(966, 718, 8), text = 'Higher lvl'},
{position = Position(1059, 1059, 7), text = 'Arena 1v1 & 5v5', effect = CONST_ME_MAGIC_BLUE},
{position = Position(1059, 1061, 7), text = 'Event Room', effect = CONST_ME_MAGIC_BLUE},
}

function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end