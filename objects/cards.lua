--High contrast
SMODS.Atlas({
    key = "deck_hc", --High contrast
    path = "deck_opt2.png",
    px = 69,
    py = 93
})

--List of ranks
--SMODS.Rank {
--    hc_atlas = 'deck_hc',
--
--    key = 'eleven',
--    card_key = '11',
--    pos = { x = 10 },
--    nominal = 11,
--    loc_txt = { name = "11"},
--    shorthand = "11",
--    face = false,
--    next = {"Jack", "Queen", "King"}
--}

--SMODS.Rank {
--    hc_atlas = 'deck_hc',

--    key = 'twelve',
--    card_key = '12',
--    pos = { x = 11 },
--    nominal = 12,
--    loc_txt = { name = "12"},
--    shorthand = "12",
--    face = false,
--    next = {"Jack", "Queen", "King"}
--}

--local suits = {"Hearts", "Clubs", "Diamonds", "Spades"}

--for _, suit in ipairs(suits) do
    --Create a playing card instance of the new rank for each suit
--    local ok, card_or_err = pcall(function()
--        return SMODS.create_card{
--            set = "Playing Card",
--            suit = suit,
--            rank = "eleven",
--            area = G.deck,
--        }
--    end)
--end
