SMODS.Joker{
    key = "stone_skipping",
    config = { extra = { chips_to_add = 5, chips_to_add_mod = 5 } },
    pos = { x = 6, y = 2 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        local extra = (self.config and self.config.extra) or {}
        if context.skip_blind and not context.blueprint then
            --ensure card.ability.extra exists
            card.ability = card.ability or {}
            card.ability.extra = card.ability.extra or {}

            --local base = tonumber(card.ability.extra.chips_to_add) or tonumber(extra.chips_to_add) or 5
            --local mod  = tonumber(card.ability.extra.chips_to_add_mod) or tonumber(extra.chips_to_add_mod) or 5

            card.ability.extra.chips_to_add = card.ability.extra.chips_to_add + card.ability.extra.chips_to_add_mod

            return {
                extra = { focus = card, message = localize('k_upgrade_ex') },
                card = card,
                colour = G.C.CHIPS
            }
        end

        if context.individual and context.cardarea == G.play then
            if context.other_card and context.other_card.ability.name == 'Stone Card' then
                context.other_card.ability = context.other_card.ability or {}
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0)
                    + ((card.ability and card.ability.extra and card.ability.extra.chips_to_add) or extra.chips_to_add or 5)

                return {
                    extra = { message = localize('k_upgrade_ex') },
                    card = card,
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        --local e = (card and card.ability and card.ability.extra) or (self.config and self.config.extra) or {}
        return { vars = { card.ability.extra.chips_to_add or 5, card.ability.extra.chips_to_add_mod or 0 }, key = self.key }
    end
}
