SMODS.Joker{
    key = "masquerade",
    config = { extra = { } },
    pos = { x = 5, y = 3 },
    rarity = 3,
    cost = 9,
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
        if context.cardarea == G.jokers and context.before then
            local wild = 0
            for _, scored in ipairs(context.scoring_hand) do
                if scored.config.center == G.P_CENTERS.m_wild then
                    wild = wild + 1
                end
            end

            if wild > 0 then
                local cards = {}
                for c, v in ipairs(context.scoring_hand) do
                    cards[#cards+1] = v
                    v:set_ability(G.P_CENTERS.m_wild, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
                return {
                    message = "Wild",
                    colour = G.C.GOLD
                }
            end
        end
    end,

    update = function(self, card, dt)
        if G.jokers then
            if next(SMODS.find_card("j_rlg_masquerade")) then
                if G.hand then
                    if #G.hand.cards > 0 then
                        for i = 1, #G.hand.cards do
                            if G.hand.cards[i].config.center == G.P_CENTERS.m_wild and G.hand.cards[i].debuff then
                                G.hand.cards[i].debuff = false
                            end
                        end
                    end
                end
                if G.play then
                    if #G.play.cards > 0 then
                        for i = 1, #G.play.cards do
                            if G.play.cards[i].config.center == G.P_CENTERS.m_wild and G.play.cards[i].debuff then
                                G.play.cards[i].debuff = false
                            end
                        end
                    end
                end
                if G.deck then
                    if #G.deck.cards > 0 then
                        for i = 1, #G.deck.cards do
                            if G.deck.cards[i].config.center == G.P_CENTERS.m_wild and G.deck.cards[i].debuff then
                                G.deck.cards[i].debuff = false
                            end
                        end
                    end
                end
            end
        end
    end,

    in_pool = function(self, args) --enhancement gate so you only can find if theres a wild card in your deck
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'wild') then
                return true
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end
}