Royal_Gallery = {}

assert(SMODS.load_file("globals.lua"))()

--Jokers
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects")
for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("objects/jokers.lua"))()
end

--Artists
assert(SMODS.load_file("utils/artists.lua"))()

--[[ Cards
local card_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects")
for _, file in ipairs(card_src) do
    assert(SMODS.load_file("objects/cards.lua"))()
end]]

--Food oobject types
SMODS.ObjectType({
	key = "Food",
	default = "j_ice_cream",
	cards = {
		j_gros_michel = true,
		j_egg = true,
		j_ice_cream = true,
		j_cavendish = true,
		j_turtle_bean = true,
		j_diet_cola = true,
		j_popcorn = true,
		j_ramen = true,
		j_selzer = true,
	},
})