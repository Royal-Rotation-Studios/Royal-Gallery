SMODS.Joker{
    key = "normality",
    config = { extra = { x_mult = 1.2, denom = 4 } },
    pos = { x = 2, y = 0 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self,card,context)
        if context.individual then
            if context.cardarea == G.play then
                if context.other_card
                and context.other_card:get_id() <= 10
                and context.other_card:get_id() >= 0
                and context.other_card:get_id()%2 == 0 then
                    if SMODS.pseudorandom_probability(card,'normality',1,card.ability.extra.denom) then
                        return {
                            card = card,
                            x_mult = card.ability.extra.x_mult
                        }
                    end
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local a, b = SMODS.get_probability_vars(card, 1, card.ability.extra.denom)
        return {vars = {card.ability.extra.x_mult, a, b} }
    end
}