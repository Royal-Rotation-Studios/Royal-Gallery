---@diagnostic disable: duplicate-set-field, lowercase-global
--Creates the flags
--Basically used the one from Paperback
local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
  BackApply_to_run_ref(arg_56_0)
  G.GAME.pool_flags.alphabet_noodles_can_spawn = true
  G.GAME.pool_flags.alphabet_soup_can_spawn = false
  G.GAME.pool_flags.alphabet_soup_unlocked = false
  --^used for alphabet noodles being used to add alphabet soup to the pool
end

local old_init_game_object = Game.init_game_object

function Game.init_game_object(self)
    local ret = old_init_game_object(self)

    ret.rlg_numbered_cards_destroyed = 0
    ret.rlg_failed_probabilities = 0
    ret.rlg_lost_ante_8 = false
    ret.current_round.rlg_limited_card = {
        suit = "Spades"
    }
    ret.current_round.rlg_key_number_card = {
        rank = "Ace",
        id = 14
    }

    return ret
end

--UNLOCK HOOKS
--Track numbered card destruction
local old_destroy = SMODS.destroy_cards

function SMODS.destroy_cards(cards, ...)
    for _, card in ipairs(cards) do
        if card and card.base and card.base.id
        and card.base.id >= 2
        and card.base.id <= 10 then
            if G.GAME then
                G.GAME.rlg_numbered_cards_destroyed =
                    (G.GAME.rlg_numbered_cards_destroyed or 0) + 1
            end
        end
    end

    return old_destroy(cards, ...)
end

--Chips and Mult
local evaluate_play_ref = G.FUNCS.evaluate_play

G.FUNCS.evaluate_play = function(e)
    local ret = evaluate_play_ref(e)

    if G.GAME and hand_chips and mult then
        G.GAME.last_hand_chips = hand_chips
        G.GAME.last_hand_mult = mult
    end

    return ret
end

--Probability
local old_probability = SMODS.pseudorandom_probability

function SMODS.pseudorandom_probability(card, id, numerator, denominator)
    local result = old_probability(card, id, numerator, denominator)

    if G.GAME and not result then
        G.GAME.rlg_failed_probabilities =
            (G.GAME.rlg_failed_probabilities or 0) + 1
    end

    return result
end

--Face card deck check
function RLG_only_face_cards()
    if not G.playing_cards or #G.playing_cards == 0 then
        return false
    end

    for _, card in ipairs(G.playing_cards) do
        if not card:is_face() then
            return false
        end
    end

    return true
end


--Ante 8 boss loss tracker
local end_round_ref = end_round

function end_round()
    if G.GAME
    and G.GAME.blind
    and G.GAME.blind.boss
    and G.GAME.round_resets
    and G.GAME.round_resets.ante == 8
    and G.GAME.current_round.hands_left == 0
    and G.GAME.chips < G.GAME.blind.chips then

        G.GAME.rlg_lost_ante_8 = true
    end

    return end_round_ref()
end