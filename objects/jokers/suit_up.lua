SMODS.Joker {
    key = "suit_up",
    config = { extra = { mult = 20 } },
    pos = { x = 3, y = 0 },
    rarity = 1,
    cost = 4,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = false,
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
                    local suit = first.suit
                    if not suit and first.is_suit then
                        local suits = { "Hearts", "Diamonds", "Clubs", "Spades" }
                        for _, s in ipairs(suits) do
                            if first:is_suit(s) then
                                suit = s
                                break
                            end
                        end
                    end

                    if suit then
                        local all_same = true
                        for i = 2, #hand do
                            local c = hand[i]
                            if c then
                                if c.suit then
                                    if c.suit ~= suit then
                                        all_same = false
                                        break
                                    end
                                else
                                    if c.is_suit then
                                        if not c:is_suit(suit) then
                                            all_same = false
                                            break
                                        end
                                    else
                                        all_same = false
                                        break
                                    end
                                end
                            else
                                all_same = false
                                break
                            end
                        end

                        if all_same then
                            local mult = (this_card and this_card.ability and this_card.ability.extra and this_card.ability.extra.mult)
                                         or (self and self.config and self.config.extra and self.config.extra.mult)
                                         or 0
                            if mult and mult > 0 then
                                return { mult = mult, card = this_card }
                            end
                        end
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