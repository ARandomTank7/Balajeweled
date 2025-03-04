local atlas_key = 'BJW'

local atlas_path = 'balajeweled.png'
local atlas_path_hc = nil

local enhancers_path = 'bjw_enhancers.png'

local suits = {'hearts', 'spades', 'clubs', 'diamonds'}
local ranks = {"Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"}

local description = 'Balajeweled'

SMODS.Atlas({
    key = 'modicon',
    path = 'modicon.png',
    px = '34',
    py = '34'
})

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
