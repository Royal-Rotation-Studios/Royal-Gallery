SMODS.Joker{
    key = "friends_lovers",
    config = { extra = { extra_hand = 1, denom = 10 } },
    pos = { x = 1, y = 4 },
    rarity = 2,
    cost = 6,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
			local wild = 0
            for _, scored in ipairs(context.scoring_hand) do
                if scored.config.center == G.P_CENTERS.m_wild then
                    wild = wild + 1
                end
            end

            if SMODS.pseudorandom_probability(card, "friends_lovers", wild + 1, card.ability.extra.denom) then
                if wild > 0 then
                    G.E_MANAGER:add_event(Event({func = function()
                        ease_hands_played(card.ability.extra.extra_hand)
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.extra_hand}}
                        })
                        return true
                    end}))
                end
            else
                if wild > 0 then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = localize('k_nope_ex')
                        })
                    return true end}))
                end 
            end
		end
	end,

    in_pool = function(self, args) --enhancement gate so you only can find if theres a wild card in your deck
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_wild') then
                return true
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        local status =  G.GAME.current_round.hands_played == 0 and "Active" or "Inactive"

        local denom = (card and card.ability and card.ability.extra and card.ability.extra.denom)
                    or (self.config and self.config.extra and self.config.extra.denom)
                    or 3      
        local a, b = SMODS.get_probability_vars(card, 1, denom)
        return { vars = { card.ability.extra.extra_hand, a, b, status }, key = self.key }
    end
}