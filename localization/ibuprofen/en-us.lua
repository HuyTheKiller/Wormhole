return {
    descriptions = {
        PotatoPatch = {
            k_team_ibuprofen = {
                name = "Team Ibuprofen",
            },
            d_twigi = {
                name = "Twigi",
                text = {
                    "Lead Programmer", "Artist of", "Eclipse, Supergiant, Nebula", "Extremely Swag B)"
                }
            },
            d_joos = {
                name = "Oasis-J",
                text = {
                    "Lead Artist", "Programmer of", "Cosmic, Dyson Sphere & Event Horizon", '~My body is a machine',
                    'that turns hyperdrive into', 'the worst art ever~'
                }
            },
            d_avery = {
                name = "AveryIGuess",
                text = {
                    "Concept Art", "Frozen Card Idea", "Laika, Shining Star, Permafrost", "Space Heater & Jettison",
                    "Mechanic Ideas", "Chomping Rocks"
                }
            },
        },
        Tarot = {
            c_worm_ibu_mountain = {
                name = 'The Mountain',
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#{}"
                }
            }
        },
        Spectral = {
            c_worm_ibu_eclipse = {
                name = 'Eclipse',
                text = {
                    "Add {C:dark_edition}Negative{} to up to",
                    "{C:attention}#1#{} selected playing card"
                }
            },
            c_worm_ibu_nebula = {
                name = 'Nebula',
                text = {
                    "Add {C:dark_edition}Cosmic{} to up to",
                    "{C:attention}#1#{} selected playing card"
                }
            },
            c_worm_ibu_supergiant = {
                name = 'Supergiant',
                text = {
                    "{C:attention}Triple{} a card's {C:chips}Chip{} value"
                }
            }
        },
        Edition = {
            e_worm_ibu_cosmicedition = {
                label = "Cosmic",
                name = "Cosmic",
                text = {
                    "Gives {C:mult}+#1#{} Mult for each ",
                    "{C:attention}level of played hand{} when scored"
                },
            }
        },
        Enhanced = {
            m_worm_ibu_frozen = {
                name = 'Frozen Card',
                text = {
                    "{C:attention}Once{} per round,",
                    "{C:attention}returns to hand{}",
                    "if played or discarded",
                }
            }
        },
        Joker = {
            j_worm_ibu_enginefailure = {
                name = 'Engine Failure',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:mult} Self destructs{} if score {C:attention}catches fire{}"
                }
            },
            j_worm_ibu_dyson = {
                name = 'Dyson Sphere',
                text = {
                    "Each {C:tarot}The Sun{} or",
                    "{C:tarot}The Star{} cards in",
                    "your {C:attention}consumables{} area",
                    "give {X:mult,C:white}X#1#{} Mult",
                },
            },
            j_worm_ibu_horizon = {
                name = "Event Horizon",
                text = {
                    "{X:red,C:white}X#1#{} Mult per level over 1",
                    "on {C:attention}lowest-level poker hand",
                    "{C:inactive}(Currently: {X:red,C:white}X#2#{C:inactive} Mult)"
                },
            },
            j_worm_ibu_redshift = {
                name = 'Red Shift',
                text = {
                    "Played {C:attention}Enhanced{} Cards give",
                    "{C:mult}+#1#{} Mult when scored"
                }
            },
            j_worm_ibu_permafrost = {
                name = 'Permafrost',
                text = {
                    "{C:attention}Frozen Cards{}",
                    "always return to hand"
                }
            },
            j_worm_ibu_laika = {
                name = 'Laika',
                text = {
                    "Earn {C:money}$#2#{} at the end of round",
                    "for each time {C:attention}most played hand{} was played",
                    "{C:inactive}(Currently: {C:money}$#1#{C:inactive})"
                }
            },
            j_worm_ibu_hyperdrive = {
                name = 'Hyper Space',
                text = {
                    "Earn {C:money}double ${}",
                    "{C:attention}Ante{} increases twice as fast"
                }
            },
            j_worm_ibu_terraforming = {
                name = 'Terraforming',
                text = {
                    "Create an {C:planet}Earth{} whenever",
                    "a {C:planet}#1#{} is used",
                    "{C:inactive,s:0.8}required planet changes each round",
                }
            },
            j_worm_ibu_jettison = {
                name = 'Jettison',
                text = {
                    '{C:attention}First discarded{} hand',
                    'becomes {C:attention}Frozen Cards{}',
                },
            },
            j_worm_ibu_brood = {
                name = 'Brood Mother',
                text = {
                    "Destroy a random card in hand",
                    "and create a {C:attention}Jack{} whenever",
                    " a {C:attention}Queen{} is played"
                }
            },
            j_worm_ibu_warpgate = {
                name = 'Warp Gate',
                text = {
                    "Sell this card after {C:attention}#2# round{}",
                    "to give {C:Legendary}Eternal{} to a random joker",
                    "{C:inactive}(Currently: {C:attention}#1#/#2# {C:inactive}round)"
                }
            },
            j_worm_ibu_heater = {
                name = 'Space Heater',
                text = {
                    'Melts played {C:attention}Frozen Cards{}',
                    'and gains {X:mult,C:white} X#2# {} Mult',
                    '{C:inactive}Currently {X:mult,C:white} X#1# {}'
                },
            },
            j_worm_ibu_asteroidmining = {
                name = 'Asteroid Mining',
                text = {
                    'Earn {C:money}$#1#{} when a',
                    '{C:attention}Frozen Card{} is scored'
                },
            },
            j_worm_ibu_shiningstar = {
                name = 'Shining Star',
                text = {
                    "If played hand is a",
                    "{C:attention}Single {C:diamonds}Diamond{} card,",
                    "retrigger it {C:attention}#1#{} times"
                }
            }
        }
    },
    misc = {
        labels = {
            worm_ibu_cosmicedition = 'Cosmic'
        },
    },
}
