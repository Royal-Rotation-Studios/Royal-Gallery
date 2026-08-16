Royal_Gallery = {}

assert(SMODS.load_file("globals.lua"))()

--Atlas
assert(SMODS.load_file("utils/atlas.lua"))()

--Artists
assert(SMODS.load_file("utils/artists.lua"))()

-- Decks
local enhancement_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects/decks")
for _, file in ipairs(enhancement_src) do
    assert(SMODS.load_file("objects/decks/" .. file))()
end

-- Enhancements (importan to load them here before things that use them)
local enhancement_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects/enhancements")
for _, file in ipairs(enhancement_src) do
    assert(SMODS.load_file("objects/enhancements/" .. file))()
end

-- Consumables
local consumable_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects/consumables")

for _, file in ipairs(consumable_src) do
    if string.sub(file, -4) == ".lua" then
        assert(SMODS.load_file("objects/consumables/" .. file))()
    else
        local sub_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects/consumables/" .. file)
        for _, sub_file in ipairs(sub_src) do
            if string.sub(sub_file, -4) == ".lua" then
                assert(SMODS.load_file("objects/consumables/" .. file .. "/" .. sub_file))()
            end
        end
    end
end

-- Jokers
assert(SMODS.load_file("objects/jokers.lua"))()

--Hooks
assert(SMODS.load_file("utils/hooks.lua"))()

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

--Crossmod
local crossmod_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects/crossmod")

for _, file in ipairs(crossmod_src) do
    if string.sub(file, -4) == ".lua" then
        assert(SMODS.load_file("objects/crossmod/" .. file))()
    else
        local sub_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects/crossmod/" .. file)
        for _, sub_file in ipairs(sub_src) do
            if string.sub(sub_file, -4) == ".lua" then
                assert(SMODS.load_file("objects/crossmod/" .. file .. "/" .. sub_file))()
            end
        end
    end
end