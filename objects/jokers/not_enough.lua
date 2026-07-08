SMODS.Joker {
    key = "not_enough",
    config = { extra = { modifier = 3 } },
    pos = { x = 1, y = 1 },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local temp_Chips, temp_ID = 0, 0
            local choosen_card = nil
            for i=1, #G.hand.cards do
                if temp_ID <= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then temp_Chips = G.hand.cards[i].base.nominal; temp_ID = G.hand.cards[i].base.id; choosen_card = G.hand.cards[i] end
            end
            if choosen_card == context.other_card then 
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card,
                    }
                else
                    return {
                        chips = temp_Chips*card.ability.extra.modifier,
                        card = card,
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.modifier}, key = card.key}
    end
}