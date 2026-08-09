SMODS.Joker {
    key = "numerophobia",
    config = { extra = { consumable_amount = 2, create_tarots = false } },
    pos = { x = 2, y = 3 },
    rarity = 3,
    cost = 9,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    check_for_unlock = function(self, args)
        if G.GAME and G.GAME.rlg_numbered_cards_destroyed >= 20 then
            return true
        end
        return false
    end,

    calculate = function(self, card, context)
        --return true if any played card is anumbered card
        local function has_numbered_in_play()
            if not (G and G.play and G.play.cards) then return false end
            for _, v in ipairs(G.play.cards) do
                if v and type(v.get_id) == "function" then
                    local ok, id = pcall(function() return v:get_id() end)
                    if ok and type(id) == "number" and id >= 2 and id <= 10 then
                        return true
                    end
                end
            end
            return false
        end

        if not context.blueprint and context.after and context.main_eval then
            --only act if there's a numbered card in the played cards
            if not has_numbered_in_play() then
                return nil
            end

            --destroy all cards in first hand
            if G.GAME.current_round and G.GAME.current_round.hands_played == 0 then
                local destroyed_cards = {}
                for _, v in ipairs(G.play.cards) do destroyed_cards[#destroyed_cards + 1] = v end
                SMODS.destroy_cards(destroyed_cards)

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

                if create_n > 0 then
                    G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + create_n
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            for i = 1, create_n do
                                local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'vag')
                                if _card then
                                    _card:add_to_deck()
                                    if G.consumeables and type(G.consumeables.emplace) == "function" then
                                        G.consumeables:emplace(_card)
                                    end
                                end
                            end
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                end

                return {
                    message = localize('k_plus_tarot'),
                    card = card
                }
            end
        end

        --holy mind boggling
        return nil
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.consumable_amount }, key = self.key }
    end
}
