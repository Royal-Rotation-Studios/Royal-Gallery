SMODS.Joker{
    key = "joker_question",
    config = { extra = { chips = 28 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 2,
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
                chips = card.ability.extra.chips,
                colour = G.C.CHIPS
            }
            
            --return {
            --    card = card,
            --    chip_mod = card.ability.extra.chips,
            --    message = '+' .. card.ability.extra.chips,
            --    colour = G.C.CHIPS
            --}
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end
}