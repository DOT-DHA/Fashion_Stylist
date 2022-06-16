--hair.lua
--This file defines everything for the hair dye items and npc's

--first is base second is highlight
hair_colors = {
    Red         = {     {215, 0, 0},     {245, 0, 0} }, 
    Orange      = {   {215, 107, 0},   {245, 122, 0} }, 
    Yellow      = {   {215, 215, 0},   {245, 245, 0} }, 
    Green       = {     {0, 215, 0},     {0, 245, 0} }, 
    Teal        = {   {0, 215, 215},   {0, 245, 245} }, 
    Blue        = {   {0, 107, 215},   {0, 122, 245} }, 
    Royal_Blue  = {     {0, 0, 215},     {0, 0, 245} }, 
    Purple      = {   {107, 0, 215},   {122, 0, 245} }, 
    Pink        = {   {215, 0, 107},   {245, 0, 122} },
    Mushy       = {  {208, 126, 66},  {224, 157, 83} },
    ZooBot      = {   {0, 225, 116},   {0, 255, 132} },
    Beenus      = { {216, 143, 149}, {255, 186, 192} }
}

Hair_Dye = {
    Red         = MOD_NAME .. "_hair_dye_red",
    Orange      = MOD_NAME .. "_hair_dye_orange",
    Yellow      = MOD_NAME .. "_hair_dye_yellow",
    Green       = MOD_NAME .. "_hair_dye_green",
    Teal        = MOD_NAME .. "_hair_dye_teal",
    Blue        = MOD_NAME .. "_hair_dye_blue",
    Royal_Blue  = MOD_NAME .. "_hair_dye_royal_blue",
    Purple      = MOD_NAME .. "_hair_dye_purple",
    Pink        = MOD_NAME .. "_hair_dye_pink"
}

Special_Hair_Dye = {
    Mushy       = MOD_NAME .. "_hair_dye_mushy",
    ZooBot      = MOD_NAME .. "_hair_dye_zoobot",
    Beenus      = MOD_NAME .. "_hair_dye_beenus"
}

function define_hair_items() 
    api_log("define_hair_items", "start")

    -- Define Hair Dye Items
    for i, v in pairs(Hair_Dye)do
        test = api_define_item({
            id = "hair_dye_".. i:lower(),
            name = i:gsub("_"," ") .. " Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/hair_items/hair_dye_".. i:lower() ..".png")
        api_log("define " .. i, test)
    end

    -- Define Special Hair Dye Items
    for i, v in pairs(Special_Hair_Dye)do
        test = api_define_item({
            id = "hair_dye_".. i:lower(),
            name = i:gsub("_"," ") .. "'s Special Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/hair_items/hair_dye_".. i:lower() ..".png")
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
            Special_Hair_Dye["Mushy"],
            Special_Hair_Dye["Zoobot"],
            Special_Hair_Dye["Beenus"]
        }, -- must be atleast 3
        stock = {
            Hair_Dye["Red"],
            Hair_Dye["Orange"],
            Hair_Dye["Yellow"],
            Hair_Dye["Green"],
            Hair_Dye["Teal"],
            Hair_Dye["Blue"],
            Hair_Dye["Royal_blue"],
            Hair_Dye["Purple"],
            Hair_Dye["Pink"],
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
