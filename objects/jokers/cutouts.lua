SMODS.Joker{
    key = "cutouts",
    config = { extra = { x_mult = 1, x_mult_mod = 0.25, destroy_cards = {} } },
    pos = { x = 8, y = 2 },
    rarity = 3,
    cost = 8,
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
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            card.ability.extra.destroy_cards = {}

            local lowest_id = 15
            local highest_id = 0

            local lowest_card = nil
            local highest_card = nil

            for _, playing_card in ipairs(G.play.cards) do
                if not SMODS.has_no_rank(playing_card) then
                    if playing_card.base.id <= lowest_id then
                        lowest_id = playing_card.base.id
                        lowest_card = playing_card
                    end

                    if playing_card.base.id >= highest_id then
                        highest_id = playing_card.base.id
                        highest_card = playing_card
                    end
                end
            end

            if lowest_card and lowest_card ~= highest_card then
                table.insert(card.ability.extra.destroy_cards, lowest_card)
            end

            if highest_card and highest_card ~= lowest_card then
                table.insert(card.ability.extra.destroy_cards, highest_card)
            end

            --[[if #destroy_cards > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult +
                    (#destroy_cards * card.ability.extra.x_mult_mod)

                SMODS.destroy_cards(destroy_cards)

                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}
                }
            end]]
        end

        if context.after and not context.blueprint then
            local destroy_cards = card.ability.extra.destroy_cards or {}

            if #destroy_cards > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult +
                    (#destroy_cards * card.ability.extra.x_mult_mod)

                SMODS.destroy_cards(destroy_cards)
                card.ability.extra.destroy_cards = {}

                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}
                }
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.x_mult,
                colour = G.C.MULT
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_mod } }
    end
}