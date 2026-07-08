SMODS.Joker {
    key = "reinforcement_tape",
    config = { extra = { chance = 8 } },
    pos = { x = 3, y = 2 },
    rarity = 2,
    cost = 8,
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

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chance }, key = self.key }
    end
}