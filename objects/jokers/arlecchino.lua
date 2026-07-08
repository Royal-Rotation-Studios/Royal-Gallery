SMODS.Joker{
    key = "arlecchino",
    config = { extra = { x_mult = 1, x_mult_mod = 1 } },
    pos = { x = 0, y = 4 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = { x = 1, y = 4 },

    calculate = function(self, card, context)
        if not context.blueprint and context.joker_type_destroyed and context.card ~= card then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.x_mult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_mod } }
    end
}