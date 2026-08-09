SMODS.Joker{
    key = "forgetful_dice",
    config = { extra = { denom = 3 } },
    pos = { x = 4, y = 2 },
    rarity = 2,
    cost = 6,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    check_for_unlock = function(self, args)
        return G.GAME and G.GAME.rlg_failed_probabilities >= 10
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local denom = (card and card.ability and card.ability.extra and card.ability.extra.denom)
                       or (self.config and self.config.extra and self.config.extra.denom)
                       or 3

            if SMODS.pseudorandom_probability(card, 'forgetful_dice', 1, denom) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 2,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local denom = (card and card.ability and card.ability.extra and card.ability.extra.denom)
                    or (self.config and self.config.extra and self.config.extra.denom)
                    or 3      
        local a, b = SMODS.get_probability_vars(card, 1, denom)
        return { vars = { a, b }, key = self.key }
    end
}