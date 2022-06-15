--hair.lua
--This file defines everything for the hair dye items and npc's

--first is base second is highlight
hair_colors = {
    red         = {     {215, 0, 0},     {245, 0, 0} }, 
    orange      = {   {215, 107, 0},   {245, 122, 0} }, 
    yellow      = {   {215, 215, 0},   {245, 245, 0} }, 
    green       = {     {0, 215, 0},     {0, 245, 0} }, 
    teal        = {   {0, 215, 215},   {0, 245, 245} }, 
    blue        = {   {0, 107, 215},   {0, 122, 245} }, 
    royal_blue  = {     {0, 0, 215},     {0, 0, 245} }, 
    purple      = {   {107, 0, 215},   {122, 0, 245} }, 
    pink        = {   {215, 0, 107},   {245, 0, 122} },
    mushy       = {  {208, 126, 66},  {224, 157, 83} },
    zoobot      = {   {0, 225, 116},   {0, 255, 132} },
    beenus      = { {216, 143, 149}, {255, 186, 192} }
}

Hair_Dye = {
    red         = MOD_NAME .. "_hair_dye_red",
    orange      = MOD_NAME .. "_hair_dye_orange",
    yellow      = MOD_NAME .. "_hair_dye_yellow",
    green       = MOD_NAME .. "_hair_dye_green",
    teal        = MOD_NAME .. "_hair_dye_teal",
    blue        = MOD_NAME .. "_hair_dye_blue",
    royal_blue  = MOD_NAME .. "_hair_dye_royal_blue",
    purple      = MOD_NAME .. "_hair_dye_purple",
    pink        = MOD_NAME .. "_hair_dye_pink"
}

Special_Hair_Dye = {
    mushy       = MOD_NAME .. "_hair_dye_mushy",
    zoobot      = MOD_NAME .. "_hair_dye_zoobot",
    beenus      = MOD_NAME .. "_hair_dye_beenus"
}

function define_hair_items() 

    -- Define Hair Dye Items
    for i, v in pairs(Hair_Dye)do
        test = api_define_item({
            id = "hair_dye_".. i,
            name = string.upper(i) .. " Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/hair_items/hair_dye_".. i ..".png")
        api_log("define " .. i, test)
    end

    -- Define Special Hair Dye Items
    for i, v in pairs(Special_Hair_Dye)do
        test = api_define_item({
            id = "hair_dye_".. i,
            name = string.upper(i) .. "'s Special Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/hair_items/hair_dye_".. i ..".png")
        api_log("define " .. i, test)
    end

    --define dye remover item
    test = api_define_item({
        id = "hair_dye_remover",
        name = "Dye Remover",
        category = "Decoration",
        tooltip = "Right click to remove dye from your hair.",
        shop_buy = 15,
        shop_sell = 5
    }, "sprites/hair_items/hair_dye_remover.png")
    api_log("define Dye Remover", test)

end

-- define a new npc
function define_hair_npc()

    -- define npc
    npc_def = api_define_npc({
        id = 51,
        name = "DOT",
        pronouns = "He/Him",
        tooltip = "Need a new look?",
        specials = {
            Special_Hair_Dye["mushy"],
            Special_Hair_Dye["zoobot"],
            Special_Hair_Dye["beenus"]
        }, -- must be atleast 3
        stock = {
            Hair_Dye["red"],
            Hair_Dye["orange"],
            Hair_Dye["yellow"],
            Hair_Dye["green"],
            Hair_Dye["teal"],
            Hair_Dye["blue"],
            Hair_Dye["royal_blue"],
            Hair_Dye["purple"],
            Hair_Dye["pink"],
            MOD_NAME .. "_hair_dye_remover"
        }, -- max 10
        greeting = "Howdy!",
        dialogue = {
          "Im starting a new life here in APICO",
          "The weather is something to get used to, huh?"
        },
        walking = true,
        shop = true
    },
    "sprites/hair_npc/npc_standing.png",
    "sprites/hair_npc/npc_standing_h.png",
    "sprites/hair_npc/npc_walking.png",
    "sprites/hair_npc/npc_walking_h.png",
    "sprites/hair_npc/npc_head.png",
    "sprites/hair_npc/npc_bust.png",
    "sprites/hair_npc/npc_item.png",
    "sprites/hair_npc/npc_dialogue_menu.png",
    "sprites/hair_npc/npc_shop_menu.png")

    api_log("define hair npc", npc_def )
end
