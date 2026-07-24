SMODS.Consumable {
    object_type = "Consumable",
	key = 'charity',
	set = 'Tarot',
	pos = { x = 0, y = 0 },
	artist_credits = {
        "royal_rotation"
    },
	cost = 2,
	unlocked = true,
	discovered = false,
	config = { mod_conv = 'm_rlg_pastel', max_highlighted = 2 },
	atlas = 'tarots',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}