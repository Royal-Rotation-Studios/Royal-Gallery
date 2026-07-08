--[[SMODS.Joker({
	key = "terminal_hyperdeath",
	atlas = "jokers",
	pos = {x = 8, y = 2},
	rarity = 4,
	cost = 20,
	unlocked = false,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = {extra = {x_chips = 0, modifier = 2}},
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.modifier, card.ability.extra.x_chips}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if card.area.cards[1] == card then return end
            if not card.getting_sliced and not card.area.cards[1].ability.eternal and not card.area.cards[1].getting_sliced then 
                local sliced_card = card.area.cards[1]
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.joker_buffer = 0
                    card:juice_up(0.8, 0.8)
                    sliced_card:start_dissolve({HEX("dc486f")}, nil, 1.6)
                return true end }))

                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "x_chips",
                    scalar_table = sliced_card,
                    scalar_value = "sell_cost",
                    operation = function(ref_table, ref_value, initial, scaling)
                        ref_table[ref_value] = initial + ref_table.modifier*scaling
                    end,
                    scaling_message = {
                        message = localize{type = 'variable', key = 'a_xchips', vars = {card.ability.extra.modifier*sliced_card.sell_cost}},
                        colour = G.C.BLUE,
                        no_juice = true
                    }
                })
            end
        end
        if context.joker_main and card.ability.extra.x_chips > 1 then
            return {
                x_chips = card.ability.extra.x_chips
            }
        end

        if context.end_of_round and not context.blueprint and not context.repetition and not context.other_card and G.GAME.blind.boss then
            card.ability.extra.x_chips = 0
            return {
                message = localize('k_reset'),
                colour = G.C.BLUE
            }
        end
    end
})]]
