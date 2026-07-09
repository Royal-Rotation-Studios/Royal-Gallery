SMODS.Joker{
    key = "capitalism",
    config = { extra = { required_rank = 8, cash_reward = 10, passed = false, processed_round = -1, fail_cost = 3 } },
    pos = { x = 0, y = 2 },
    rarity = 3,
    cost = 7,
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
        if context.joker_main and context.cardarea == G.jokers and context.scoring_hand and not context.blueprint then
            local required = card.ability.extra.required_rank
            local all_above = true

            for _, played in ipairs(context.scoring_hand) do
                if played:get_id() <= required then
                    all_above = false
                    break
                end
            end

            card.ability.extra.passed = all_above
        end

        if context.end_of_round and not context.blueprint then
            card.ability.extra.required_rank = math.random(2, 10)
        end
    end,

    calc_dollar_bonus = function(self, card)
        local amount

        if card.ability.extra.passed then
            amount = card.ability.extra.cash_reward
        else
            amount = -card.ability.extra.fail_cost
        end

        card.ability.extra.passed = false
        return amount
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.required_rank, card.ability.extra.cash_reward, card.ability.extra.fail_cost }, key = self.key }
    end
}