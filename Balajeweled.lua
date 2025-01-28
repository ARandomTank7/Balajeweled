--- STEAMODDED HEADER
--- MOD_NAME: Balajeweled
--- MOD_ID: balajeweled
--- PREFIX: BJW
--- MOD_AUTHOR: [ARandomTank7]
--- MOD_DESCRIPTION: A love letter to PopCap's Bejeweled, adds a Bejeweled-themed deck skin into the game.
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 0.0.6~beta
--- BADGE_COLOR: 2983EB

local atlas_key = 'BJW'

local atlas_path = 'balajeweled.png'
local atlas_path_hc = nil

local enhancers_path = 'bjw_enhancers.png'

local suits = {'hearts', 'spades', 'clubs', 'diamonds'}
local ranks = {"Ace","2", "3", "4", "5", "6"} 

local description = 'Balajeweled'

SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false}, 
}

SMODS.Atlas{
	key = "centers",
	path = enhancers_path,
	px = 71,
	py = 95,
	prefix_config = { key = false }
}:register()

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false}, 
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end

-- Notes:

-- The current version of Steamodded has a bug with prefixes in mods including `DeckSkin`s.
-- By manually including the prefix in the atlas' key, this should keep the mod functional
-- even after this bug is fixed.
