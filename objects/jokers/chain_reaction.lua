SMODS.Joker{
    key = "chain_reaction",
    config = { extra = { poker_hand = "Straight" } },
    pos = { x = 5, y = 1 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play then
            if context.poker_hands[card.ability.extra.poker_hand] then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.poker_hand }, key = self.key }
    end        
}