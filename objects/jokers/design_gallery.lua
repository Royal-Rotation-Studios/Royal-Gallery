SMODS.Joker{
    key = "design_gallery",
    config = { extra = { enhancement = "m_rlg_pastel", chips_mod = 5, mult_mod = 1 } },
    pos = { x = 0, y = 2 },
    rarity = 1,
    cost = 6,
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
        if context.joker_main then
            local pastel_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_rlg_pastel') then pastel_tally = pastel_tally + 1 end
            end
            return {
                mult = card.ability.extra.mult_mod * pastel_tally,
                chips = card.ability.extra.chips_mod * pastel_tally
            }
        end
    end,

    in_pool = function(self, args) --enhancement gate so you only can find if theres a pastel card in your deck
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_rlg_pastel') then
                return true
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_rlg_pastel

        local pastel_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_rlg_pastel') then pastel_tally = pastel_tally + 1 end
            end
        end

        return { 
            vars = { 
                localize {
                    type = 'name_text',
                    set = 'Enhanced',
                    key = card.ability.extra.enhancement
                },
                card.ability.extra.chips_mod * pastel_tally, 
                card.ability.extra.mult_mod * pastel_tally, 
                card.ability.extra.chips_mod, 
                card.ability.extra.mult_mod 
            } 
        }
    end
}