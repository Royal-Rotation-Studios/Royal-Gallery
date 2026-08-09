SMODS.Joker{
    key = "jackoat",
    config = { extra = { mult = 4, chips = 10, money = 1 } },
    pos = { x = 1, y = 1 },
    rarity = 1,
    cost = 4,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.individual then
            if context.cardarea == G.play then
                if context.other_card
                and context.other_card:is_face()
                and context.other_card:get_id() == 11 then

                    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
                    G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))

                    return {
                        card = card,
                        mult = card.ability.extra.mult,
                        chips = card.ability.extra.chips,
                        dollars = card.ability.extra.money
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.money }, key = self.key }
    end
}
