SMODS.Joker{
    key = "limited",
    config = { extra = { chips = 1 } },
    pos = { x = 5, y = 2 },
    rarity = 3,
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
        if context.individual and context.cardarea == G.play and context.other_card and 
        (context.other_card:is_suit(G.GAME.current_round.rlg_limited_card.suit) or SMODS.has_enhancement(context.other_card, "m_wild")) then
            card.ability.extra.chips = (context.other_card.ability.bonus or 0) + (context.other_card.ability.perma_bonus or 0) 
                + context.other_card.base.nominal

            return {
                chips = card.ability.extra.chips,
                card = card
            }
        end

        if not context.blueprint and context.setting_blind then
            local source = (self.key or "limited") .. "_limited_src"

            --Apply debuff to all non selected suit cards
            for _, v in ipairs(G.playing_cards or {}) do
                local valid_suit =
                    v:is_suit(G.GAME.current_round.rlg_limited_card.suit)
                    or SMODS.has_enhancement(v, "m_wild")

                if not valid_suit then
                    SMODS.debuff_card(v, true, source)
                end
            end
        end

        if context.end_of_round and not context.blueprint then
            G.GAME.current_round.rlg_limited_card = { suit = 'Spades' }
            local valid_limited_cards = {}
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_suit(playing_card) then
                    valid_limited_cards[#valid_limited_cards + 1] = playing_card
                end
            end
            local limited_card = pseudorandom_element(valid_limited_cards,
                'rlg_limited' .. G.GAME.round_resets.ante)
            if limited_card then
                G.GAME.current_round.rlg_limited_card.suit = limited_card.base.suit
            end
        end
        
        --Seperate end of round for removing debuff
        if context.end_of_round or context.setting_blind == false or context.selling_self and not context.blueprint then
            local source = (self.key or "limited") .. "_limited_src"
            for _, v in ipairs(G.playing_cards or {}) do
                SMODS.debuff_card(v, false, source)
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.rlg_limited_card or {}).suit or 'Spades'
        return { vars = { card.ability.extra.chips, localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] } } }
        --return { vars = { card.ability.extra.modifier } }
    end
}