SMODS.Joker {
    key = "suit_up",
    config = { extra = { mult = 20 } },
    pos = { x = 3, y = 0 },
    rarity = 1,
    cost = 4,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, this_card, context)
        if context and context.joker_main and context.cardarea == G.jokers then
            if G.hand and G.hand.cards and #G.hand.cards > 0 then
                local hand = G.hand.cards
                local first = hand[1]
                if first then
                    local suit = first.base.suit

                    if not suit then
                        for key in pairs(SMODS.Suits) do
                            if first:is_suit(key) then
                                suit = key
                                break
                            end
                        end
                    end

                    if suit then
                        for i = 2, #hand do
                            if not hand[i]:is_suit(suit) then
                                return
                            end
                        end

                        return {
                            mult = this_card.ability.extra.mult,
                            card = this_card
                        }
                    end
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, this_card)
        local v = (this_card and this_card.ability and this_card.ability.extra and this_card.ability.extra.mult) or (self and self.config and self.config.extra and self.config.extra.mult) or 0
        return { vars = { v }, key = self.key }
    end
}