SMODS.Joker{
    key = "mount_joker",
    config = { extra = { x_mult = 1.25 } },
    pos = { x = 9, y = 4 },
    rarity = 2,
    cost = 7,
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local stone_cards = {}

            for _, playing_card in ipairs(G.hand.cards) do
                if SMODS.has_enhancement(playing_card, "m_stone") then
                    table.insert(stone_cards, playing_card)
                end
            end

            if #stone_cards >= 4 and SMODS.has_enhancement(context.other_card, "m_stone") then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = context.other_card,
                    }
                else
                    return {
                        xmult = card.ability.extra.x_mult,
                        colour = G.C.MULT,
                    }
                end
            end
        end
    end,

    in_pool = function(self, args) --enhancement gate so you only can find if theres a stonbe card in your deck
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end
}