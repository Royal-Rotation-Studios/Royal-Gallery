SMODS.Joker {
    key = "glass_canon",
    config = { extra = { x_mult = 6, denom = 12, triggered = false, safe = true } },
    pos = { x = 4, y = 3 },
    rarity = 3,
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        -- Reset for next round
        if context.end_of_round and not context.blueprint then
            card.ability.extra.triggered = false
            return
        end

        if context.individual
        and context.cardarea == G.play
        and context.other_card then

            local first_glass = nil

            for _, scored in ipairs(context.scoring_hand) do
                if scored.config.center == G.P_CENTERS.m_glass then
                    first_glass = scored
                    break
                end
            end

            if context.other_card == first_glass then
                card.ability.extra.triggered = true

                return {
                    x_mult = card.ability.extra.x_mult,
                    card = card
                }
            end
        end

        if context.after and context.main_eval and card.ability.extra.triggered then
            local destroy = {}

            card.ability.extra.safe = false

            for _, held in ipairs(G.hand.cards) do
                if held.config.center == G.P_CENTERS.m_glass then
                    destroy[#destroy + 1] = held
                end
            end

            if #destroy > 0 then
                SMODS.destroy_cards(destroy)
            end

            local roll = SMODS.pseudorandom_probability(card, 'even_win', 1, card.ability.extra.denom)

            if not card.ability.extra.safe and roll then
                local msg = "Shattered!"
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({ HEX("dc486f") }, nil, 1.6)
                        return true
                    end
                }))

                return { message = msg, colour = G.C.RED }
            end

            return { message = localize('k_safe_ex') }
        end
    end,

    loc_vars = function(self, info_queue, card)
        local a, b = SMODS.get_probability_vars(card, 1, card.ability.extra.denom)
        return { vars = { card.ability.extra.x_mult, a, b, card.ability.extra.triggered, card.ability.extra.safe }, key = self.key }
    end
}
