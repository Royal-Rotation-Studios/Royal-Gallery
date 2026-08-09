SMODS.Joker{
    key = "conversion",
    config = { extra = { } },
    pos = { x = 7, y = 1 },
    rarity = 2,
    cost = 5,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    pixel_size = { w = 54, h = 57},

    check_for_unlock = function(self, args)
        return G.GAME
            and G.GAME.last_hand_chips
            and G.GAME.last_hand_mult
            and G.GAME.last_hand_chips == G.GAME.last_hand_mult
    end,

    calculate = function(self, card, context)
        -- Effect handled by lovely patch
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end
}