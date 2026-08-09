SMODS.Joker {
    key = "reinforcement_tape",
    config = { extra = { chance = 8 } },
    pos = { x = 1, y = 3 },
    rarity = 2,
    cost = 8,
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
		if context.mod_probability and context.identifier == "glass" then
			return {
			    denominator = 8
			}
		end
	end,

    in_pool = function(self, args) --enhancement gate so you only can find if theres a glass card in your deck
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_glass') then
                return true
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chance }, key = self.key }
    end
}