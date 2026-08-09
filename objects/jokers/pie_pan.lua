SMODS.Joker{
    key = "pie_pan",
    config = { extra = { x_mult = 3, current = 1, o_xmult = 3, t_xmult = 1, th_xmult = 4, fo_xmult = 1, fi_xmult = 5 } },
    pos = { x = 9, y = 3 },
    rarity = 2,
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

    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.current == 1 then
                card.ability.extra.x_mult = card.ability.extra.o_xmult
                card.ability.extra.current = card.ability.extra.current + 1
                return {
                    xmult = card.ability.extra.x_mult,
                    colour = G.C.MULT
                }
            elseif card.ability.extra.current == 2 then
                card.ability.extra.x_mult = card.ability.extra.t_xmult
                card.ability.extra.current = card.ability.extra.current + 1
                return {
                    xmult = card.ability.extra.x_mult,
                    colour = G.C.MULT
                }
            elseif card.ability.extra.current == 3 then
                card.ability.extra.x_mult = card.ability.extra.th_xmult
                card.ability.extra.current = card.ability.extra.current + 1
                return {
                    xmult = card.ability.extra.x_mult,
                    colour = G.C.MULT
                }
            elseif card.ability.extra.current == 4 then
                card.ability.extra.x_mult = card.ability.extra.fo_xmult
                card.ability.extra.current = card.ability.extra.current + 1
                return {
                    xmult = card.ability.extra.x_mult,
                    colour = G.C.MULT
                }
            elseif card.ability.extra.current == 5 then
                card.ability.extra.x_mult = card.ability.extra.fi_xmult
                card.ability.extra.current = 1
                return {
                    xmult = card.ability.extra.x_mult,
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local next_xmult = card.ability.extra.o_xmult

        if card.ability.extra.current == 1 then
            next_xmult = card.ability.extra.o_xmult
        elseif card.ability.extra.current == 2 then
            next_xmult = card.ability.extra.t_xmult
        elseif card.ability.extra.current == 3 then
            next_xmult = card.ability.extra.th_xmult
        elseif card.ability.extra.current == 4 then
            next_xmult = card.ability.extra.fo_xmult
        elseif card.ability.extra.current == 5 then
            next_xmult = card.ability.extra.fi_xmult
        end

        return { 
            vars = { next_xmult },
            key = self.key
        }
    end
}