local config = SMODS.current_mod.config
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace",}

-- Config screen
SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {align = "cm", padding = 0.05, colour = G.C.CLEAR}, nodes = {
		{n = G.UIT.C, config = {align = "cm", padding = 0.1}, nodes = {
				create_toggle({id = "disable_custom_sounds",
							   label = "Disable custom sounds (Requires restart)",
							   ref_table = config,
							   ref_value = "disable_custom_sounds"
							 }),
		}
	}}
}
end

-- Set up Malverk texture pack for enhancers
AltTexture({
    key = 'BJW_enhancers',
    set = 'Enhanced',
    path = 'bjw_enhancers.png',
    keys = {'m_mult', 'm_bonus', "m_wild"},
    original_sheet = 'true'
})

TexturePack({
    key = 'balajeweled',
    textures = {'BJW_enhancers'},
    loc_txt = {
        name = 'Balajeweled Enhancers',
        text = {'Enhancers texture pack for Balajeweled'}
    }
})

-- Atlases
SMODS.Atlas({
    key = 'modicon',
    path = 'modicon.png',
    px = '34',
    py = '34'
})

local hearts_atlas = SMODS.Atlas {
    key = 'hearts',
    path = "balajeweled_hearts.png",
    atlas_table = 'ASSET_ATLAS',
    px = 71,
    py = 95,
    disable_mipmap = true,
}
local clubs_atlas = SMODS.Atlas {
    key = 'clubs',
    path = "balajeweled_clubs.png",
    atlas_table = 'ASSET_ATLAS',
    px = 71,
    py = 95,
    disable_mipmap = true,
}
local diamonds_atlas = SMODS.Atlas {
    key = 'diamonds',
    path = "balajeweled_diamonds.png",
    atlas_table = 'ASSET_ATLAS',
    px = 71,
    py = 95,
    disable_mipmap = true,
}
local spades_atlas = SMODS.Atlas {
    key = 'spades',
    path = "balajeweled_spades.png",
    atlas_table = 'ASSET_ATLAS',
    px = 71,
    py = 95,
    disable_mipmap = true,
}
local icons_atlas = SMODS.Atlas {
    key = "icons",
    path = "balajeweled_icons.png",
    px = 18,
    py = 18,
}

-- Deck Skins
SMODS.DeckSkin {
    key = "balajeweled_hearts",
    suit = "Hearts",
    loc_txt = "Balajeweled",
    palettes = {
        {
            key = 'hc',
            ranks = ranks,
            display_ranks = {"King", "Queen", "Jack"},
            atlas = hearts_atlas.key,
            pos_style = 'suit',
            suit_icon = {
                atlas = icons_atlas.key,
            },
            loc_txt = "Garnets",
            hc_default = true,
        },
    },
}
SMODS.DeckSkin {
    key = "balajeweled_diamonds",
    suit = "Diamonds",
    loc_txt = "Balajeweled",
    palettes = {
        {
            key = 'hc',
            ranks = ranks,
            display_ranks = {"King", "Queen", "Jack"},
            atlas = diamonds_atlas.key,
            pos_style = 'suit',
            suit_icon = {
                atlas = icons_atlas.key,
            },
            loc_txt = "Jades",
            hc_default = true,
        },
    },
}
SMODS.DeckSkin {
    key = "balajeweled_clubs",
    suit = "Clubs",
    loc_txt = "Balajeweled",
    palettes = {
        {
            key = 'hc',
            ranks = ranks,
            display_ranks = {"King", "Queen", "Jack"},
            atlas = clubs_atlas.key,
            pos_style = 'suit',
            suit_icon = {
                atlas = icons_atlas.key,
            },
            loc_txt = "Sapphires",
            hc_default = true,
        },
    },
}
SMODS.DeckSkin {
    key = "balajeweled_spades",
    suit = "Spades",
    loc_txt = "Balajeweled",
    palettes = {
        {
            key = 'hc',
            ranks = ranks,
            display_ranks = {"King", "Queen", "Jack"},
            atlas = spades_atlas.key,
            pos_style = 'suit',
            suit_icon = {
                atlas = icons_atlas.key,
            },
            loc_txt = "Agates",
            hc_default = true,
        },
    },
}

-- Sounds

if not config.disable_custom_sounds then
    -- +Mult Sound
    SMODS.Sound({
        key = "bjw_twist_multup",
        path = "bjw_twist_multup.ogg",
        replace = 'multhit1'
    })

    -- Scoring sound
    SMODS.Sound({
        key = "bjw3_match",
        path = "bjw3_match.ogg",
        replace = 'chips1'
    })

    -- Polychrome sound
    SMODS.Sound({
        key = "bjw2_hypercube",
        path = "bjw2_hypercube.ogg",
        replace = 'polychrome1'
    })

    -- Debuffed sound
    SMODS.Sound({
        key = "bjw2_bad2",
        path = "bjw2_bad2.ogg",
        replace = 'cancel'
    })

    -- Holographic sound
    SMODS.Sound({
        key = "bjw2_hypercube2",
        path = "bjw2_hypercube2.ogg",
        replace = 'holo1'
    })
    
    -- Foil sound
    SMODS.Sound({
        key = "bjw2_powergem",
        path = "bjw2_powergem.ogg",
        replace = 'foil1'
    })

    -- Foil triggered sound
    SMODS.Sound({
        key = "bjw2_mystery",
        path = "bjw2_mystery.ogg",
        replace = 'foil2'
    }) 
end