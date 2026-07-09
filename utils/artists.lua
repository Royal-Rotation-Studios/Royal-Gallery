G.ARGS.LOC_COLOURS.royal_rotation = HEX("827AFF")
G.ARGS.LOC_COLOURS.punchline = HEX("3C4368")


function artist_node(artists)
    local rows = {}

    local artist_text = {
        n = G.UIT.R,
        config = {
            align = "cm",
            padding = 0.03
        },
        nodes = {}
    }

    table.insert(artist_text.nodes, {
        n = G.UIT.T,
        config = {
            text = "Exhibit by: ",
            colour = G.C.UI.TEXT_LIGHT,
            scale = 0.27
        }
    })

    for i, artist in ipairs(artists) do
        if i > 1 then
            table.insert(artist_text.nodes, {
                n = G.UIT.T,
                config = {
                    text = ", ",
                    colour = G.C.WHITE,
                    scale = 0.27
                }
            })
        end

        table.insert(artist_text.nodes, {
            n = G.UIT.T,
            config = {
                text = localize{
                    type = "name_text",
                    set = "Artist",
                    key = artist
                },
                colour = G.ARGS.LOC_COLOURS[artist] or G.C.WHITE,
                scale = 0.27
            }
        })
    end

    table.insert(rows, artist_text)

    return {
        n = G.UIT.R,
        config = {
            align = "cm",
            colour = lighten(G.C.JOKER_GREY, 0.5),
            r = 0.1,
            padding = 0.05,
            emboss = 0.05
        },
        nodes = {
            {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    colour = darken(G.C.JOKER_GREY, 0.15),
                    r = 0.1,
                    padding = 0.05
                },
                nodes = rows
            }
        }
    }
end

local old_card_h_popup = G.UIDEF.card_h_popup

function G.UIDEF.card_h_popup(card)

    local ret = old_card_h_popup(card)

    local obj = card.config.center

    if obj and obj.artist_credits then
        table.insert(
            ret.nodes[1].nodes[1].nodes[1].nodes,
            artist_node(obj.artist_credits)
        )
    end

    return ret
end