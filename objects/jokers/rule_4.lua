SMODS.Joker{
    key = "rule_4",
    config = { extra = { } },
    pos = { x = 1, y = 5 },
    rarity = 3,
    cost = 9,
    artist_credits = {
        "muddz"
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
        local stop_at = 4 -- up to the 4th card

        if context.individual and context.cardarea == G.play and context.other_card then
            local total_chips = 0
            local total_mult = 0

            for i = 1, math.min(stop_at - 1, #G.play.cards) do
                local playing_card = G.play.cards[i]

                total_chips = total_chips
                    + (playing_card.base.nominal or 0)
                    + (playing_card.ability.bonus or 0)
                    + (playing_card.ability.perma_bonus or 0)

                total_mult = total_mult
                    + (playing_card.ability.mult or 0)
                    + (playing_card.ability.perma_mult or 0)
            end

            if context.other_card == G.play.cards[stop_at] then
                return {
                    chips = total_chips,
                    mult = total_mult,
                    card = context.other_card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end
}