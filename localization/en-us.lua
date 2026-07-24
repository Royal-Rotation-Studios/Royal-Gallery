return {
    descriptions = {
        Joker = {
            j_rlg_joker_question = {
                name = "Joker?",
                text = {
                    {
                        "{C:chips}+#1#{} Chips",
                    }
                },
            },
            j_rlg_oddity = {
                name = "Oddity",
                text = {
                    {
                        "Played cards with an",
                        "{C:attention}odd{} rank give {C:money}$#1#{}",
                        "when scored",
                        "{C:inactive}(A, 9, 7, 5, 3)",
                    }
                },
            },
            j_rlg_normality = {
                name = "Normality",
                text = {
                    {
                        "Played cards with an",
                        "{C:attention}even{} rank have a {C:green}#2# in #3#{} chance",
                        "to give {X:mult,C:white}X#1#{} Mult when scored",
                        "{C:inactive}(10, 8, 6, 4, 2)",
                    }
                },
            },
            j_rlg_suit_up = {
                name = "Suit Up",
                text = {
                    {
                        "If all cards {C:attention}held in hand{}",
                        "share the {C:attention}same{} suit, {C:mult}+#1#{} Mult",
                    }
                },
            },
            j_rlg_waste_disposal = {
                name = "Waste Disposal",
                text = {
                    {
                        "{X:chips,C:white}X#1#{} Chips, loses {X:chips,C:white}X#2#{}",
                        "Chips per {C:attention}card{} sold",
                        "{C:inactive,s:0.7}Effect will change",
                    }
                },
            },
            j_rlg_under_paid = {
                name = "Under Paid",
                text = {
                    {
                        "If first {C:blue}hand{} of the round cleared",
                        "the {C:attention}Blind{}, earn {C:money}+$#1#{} at end of round",
                    }
                },
            },
            j_rlg_alphabet_noodles = {
                name = "Alphabet Noodles",
                text = {
                    {
                        "Sell this card to create",
                        "a free {C:attention}consumable{}",
                        "{C:inactive}(Must have room){}",
                    }
                },
            },
            j_rlg_reach_stars = {
                name = "Reach for the Stars",
                text = {
                    {
                        "{C:mult}+1{} Mult per {C:planet}Planet{} card used",
                        "{C:mult}-1{} Mult per {C:planet}Celestial Pack{} {C:attention}skipped{}",
                        "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult)",
                    }
                },
            },
            j_rlg_rule_4 = {
                name = "Rule No.4",
                text = {
                    {
                        "The {C:attention}fourth{} scored card gives",
                        "the {C:attention}total{} {C:chips}+Chips{} and {C:mult}+Mult{} of all",
                        "previously scored cards this {C:attention}hand{}",
                    }
                },
            },
            j_rlg_jackoat = {
                name = "Jack of All Trades",
                text = {
                    {
                        "Each scored Jack gives {C:mult}+#1#{} Mult,",
                        "{C:chips}+#2#{} Chips, and {C:money}$#3#{}",
                    }
                },
            },
            j_rlg_conversion = {
                name = "Conversion Chart",
                text = {
                    {
                        "When a hand is played,",
                        "{C:attention}convert{} the {C:attention}scored cards'{}",
                        "{C:chips}Chips{} to {C:mult}Mult{} and {C:attention}vice versa{}",
                        "{C:inactive,s:0.7}Editions not affected{}"
                    }
                },
                unlock = {
                    "Have {C:chips}Chips{} and {C:mult}Mult{}",
                    "be the {C:attention}same{}",
                },
            },
            j_rlg_not_enough = {
                name = "Not Enough",
                text = {
                    {
                        "Adds {C:attention}triple{} the rank of",
                        "the {C:attention}highest{} card held in hand to Chips",
                    }
                },
            },
            j_rlg_key_number = {
                name = "Key Number",
                text = {
                    {
                        "Each played {C:attention}#2#{} gives",
                        "{C:attention}double{} its {C:attention}poker{} base of",
                        "{C:chips}Chips{} in {C:mult}Mult{}",
                        "{C:inactive}(Rank changes every round)",
                        "{C:inactive,s:0.7}(A = 14, K = 13, Q = 12, J = 11)",
                    }
                },
            },
            j_rlg_jokes_on_you = {
                name = "Jokes on You",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult",
                        "First played hand, gives {X:mult,C:white}X#2#{} Mult",
                        "in a {C:attention}Boss Blind{}. {C:red}Self destructs{}",
                        "after triggering {C:attention}4 times{}",
                        "{C:inactive}(Currently #3# times)",
                    }
                },
                unlock = {
                    "{C:attention}Lose{} to the {C:attention}Ante 8{}",
                    "{C:attention}Boss Blind{}",
                },
            },
            j_rlg_design_gallery = {
                name = "Design Gallery",
                text = {
                    {
                        "{C:chips}+#4#{} Chips and {C:mult}+#5#{} Mult for",
                        "every {C:attention}#1#{} in your",
                        "{C:attention}full deck{}",
                        "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips and {C:mult}+#3#{C:inactive} Mult)",
                    }
                },
            },
            j_rlg_spare_stencil = {
                name = "Spare Stencil",
                text = {
                    {
                        "On the {C:attention}first hand{} of",
                        "round, a random {Unenhanced scored",
                        "card gains a copy of a",
                        "played {C:attention}Enhancement{} until end",
                        "of round",
                        "{C:inactive}(#1#)",
                    }
                },
            },
            j_rlg_chain_reaction = {
                name = "Chain Reaction",
                text = {
                    {
                        "Retrigger played cards if the",
                        "played hand contains a {C:attention}#1#{}",
                    }
                },
            },
            j_rlg_forgetful_dice = {
                name = "Forgetful Dice",
                text = {
                    {
                        "Each card in played {C:attention}hand{} has",
                        "a {C:green}#1# in #2#{} chance to retrigger",
                        "{C:attention}2{} additional times",
                    }
                },
                unlock = {
                    "{C:attention}Fail 10{} {C:green}probabilities{}",
                    "in a {C:attention}run{}",
                },
            },
            j_rlg_limited = {
                name = "Limited",
                text = {
                    {
                        "All but the {V:1}#2#{} suit is {C:attention}debuffed{}",
                        "and the {V:1}#2#{} suit gives",
                        "their {C:chips}Chips{} {C:attention}twice{}",
                        "{C:inactive}(Suit changes each round)",
                    }
                },
            },
            j_rlg_solitary = {
                name = "The Solitary",
                text = {
                    {
                        "Each played {C:attention}#3#{} gains this",
                        "card {X:mult,C:white}X#2#{} Mult,",
                        "and gives {X:mult,C:white}X#1#{} Mult if",
                        "played hand is a {C:attention}#3#{}",
                    }
                },
            },
            j_rlg_flip_side = {
                name = "Flip Side",
                text = {
                    {
                        "Each scored {C:attention}odd ranked{} card",
                        "gives {C:chips}+#1#{} Chips, each {C:attention}even ranked{}",
                        "card gives {C:mult}+#2#{} Mult. If scored hand",
                        "contains a mix, each pair of",
                        "{C:attention}odd and even{} ranked cards",
                        "give {X:mult,C:white}X#3#{} Mult",
                    }
                },
            },
            j_rlg_capitalism = {
                name = "Capitalism",
                text = {
                    {
                        "If all played cards are",
                        "higher than {C:attention}#1#, earn",
                        "{C:money}$#2#{} at end of round,",
                        "else lose {C:red}-$#3#{}",
                        "{C:inactive}(Rank changes each round)",
                    }
                },
            },
            j_rlg_pie_pan = {
                name = "Pie Pan",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult",
                        "{C:attention}Cycles{} through {C:attention}3, 1, 4, 1, and 5{}",
                        "when hand is {C:attention}played{}",
                    }
                },
            },
            j_rlg_tough_crowd = {
                name = "Tough Crowd",
                text = {
                    {
                        "Retrigger each played",
                        "{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, {C:attention}9{}, or {C:attention}10{}",
                    }
                },
            },
            j_rlg_reinforcement_tape = {
                name = "Reinforcement Tape",
                text = {
                    {
                        "{C:attention}Glass cards{} now have a",
                        "{C:green}1 in 8{} chance to break",
                    }
                },
            },
            j_rlg_numerophobia = {
                name = "Numerophobia",
                text = {
                    {
                        "If {C:attention}first{} played {C:blue}hand{} of the {C:attention}round{}",
                        "has a {C:attention}played numbered{} card, destroy hand",
                        "and create two random {C:tarot}Tarot{} cards",
                        "{C:inactive}(Must have room)",
                    }
                },
                unlock = {
                    "Destroy {C:attention}20 numbered{}",
                    "cards in a {C:attention}run{}",
                },
            },
            j_rlg_limited_edition = {
                name = "Limited Edition",
                text = {
                    {
                        "{X:mult,C:white}Rare{} Jokers",
                        "each give {X:mult,C:white}X#1#{} Mult",
                    }
                },
            },
            j_rlg_royal_guard = {
                name = "Royal Guard",
                text = {
                    {
                        "If played hand contains a {C:attention}Three of a Kind{}",
                        "and the scoring cards are {C:attention}10's{}, {C:attention}promote{}",
                        "them into {C:attention}Jacks{}",
                    }
                },
            },
            j_rlg_masquerade = {
                name = "Masquerade",
                text = {
                    {
                        "{C:attention}Scored{} playing cards become",
                        "{C:attention}Wild Cards{} if at least {C:attention}one{}",
                        "{C:attention}Wild Card{} is scored. {C:attention}Wild Cards{}",
                        "cannot be {C:gray}debuffed{}",
                    }
                },
            },
            j_rlg_stone_skipping = {
                name = "Stone Skipping",
                text = {
                    {
                        "Each played {C:attention}stone card{} gains",
                        "{C:chips}+#1#{} Chips. Amount",
                        "{C:attention}increases{} by {C:chips}+#2#{} Chips for",
                        "every {C:attention}blind skipped{}",
                    }
                },
            },
            j_rlg_ruler_everything = {
                name = "Ruler of Everything",
                text = {
                    {
                        "Each scored {C:attention}face{} card gives {X:mult,C:white}X#1#{} Mult",
                        "and {C:chips}+#2#{} Chips. All {C:attention}non-face cards{}",
                        "are {C:attention}debuffed{}",
                    }
                },
                unlock = {
                    "Have only {C:attention}face cards{}",
                    "in a {C:attention}deck{}",
                },
            },
            j_rlg_cutouts = {
                name = "Cutouts",
                text = {
                    {
                        "When a hand is played, destroy",
                        "the {C:attention}highest{} and {C:attention}lowest{} ranked cards",
                        "played. Gains {X:mult,C:white}X#2#{} Mult for each",
                        "card destroyed this way. If",
                        "all played cards are the {C:attention}same{} rank,",
                        "this Joker doesn't destroy any cards",
                        "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                    }
                },
            },
            j_rlg_high_five = {
                name = "High Five?",
                text = {
                    {
                        "If played hand contains {C:attention}five{} cards",
                        "and a {C:attention}5{}, this card gains {C:mult}+#2#{} Mult.",
                        "Resets if no {C:attention}5's{} were scored",
                        "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                    }
                },
            },
            j_rlg_friends_lovers = {
                name = "Friends to Lovers",
                text = {
                    {
                        "On {C:attention}first hand{} of round,",
                        "if played hand contains a {C:attention}Wild Card{},",
                        "{C:green}#2# in #3#{} chance to add {C:blue}+#1#{} Hand.",
                        "Chance {C:attention}increases{} with every played",
                        "{C:attention}Wild Card{}",
                        "{C:inactive}(#4#)",
                    }
                },
            },
            j_rlg_alphabet_soup = {
                name = "Alphabet Soup",
                text = {
                    {
                        "Whenever a {C:attention}consumable{} is",
                        "{C:attention}sold{}, {C:green}#1# in #2#{} chance for this",
                        "Joker to {C:attention}gain{} {C:money}+$#3#{} to its {C:attention}sell value{}.",
                        "Upon {C:attention}defeating{} the {C:attention}Boss Blind{}, {C:attention}gain{}",
                        "this card's sell value and reset it",
                        "{C:inactive}(Currently $#4#)",
                    }
                },
                unlock = {
                    "Sell {C:attention}Alphabet Soup{}",
                },
            },
            j_rlg_art_box = {
                name = "Art Box",
                text = {
                    {
                        "This Joker gains",
                        "{X:mult,C:white}X#2#{} Mult when each",
                        "played card with an",
                        "{C:attention}enhancement{} is scored",
                        "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                    }
                },
            },
            j_rlg_mount_joker = {
                name = "Mount Joker",
                text = {
                    {
                        "If there are {C:attention}4{} or",
                        "more {C:attention}Stone Cards{} held in hand,",
                        "each give {X:mult,C:white}X#1#{} Mult",
                    }
                },
            },
            j_rlg_mountainside = {
                name = "Mountainside",
                text = {
                    {
                        "{C:attention}Stone Cards{} count as whichever",
                        "card there is most of",
                        "in the {C:attention}deck{}",
                        "{C:inactive,s:0.7}(Currently: #1#)",
                    }
                },
            },
            j_rlg_glass_canon = {
                name = "Glass Canon",
                text = {
                    {
                        "The {C:attention}first glass card{} played",
                        "each {C:attention}round{}, gives {X:mult,C:white}X#1#{} Mult,",
                        "and then {C:attention}destroys{} all {C:attention}glass cards{}",
                        "held in hand. {C:green}#2# in #3#{} chance to",
                        "{C:red}self destruct{} at round end",
                        "{C:inactive,s:0.7}Sprite is placeholder <3",
                    }
                },
            },
            j_rlg_arlecchino = {
                name = "Arlecchino",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult.",
                        "Gains {X:mult,C:white}X#2#{} Mult whenever another",
                        "{C:attention}Joker{} is destroyed",
                        "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                    }
                },
                unlock = {
                    "?????",
                },
            },
        },
        Enhanced = {
            m_rlg_pastel = {
                name = "Pastel Card",
                text = {
                    "{C:money}+$#1#{} if played",
                    "{C:attention}adjacent{} to another",
                    "{C:attention}enhanced{} card",
                }
            },
        },
        Tarot = {
            c_rlg_charity = {
                name = "The Charity",
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#{}",
                }
            },
        },
        ["Artist"] = {
            royal_rotation = {
                name = "Royal_Rotation"
            },
            punchline = {
                name = "gfs (Punchline /CB)"
            },
            muddz = {
                name = "Muddz"
            }
        }
    },
    misc = {
        dictionary = {
            a_chips = "+#1#",
            a_chips_minus = "-#1#",
            a_hands = "+#1# Hands",
            a_handsize = "+#1# Hand Size",
            a_handsize_minus = "-#1# Hand Size",
            a_mult = "+#1# Mult",
            a_mult_minus = "-#1# Mult",
            a_remaining = "#1# Remaining",
            a_sold_tally = "#1#/#2# Sold",
            a_xmult = "X#1# Mult",
            a_xmult_minus = "-X#1# Mult",
            hash_symbol = "#",

            labels = {
                sj_test_seal = "Test Seal",
            }
        }
    }
}
