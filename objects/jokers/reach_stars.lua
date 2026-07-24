SMODS.Joker{
    key = "reach_stars",
    config = { extra = { mult = 0, mult_mod = 1 } },
    pos = { x = 7, y = 0 },
    rarity = 1,
    cost = 5,
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
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end

        if context.skipping_booster and not context.blueprint and context.booster.kind == "Celestial" then
            if card.ability.extra.mult ~= 0 then
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
    end
}