SMODS.Enhancement {
    key = 'pastel',
    atlas = 'enhancements',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            money = 1
        }
    },
    artist_credits = {
        "royal_rotation"
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            for i, c in ipairs(context.scoring_hand) do
                if c == card then
                    local left = context.scoring_hand[i - 1]
                    local right = context.scoring_hand[i + 1]

                    if (left and left.config.center ~= G.P_CENTERS.c_base)
                    or (right and right.config.center ~= G.P_CENTERS.c_base) then
                        return {
                            dollars = card.ability.extra.money
                        }
                    end
                end
            end
        end
    end
}