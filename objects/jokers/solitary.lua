SMODS.Joker{
    key = "solitary",
    config = { extra = { x_mult = 1, x_mult_mod = 0.25, type = "High Card" } },
    pos = { x = 8, y = 1 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        --only run during scoring check(s)
        if context.individual and context.cardarea == G.play and context.scoring_name == 'High Card' then
            --ensure card has an ability.extra table
            card.ability = card.ability or {}
            card.ability.extra = card.ability.extra or {
                x_mult = (self.config and self.config.extra and self.config.extra.x_mult) or 1,
                x_mult_mod = (self.config and self.config.extra and self.config.extra.x_mult_mod) or 0.25,
                type = (self.config and self.config.extra and self.config.extra.type) or "High Card"
            }

            local hand_id = (context.hand and context.hand.id) or (G.GAME and G.GAME.hands_played) or 0

            --only upgrade once per hand
            if card.ability.extra._last_hand_upgraded ~= hand_id then
                card.ability.extra.x_mult = math.min(
                    (card.ability.extra.x_mult or 1) + (card.ability.extra.x_mult_mod or 0.25),
                    15
                )

                card.ability.extra._last_hand_upgraded = hand_id

                return {
                    extra = { focus = card, message = localize('k_upgrade_ex') },
                    card = card,
                    colour = G.C.MULT
                }
            end

            return
        end

        --return the xmult
        if context.joker_main and context.cardarea == G.jokers and context.scoring_name == 'High Card' then
            local cur = (card and card.ability and card.ability.extra and card.ability.extra.x_mult) or (self.config and self.config.extra and self.config.extra.x_mult) or 1
            return {
                xmult = tonumber(cur) or 1,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        local extra = (card and card.ability and card.ability.extra) or (self.config and self.config.extra) or {}
        return {
            vars = { extra.x_mult or 1, extra.x_mult_mod or 0.25, localize(extra.type or "High Card", "poker_hands") },
            key = self.key
        }
    end
}
