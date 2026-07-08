SMODS.Joker {
    key = "high_five",
    config = { extra = { mult = 0, mult_mod = 5 } },
    pos = { x = 9, y = 5 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play then
            if not context.blueprint then
                if context.other_card:get_id() == 5 then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod

                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        colour = G.C.MULT
                    }
                end
            end
        end

        if context.after and context.scoring_hand then
            local found_five = false

            for _,v in ipairs(context.scoring_hand) do
                if v:get_id() == 5 then
                    found_five = true
                end
            end

            if not found_five then
                card.ability.extra.mult = 0
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod }, key = self.key }
    end
}