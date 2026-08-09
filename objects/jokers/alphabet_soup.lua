SMODS.Joker{
    key = "alphabet_soup",
    config = { extra = { denom = 2, money_mod = 2, give_money = false, reset = false } },
    pos = { x = 4, y = 4 },
    rarity = 3,
    cost = 8,
    yes_pool_flag = "alphabet_soup_can_spawn",
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    check_for_unlock = function(self, args)
        if G.GAME and G.GAME.pool_flags.alphabet_soup_unlocked then
            return true
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.selling_card and context.card and context.card.area == G.consumeables and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'alphabet_soup', 1, card.ability.extra.denom) then
                card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.money_mod
                card:set_cost()
                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY
                }
            end
        end

        if context.end_of_round and context.beat_boss and not context.blueprint then
            card.ability.extra.give_money = true 
        end

        if card.ability.extra.reset then
            card.ability.extra_value = 0
            card.ability.extra.reset = false
            card:set_cost()

            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.give_money then
            card.ability.extra.give_money = false
            card.ability.extra.reset = true
            return card.sell_cost
        end
    end,

    loc_vars = function(self, info_queue, card)
        local denom = (card and card.ability and card.ability.extra and card.ability.extra.denom)
                    or (self.config and self.config.extra and self.config.extra.denom)
                    or 3      
        local a, b = SMODS.get_probability_vars(card, 1, denom)
        return { vars = { a, b, card.ability.extra.money_mod, card.sell_cost, card.ability.extra.give_money, card.ability.extra.reset }, key = self.key }
    end
}