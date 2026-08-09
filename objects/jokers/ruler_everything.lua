SMODS.Joker {
    key = "ruler_everything",
    config = { extra = { xmult = 1.5, chips = 10 } },
    pos = { x = 7, y = 3 },
    rarity = 3,
    cost = 10,
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
    return RLG_only_face_cards()
end,

    calculate = function(self, card, context)
        if not context.blueprint and context.setting_blind then
            local source = (self.key or "ruler_everything") .. "_ruler_src"

            --apply debuff to all nonface cards
            for _, v in ipairs(G.playing_cards or {}) do
                local isface = (type(v.is_face) == "function" and v:is_face()) or false
                if not isface then
                    SMODS.debuff_card(v, true, source)
                end
            end
        end

        --remove debuffs at round end
        if context.end_of_round or context.setting_blind == false or context.selling_self and not context.blueprint then
            local source = (self.key or "ruler_everything") .. "_ruler_src"
            for _, v in ipairs(G.playing_cards or {}) do
                SMODS.debuff_card(v, false, source)
            end
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                return {
                    xmult = card.ability.extra.xmult,
                    chips = card.ability.extra.chips,
                    card = card
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.chips }, key = self.key }
    end
}
