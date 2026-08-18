SMODS.Joker {
    key = "royal_guard",
    config = { extra = { checked_rank = 10, rank_to_turn_into = "Jack" } },
    pos = { x = 4, y = 3 },
    rarity = 2,
    cost = 6,
    artist_credits = {
        "royal_rotation"
    },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, card, context)

        if context.after and context.scoring_name == 'Three of a Kind' and not context.blueprint then

            local tens = {}

            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() == card.ability.extra.checked_rank then
                    tens[#tens + 1] = v
                end
            end

            if #tens == 3 then

                for _, v in ipairs(tens) do

                    --flip the card face down
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:flip()
                            return true
                        end
                    }))

                    --wait for flip animation
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.35,
                        func = function()
                            SMODS.change_base(v, nil, card.ability.extra.rank_to_turn_into)
                            return true
                        end
                    }))

                    --flip back face up
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            v:flip()
                            return true
                        end
                    }))

                end

                return {
                    message = "Promoted!"
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { localize("Ten", 'ranks'), localize("Jack", 'ranks') }, key = self.key }
    end
}