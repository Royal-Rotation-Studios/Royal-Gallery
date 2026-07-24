SMODS.Joker{
    key = "alphabet_noodles",
    config = { extra = { } },
    pos = { x = 6, y = 0 },
    rarity = 1,
    cost = 3,
    yes_pool_flag = "alphabet_noodles_can_spawn",
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.selling_self then
            --Copied from Numerophobia for the most part
            --create exactly consumable_amount Tarots if there's room
            local amount = tonumber(card.ability and card.ability.extra and card.ability.extra.consumable_amount) or 1
            if amount < 1 then amount = 1 end

            local limit = (G.consumeables and G.consumeables.config) and G.consumeables.config.card_limit or nil
            local current = (G.consumeables and G.consumeables.cards) and #G.consumeables.cards or 0
            local buffer = (G.GAME and G.GAME.consumeable_buffer) or 0

            local create_n
            if not limit then
                create_n = amount
            else
                local remaining = limit - (current + buffer)
                if remaining <= 0 then create_n = 0 else create_n = math.min(amount, remaining) end
            end

            --Remove noodles from the pool
            G.GAME.pool_flags.alphabet_noodles_can_spawn = false

            --Allow soup to appear
            G.GAME.pool_flags.alphabet_soup_unlocked = true
            G.GAME.pool_flags.alphabet_soup_can_spawn = true

            if create_n > 0 then
                --Create a random consumable (nerfed from two to one)
                G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + create_n
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        for i = 1, create_n do
                            local _card = create_card('Consumeables', G.consumeables, nil, nil, nil, nil, nil, 'vag')
                            if _card then
                                _card:add_to_deck()
                                G.consumeables:emplace(_card)
                            end
                        end
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end
}