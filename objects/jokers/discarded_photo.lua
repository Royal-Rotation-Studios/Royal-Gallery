SMODS.Joker{
    key = "discarded_photo",
    config = { extra = { mult = 5 } },
    pos = { x = 6, y = 1 },
    rarity = 1,
    cost = 5,
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
        if context.individual and context.cardarea == G.hand and context.other_card
            and context.other_card:is_face() and context.full_hand then
            local faces = 0

            for k, v in ipairs(context.full_hand) do
                if v:is_face() == true then
                    faces = faces + 1
                end
            end

            if faces == 2 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card,
                    }
                else
                    return {
                        h_mult = card.ability.extra.mult,
                        card = card
                    }
                end
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end
}