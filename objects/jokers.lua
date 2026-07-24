local joker_list = {
    'joker_question',
    'oddity',
    'normality',
    'suit_up',
    'waste_disposal',
    'under_paid',
    'three_jokes_trench_coat',
    'alphabet_noodles',
    'reach_stars',
    'rule_4',
    'jackoat',
    'gun_king',
    'the_wilderness',
    'fifty_cent_joker',
    'ship_in_a_bottle',
    'conversion',
    'not_enough',
    'jokes_on_you',
    'design_gallery',
    'key_number',
    'spare_stencil',
    'chain_reaction',
    'forgetful_dice',
    'limited',
    'solitary',
    'flip_side',
    'capitalism',
    'pie_pan',
    'three_way',
    'tough_crowd',
    'reinforcement_tape',
    'numerophobia',
    'dessert_parlor',
    'limited_edition',
    'royal_guard',
    'lucky_7s',
    'masquerade',
    'stone_skipping',
    'ruler_everything',
    'cutouts',
    'high_five',
    "friends_lovers",
    'patio',
    'chaos_theory',
    'event_horizon',
    'alphabet_soup',
    'wayback_machine',
    'art_box',
    'mountainside',
    'mount_joker',
    'glass_canon',
    -- legendaries
    --'time_loop',
    'arlecchino'
    --'terminal_hyperdeath'
}

-- you can have shared helper functions
function shakecard(self) --visually shake a card
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
    if context.joker_main and context.cardarea == G.jokers then
        return {
            chips = card.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
            mult = card.ability.extra.mult,         -- adds mult (+)
            x_mult = card.ability.extra.x_mult,     -- multiplies existing mult (*)
            card = self,                            -- under which card to show the message
            colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
            message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
            extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
        }
    end
end

for _, key in ipairs(joker_list) do
    local rel = "objects/jokers/" .. key .. ".lua"
    print("[DBG] trying:", rel)

    -- call load_file in pcall to capture parse/load errors
    local ok, loader_or_err = pcall(SMODS.load_file, rel)
    if not ok then
        print("[DBG] SMODS.load_file threw for:", rel, " | error:", loader_or_err)
    else
        -- load_file returned something (hopefully a function)
        if type(loader_or_err) ~= "function" then
            print("[DBG] SMODS.load_file returned non-function for:", rel, " | value:", tostring(loader_or_err))
        else
            -- call the returned loader safely
            local ok2, err2 = pcall(loader_or_err)
            if not ok2 then
                print("[DBG] loader execution error for:", rel, " | error:", err2)
            else
                print("[DBG] loaded OK:", rel)
            end
        end
    end
end



--for _, key in ipairs(joker_list) do
--    local rel = 'assets/jokers/'..key..'.lua'
--    assert(type(SMODS.load_file(rel)) == "function", "Missing or invalid file: " .. rel)
--    SMODS.load_file(rel)()
--end