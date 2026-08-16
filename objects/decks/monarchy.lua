SMODS.Back({
    key = "monarchy",
    atlas = "decks",
    pos = {x = 0, y = 0},
    config = {},
    artist_credits = {
        "royal_rotation"
    },
    discovered = true,
    unlocked = true,

    apply = function(self)
        G.GAME.monarchy_deck = true

        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    local card = G.playing_cards[i]

                    -- Keep Aces, Jacks, Queens, and Kings.
                    -- Remove everything else.
                    if not card:is_face() and card:get_id() ~= 14 then
                        card:remove()
                    end
                end

                G.GAME.starting_deck_size = #G.playing_cards
                G.deck.config.true_card_limit = #G.playing_cards

                return true
            end
        }))
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
})