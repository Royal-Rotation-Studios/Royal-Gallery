SMODS.Joker {
    key = "waste_disposal",
    config = { extra = { x_chips = 3, x_chips_mod = 0.2 } },
    pos = { x = 4, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                card = card,
                x_chips = card.ability.extra.x_chips,
                message = 'x' .. card.ability.extra.x_chips,
                colour = G.C.CHIPS,
            }
        end

        if context.selling_card and not context.blueprint then
            if (card.ability.extra.x_chips - card.ability.extra.x_chips_mod) <= 1 then
                --SMODS.calculate_effect({message = localize('k_eaten_ex'),colour = G.C.RED,}, card)
                SMODS.destroy_cards(card, nil, nil, true)
                return { message = "Filled!", colour = G.C.BLUE }
            else
                card.ability.extra.x_chips = (card.ability.extra.x_chips or 3) - (card.ability.extra.x_chips_mod or 0.2)
                return {
                    delay = 0.2,
                    message = localize{type='variable',key='a_xchips',vars={card.ability.extra.x_chips}},
                    colour = G.C.CHIPS,
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_chips, card.ability.extra.x_chips_mod }, key = self.key }
    end,
}
