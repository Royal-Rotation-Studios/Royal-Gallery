SMODS.Joker {
    key = "jokes_on_you",
    config = { extra = { base_x_mult = 0.5, special_x_mult = 5, trigger_times = 0 } },
    pos = { x = 9, y = 1 },
    rarity = 3,
    cost = 7,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = "jokers",

    check_for_unlock = function(self, args)
        return G.GAME and G.GAME.rlg_lost_ante_8
    end,

    calculate = function(self, card, context)
        -- NORMAL NON-BOSS
        if context.joker_main and context.cardarea == G.jokers and not G.GAME.blind.boss then
            return {
                xmult = card.ability.extra.base_x_mult,
                colour = G.C.MULT
            }
        end

        -- BOSS EFFECT
        if context.joker_main and context.cardarea == G.jokers and G.GAME.blind.boss and G.GAME.current_round.hands_played == 0 then

            card.ability.extra.trigger_times = (card.ability.extra.trigger_times or 0) + 1

            if card.ability.extra.trigger_times >= 5 then
                local msg = "Exploded!"
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({ HEX("dc486f") }, nil, 1.6)
                        return true
                    end
                }))
                return { message = msg, colour = G.C.RED }
            end

            return {
                xmult = card.ability.extra.special_x_mult,
                colour = G.C.MULT
            }
        end

        return nil
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base_x_mult, card.ability.extra.special_x_mult, card.ability.extra.trigger_times } }
    end
}