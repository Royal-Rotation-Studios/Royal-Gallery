Royal_Gallery = {}

assert(SMODS.load_file("globals.lua"))()

-- Jokers
--local function ensure_slash(p)
--    if p:sub(-1) ~= "/" and p:sub(-1) ~= "\\" then
--        return p .. "/"
--   end
--    return p
--end

--local function load_all_lua_in_dir(rel_dir, abs_dir)
--    abs_dir = ensure_slash(abs_dir)
--    -- try to list directory contents (pcall in case it's not a directory)
--    local ok, entries = pcall(NFS.getDirectoryItems, abs_dir)
--    if not ok or type(entries) ~= "table" then return end
--
--    for _, entry in ipairs(entries) do
--        local abs_entry = abs_dir .. entry
--        if entry:match("%.lua$") then
--            -- load relative path, preserving subfolder (e.g. "jokers/templates/foo.lua")
--            assert(SMODS.load_file(rel_dir .. entry))()
--        else
--            -- attempt recursion for directories; check if listing returns something
--            local sub_ok, sub_entries = pcall(NFS.getDirectoryItems, abs_entry .. "/")
--            if sub_ok and type(sub_entries) == "table" and #sub_entries > 0 then
--                load_all_lua_in_dir(rel_dir .. entry .. "/", abs_entry .. "/")
--            end
--        end
--    end
--end

-- prepare absolute and relative joker paths
--local joker_abs = ensure_slash(SMODS.current_mod.path) .. "jokers/"
--local joker_rel = "jokers/"

-- run it
--load_all_lua_in_dir(joker_rel, joker_abs)


--Jokers
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects")
for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("objects/jokers.lua"))()
end

-- Cards
local card_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "objects")
for _, file in ipairs(card_src) do
    assert(SMODS.load_file("objects/cards.lua"))()
end
