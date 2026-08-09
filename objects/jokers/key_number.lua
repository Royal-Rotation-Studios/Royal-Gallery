SMODS.Joker{
    key = "key_number",
    config = { extra = { mult = 1 } },
    pos = { x = 1, y = 2 },
    rarity = 2,
    cost = 7,
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
        if context.individual and context.cardarea == G.play and context.other_card and G.GAME.current_round.rlg_key_number_card 
            and context.other_card:get_id() == G.GAME.current_round.rlg_key_number_card.id then
            card.ability.extra.mult = context.other_card:get_id() * 2
            return {
                mult = card.ability.extra.mult,
                card = card
            }
        end

        if context.end_of_round and not context.blueprint then
            G.GAME.current_round.rlg_key_number_card = { rank = "Ace", id = 14 }
            local valid_num_cards = {}
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_rank(playing_card) then
                    valid_num_cards[#valid_num_cards + 1] = playing_card
                end
            end
            local key_num_card = pseudorandom_element(
                valid_num_cards,
                "rlg_key_number_card" .. G.GAME.round_resets.ante
            )
            if key_num_card then
                G.GAME.current_round.rlg_key_number_card.rank = key_num_card.base.value
                G.GAME.current_round.rlg_key_number_card.id = key_num_card.base.id
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local rank = (G.GAME.current_round.rlg_key_number_card or {}).rank or "Ace"
        return { vars = { card.ability.extra.mult, localize(rank, "ranks") } }
    end
}