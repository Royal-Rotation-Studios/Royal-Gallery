SMODS.Joker{
    key = "art_box",
    config = { extra = { x_mult = 1, x_mult_mod = .15 } },
    pos = { x = 6, y = 4 },
    rarity = 3,
    cost = 8,
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

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if not context.blueprint then
                local other = context.other_card

                if other and other.ability and other.ability.set == 'Enhanced' then
                    card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
                    
                    return {
                        extra = {focus = card, message = localize('k_upgrade_ex')},
                        card = card,
                        colour = G.C.MULT
                    }
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = card.ability.extra.x_mult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_mod }, key = self.key }
    end
}
