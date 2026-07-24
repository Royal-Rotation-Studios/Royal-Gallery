SMODS.Joker{
    key = "spare_stencil",
    config = { extra = { } },
    pos = { x = 4, y = 1 },
    rarity = 1,
    cost = 5,
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
        if context.before and G.GAME.current_round.hands_played == 0 then
            --Set temporary table
            card.ability.extra.changed_cards = {}

            local enhancement_set = {}
            --Get enhancements from scored cards
            for _, scored_card in ipairs(context.scoring_hand) do
                for _, enhancement in pairs(G.P_CENTERS) do
                    if enhancement.set == "Enhanced" and SMODS.has_enhancement(scored_card, enhancement.key) then
                        enhancement_set[enhancement.key] = true
                    end
                end
            end

            local enhancements = {}

            for key, _ in pairs(enhancement_set) do
                table.insert(enhancements, key)
            end

            --Apply enhancements
            if #enhancements > 0 then
                local chosen = pseudorandom_element(enhancements, "stencil_enhancement")

                for _, played_card in ipairs(context.scoring_hand) do
                    if played_card.config.center == G.P_CENTERS.c_base then
                        --Store the orig. state for later
                        card.ability.extra.changed_cards[#card.ability.extra.changed_cards + 1] = {
                            card = played_card,
                            ability = played_card.config.center
                        }

                        played_card:set_ability(G.P_CENTERS[chosen], nil, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                played_card:juice_up()
                                return true
                            end}))
                        break
                    end
                end
            end
        end

        --Remove enhancements
        if context.end_of_round and card.ability.extra.changed_cards then
            for _, data in ipairs(card.ability.extra.changed_cards) do
                if data.card then
                    data.card:set_ability(data.ability, nil, true)
                end
            end

            card.ability.extra.changed_cards = {}
        end
    end,

    loc_vars = function(self, info_queue, card)
        local status =  G.GAME.current_round.hands_played == 0 and "Active" or "Inactive"
        return { vars = { status } }
    end
}