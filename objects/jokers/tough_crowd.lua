SMODS.Joker{
    key = "tough_crowd",
    config = { extra = { repetition = 1 } },
    pos = { x = 0, y = 3 },
    rarity = 2,
    cost = 6,
    artist_credits = {
        "punchline"
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
        if context.cardarea == G.play and context.repetition and (
            context.other_card:get_id() == 6 or 
            context.other_card:get_id() == 7 or 
            context.other_card:get_id() == 8 or 
            context.other_card:get_id() == 9 or 
            context.other_card:get_id() == 10) then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.repetition,
                card = card
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetition }, key = self.key }
    end
}