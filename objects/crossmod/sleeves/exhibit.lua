if not CardSleeves then
    return
end

-- Exhibit Sleeve
CardSleeves.Sleeve {
    key = "exhibit",
    atlas = "sleeves",
    pos = {x = 1, y = 0},
    artist_credits = {
        "royal_rotation"
    },
    config = {},
    discovered = true,
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        local key = self.key

        if self.get_current_deck_key() == "b_rlg_exhibit" then
            key = key .. "_alt"
        end

        return {
            key = key,
            vars = {}
        }
    end,

    apply = function(self, sleeve)
        if self.get_current_deck_key() == "b_rlg_exhibit" then
            change_shop_size(1)
        end
    end
}