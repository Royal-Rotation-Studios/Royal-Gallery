SMODS.Joker{
    key = "flip_side",
    config = { extra = { chips = 25, mult = 10, x_mult = 1.2 } },
    pos = { x = 9, y = 1 },
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card and type(context.other_card.get_id) == "function" then
                local id = context.other_card:get_id()

                if id >= 0 and id <= 10 and id % 2 == 0 then
                    return {
                        mult = card.ability.extra.mult,
                        card = card
                    }
                elseif (id >= 0 and id <= 10 and id % 2 == 1) or id == 14 then
                    return {
                        chips = card.ability.extra.chips,
                        card = card
                    }
                end
            end
            return
        end

        if context.joker_main and context.cardarea == G.jokers then
            local evens, odds = 0, 0
            if G.play and type(G.play.cards) == "table" then
                for _, c in ipairs(G.play.cards) do
                    if c and type(c.get_id) == "function" then
                        local id = c:get_id()
                        if id >= 0 and id <= 10 then
                            if id % 2 == 0 then evens = evens + 1 else odds = odds + 1 end
                        elseif id == 14 then
                            odds = odds + 1
                        end
                    end
                end
            end

            local pairs = math.min(evens, odds)
            if pairs > 0 then
                local xm = tonumber(card.ability.extra.x_mult) or 1
                local total_xmult = pairs*xm
                return {
                    x_mult = total_xmult
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.x_mult }, key = self.key }
    end
}
