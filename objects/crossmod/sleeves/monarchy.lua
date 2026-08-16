if not CardSleeves then
    return
end

-- Monarchy Sleeve
CardSleeves.Sleeve {
    key = "monarchy",
    atlas = "sleeves",
    pos = {x = 0, y = 0},
    config = {},
    artist_credits = {
        "royal_rotation"
    },
    discovered = true,
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        local key = self.key

        if self.get_current_deck_key() == "b_rlg_monarchy" then
            key = key .. "_alt"
        end

        return {
            key = key,
            vars = {}
        }
    end,

    apply = function(self, sleeve)
        G.GAME.monarchy_deck = true

        --only create f(aces) when paired with the deck + deck sleeve 
        if self.get_current_deck_key() == "b_rlg_monarchy" and self.allowed_card_centers == nil then
            self.allowed_card_centers = {}
            self.skip_trigger_effect = true

            --malke a list containing only Aces and face cards.
            for _, card_center in pairs(G.P_CARDS) do
                local card_instance = Card(
                    0, 0, 0, 0,
                    card_center,
                    G.P_CENTERS.c_base
                )

                local rank = SMODS.Ranks[card_instance.base.value]

                if rank.face or card_instance.base.value == "Ace" then
                    self.allowed_card_centers[#self.allowed_card_centers + 1] = card_center
                end

                card_instance:remove()
            end

            self.skip_trigger_effect = false
        end

        --remove numbered cards from the starting deck.
        if self.get_current_deck_key() == "b_rlg_monarchy" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = #G.playing_cards, 1, -1 do
                        local card = G.playing_cards[i]

                        --keep Aces, Jacks, Queens, and Kings (honours)
                        if not card:is_face() and card:get_id() ~= 14 then
                            card:remove()
                        end
                    end

                    G.GAME.starting_deck_size = #G.playing_cards
                    G.deck.config.true_card_limit = #G.playing_cards

                    return true
                end
            }))
        end
    end,

    calculate = function(self, sleeve, context)
        --only activate the special effect with the Monarchy Deck.
        if self.get_current_deck_key() ~= "b_rlg_monarchy" then
            return
        end

        if self.skip_trigger_effect then
            return
        end

        if self.allowed_card_centers == nil then
            sleeve:apply(sleeve)
        end

        local card = context.card

        local is_playing_card =
            card
            and card.ability
            and (card.ability.set == "Default" or card.ability.set == "Enhanced")
            and card.config
            and card.config.card_key

        -- Only affect cards being CREATED during the run.
        -- This deliberately excludes the initial deck.
        if context.create_card
            and G.GAME.blind ~= nil
            and card
            and is_playing_card then

            local rank = SMODS.Ranks[card.base.value]

            --if the generated card is numbered, replace it with a random Ace or face card.
            if not rank.face and card.base.value ~= "Ace" then
                local random_base = pseudorandom_element(
                    sleeve.allowed_card_centers,
                    pseudoseed("monarchy")
                )

                card:set_base(random_base, false)
            end
        end
    end
}