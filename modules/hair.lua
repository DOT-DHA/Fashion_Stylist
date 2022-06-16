--hair.lua
--This file defines everything for the hair dye items and npc's

--first is base second is highlight
hair_colors = {
  Red        = {     {215, 0, 0},     {245, 0, 0} }, 
  Orange     = {   {215, 107, 0},   {245, 122, 0} }, 
  Yellow     = {   {215, 215, 0},   {245, 245, 0} }, 
  Green      = {     {0, 215, 0},     {0, 245, 0} }, 
  Teal       = {   {0, 215, 215},   {0, 245, 245} }, 
  Blue       = {   {0, 107, 215},   {0, 122, 245} }, 
  Royal_Blue = {     {0, 0, 215},     {0, 0, 245} }, 
  Purple     = {   {107, 0, 215},   {122, 0, 245} }, 
  Pink       = {   {215, 0, 107},   {245, 0, 122} },
  Mushy      = {  {208, 126, 66},  {224, 157, 83} },
  ZooBot     = {   {0, 225, 116},   {0, 255, 132} },
  Beenus     = { {216, 143, 149}, {255, 186, 192} } }

Hair_Dye = {
    {"Red",        MOD_NAME .. "_hair_dye_red"},
    {"Orange",     MOD_NAME .. "_hair_dye_orange"},
    {"Yellow",     MOD_NAME .. "_hair_dye_yellow"},
    {"Green",      MOD_NAME .. "_hair_dye_green"},
    {"Teal",       MOD_NAME .. "_hair_dye_teal"},
    {"Blue",       MOD_NAME .. "_hair_dye_blue"},
    {"Royal_Blue", MOD_NAME .. "_hair_dye_royal_blue"},
    {"Purple",     MOD_NAME .. "_hair_dye_purple"},
    {"Pink",       MOD_NAME .. "_hair_dye_pink"} }

Special_Hair_Dye = {
    {"Mushy",  MOD_NAME .. "_hair_dye_mushy"},
    {"ZooBot", MOD_NAME .. "_hair_dye_zoobot"},
    {"Beenus", MOD_NAME .. "_hair_dye_beenus"} }

function define_hair_items() 
    devlog("define_hair_items", "start")

    -- Define Hair Dye Items
    for i, v in pairs(Hair_Dye)do
        item_def = api_define_item({
            id = "hair_dye_".. v[1]:lower(),
            name = v[1]:gsub("_"," ") .. " Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5 }, 
        "sprites/hair_items/hair_dye_".. v[1]:lower() ..".png")
        devlog("define " .. v[2], item_def)
    end

    -- Define Special Hair Dye Items
    for i, v in pairs(Special_Hair_Dye)do
        item_def = api_define_item({
            id = "hair_dye_".. v[1]:lower(),
            name = v[1]:gsub("_"," ") .. "'s Special Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5 }, 
        "sprites/hair_items/hair_dye_".. v[1]:lower() ..".png")
        devlog("define " .. v[2], item_def)
    end

    --define dye remover item
    item_def = api_define_item({
        id = "hair_dye_remover",
        name = "Dye Remover",
        category = "Decoration",
        tooltip = "Right click to remove dye from your hair.",
        shop_buy = 15,
        shop_sell = 5 }, 
    "sprites/hair_items/hair_dye_remover.png")
    devlog("define Dye Remover", item_def)

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
            Special_Hair_Dye[1][2],
            Special_Hair_Dye[2][2],
            Special_Hair_Dye[3][2] }, -- must be atleast 3
        stock = {
            Hair_Dye[1][2],
            Hair_Dye[2][2],
            Hair_Dye[3][2],
            Hair_Dye[4][2],
            Hair_Dye[5][2],
            Hair_Dye[6][2],
            Hair_Dye[7][2],
            Hair_Dye[8][2],
            Hair_Dye[9][2],
            MOD_NAME .. "_hair_dye_remover" }, -- max 10
        greeting = "Howdy!",
        dialogue = {
          "Im starting a new life here in APICO",
          "The weather is something to get used to, huh?" },
        walking = true,
        shop = true },
    "sprites/hair_npc/standing.png",
    "sprites/hair_npc/standing_h.png",
    "sprites/hair_npc/walking.png",
    "sprites/hair_npc/walking_h.png",
    "sprites/hair_npc/head.png",
    "sprites/hair_npc/bust.png",
    "sprites/hair_npc/item.png",
    "sprites/hair_npc/dialogue_menu.png",
    "sprites/hair_npc/shop_menu.png")

    devlog("define hair npc", npc_def)
end
