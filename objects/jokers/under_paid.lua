SMODS.Joker {
    key = "under_paid",
    config = { extra = { money = 6, passed = false } },
    pos = { x = 5, y = 0 },
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
        if context.end_of_round and context.main_eval and not context.blueprint then
            if G.GAME.current_round.hands_played == 1 then
                --give as cashout
                card.ability.extra.passed = true

                --below is straight up giving it
                --ease_dollars(card.ability.extra.money or 10)
                --local msg = "+$" .. tostring(card.ability.extra.money or 4)
                --return { 
                --    message = msg, 
                --    colour = G.C.DOLLAR
                --}
            end
        end
    end,
    
    calc_dollar_bonus = function(self, card)
        local amount

            if card.ability.extra.passed then
                amount = card.ability.extra.money
            end

        card.ability.extra.passed = false
        return amount
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.passed }, key = self.key }
    end
}
