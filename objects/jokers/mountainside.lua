-- Hook Stone cards to use Mountainside's chosen rank
local get_id_ref = Card.get_id

function Card:get_id()
    if SMODS.has_enhancement(self, "m_stone") then
        local joker = SMODS.find_card("j_rlg_mountainside")[1]

        if joker and joker.ability.extra.rank then
            return joker.ability.extra.rank
        end
    end

    return get_id_ref(self)
end

local rank_names = {
    [2] = "2",
    [3] = "3",
    [4] = "4",
    [5] = "5",
    [6] = "6",
    [7] = "7",
    [8] = "8",
    [9] = "9",
    [10] = "10",
    [11] = "Jack",
    [12] = "Queen",
    [13] = "King",
    [14] = "Ace"
}

local function get_deck_signature()
    local signature = ""

    for _, c in ipairs(G.playing_cards) do
        local id = get_id_ref(c)

        -- Include actual rank and enhancement
        signature = signature .. tostring(id) .. ":"

        if SMODS.has_enhancement(c, "m_stone") then
            signature = signature .. "stone"
        end

        signature = signature .. ";"
    end

    return signature
end

local function calculate_mountainside_rank(card)
    local counts = {}

    for _, c in ipairs(G.playing_cards) do
        local id = get_id_ref(c)

        -- Ignore Stone cards and invalid ranks
        if id >= 2 and id <= 14 then
            counts[id] = (counts[id] or 0) + 1
        end
    end

    local best_rank = nil
    local best_count = 0
    local tied = false

    for rank, count in pairs(counts) do
        if count > best_count then
            best_rank = rank
            best_count = count
            tied = false
        elseif count == best_count then
            tied = true
        end
    end

    if tied then
        best_rank = nil
    end

    card.ability.extra.rank = best_rank
end

SMODS.Joker{
    key = "mountainside",
    config = {
        extra = {
            rank = nil,
            deck_signature = ""
        }
    },
    pos = { x = 8, y = 4 },
    rarity = 2,
    cost = 7,
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
        local signature = get_deck_signature()

        if signature ~= card.ability.extra.deck_signature then
            card.ability.extra.deck_signature = signature
            calculate_mountainside_rank(card)
        end
    end,

    in_pool = function(self, args) --enhancement gate so you only can find if theres a stonedd card in your deck
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        local rank = "Nothing"

        if card.ability.extra.rank then
            rank = rank_names[card.ability.extra.rank]
        end

        return {
            vars = { rank }
        }
    end
}