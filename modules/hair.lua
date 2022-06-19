--hair.lua
--This file defines everything for the hair dye items and NPC's

hairIndex = 1

--first is base second is highlight
hair_colors = {
  Red        = {     {215, 0, 0},     {245, 0, 0} }, 
  Orange     = {   {215, 107, 0},   {245, 122, 0} }, 
  Yellow     = {   {215, 215, 0},   {245, 245, 0} }, 
  Green      = {     {0, 215, 0},     {0, 245, 0} }, 
  Turqoise   = {   {0, 215, 215},   {0, 245, 245} }, 
  Blue       = {   {0, 107, 215},   {0, 122, 245} }, 
  Royal_Blue = {     {0, 0, 215},     {0, 0, 245} }, 
  Purple     = {   {107, 0, 215},   {122, 0, 245} }, 
  Pink       = {   {215, 0, 107},   {245, 0, 122} },
  Mushy      = {  {208, 126, 66},  {224, 157, 83} },
  ZooBot     = {   {0, 225, 116},   {0, 255, 132} },
  Beenus     = { {216, 143, 149}, {255, 186, 192} } }

Hair_Dye = {
    {"Red",         MOD_NAME .. "_hair_dye_red"},
    {"Orange",      MOD_NAME .. "_hair_dye_orange"},
    {"Yellow",      MOD_NAME .. "_hair_dye_yellow"},
    {"Green",       MOD_NAME .. "_hair_dye_green"},
    {"Turqoise ",   MOD_NAME .. "_hair_dye_turqoise"},
    {"Blue",        MOD_NAME .. "_hair_dye_blue"},
    {"Royal_Blue",  MOD_NAME .. "_hair_dye_royal_blue"},
    {"Purple",      MOD_NAME .. "_hair_dye_purple"},
    {"Pink",        MOD_NAME .. "_hair_dye_pink"} }

Special_Hair_Dye = {
    {"Mushy",       MOD_NAME .. "_hair_dye_mushy"},
    {"ZooBot",      MOD_NAME .. "_hair_dye_zoobot"},
    {"Beenus",      MOD_NAME .. "_hair_dye_beenus"} }

hair_recipes = {
    {"t1", Hair_Dye[1][2],                  { {"sawdust1", 5},  {"dye1", 10}                } },
    {"t1", Hair_Dye[2][2],                  { {"sawdust1", 5},  {"dye5", 10}                } },
    {"t1", Hair_Dye[3][2],                  { {"sawdust1", 5},  {"dye3", 10}                } },
    {"t1", Hair_Dye[4][2],                  { {"sawdust1", 5},  {"dye4", 10}                } },
    {"t1", Hair_Dye[5][2],                  { {"sawdust1", 5}, {"dye13", 10}                } },
    {"t1", Hair_Dye[6][2],                  { {"sawdust1", 5},  {"dye2", 10}                } },
    {"t1", Hair_Dye[7][2],                  { {"sawdust1", 5},  {"dye2",  7},  {"dye7",  3} } },
    {"t1", Hair_Dye[8][2],                  { {"sawdust1", 5},  {"dye6", 10}                } },
    {"t1", Hair_Dye[9][2],                  { {"sawdust1", 5}, {"dye15", 10}                } },
    {"t1", Special_Hair_Dye[1][2],          { {"sawdust1", 5},  {"dye5", 10}, {"dye12", 12} } },
    {"t1", Special_Hair_Dye[2][2],          { {"sawdust1", 5}, {"dye14",  7},  {"dye7",  3} } },
    {"t1", Special_Hair_Dye[3][2],          { {"sawdust1", 5}, {"dye15",  7},  {"dye8",  3} } },
    {"t1", MOD_NAME .. "_hair_dye_remover", { {"sawdust1", 5},  {"dye9", 10}                } } }

--Defining all hair items
function define_hair_items()
    devlog("define_hair_items", "start")

    --Defining workbench for crafting
    local workbench_def = api_define_workbench(
        "Fashion Stylist", { 
            t1 = "Hair Dye", 
            t2 = "Overalls(Coming Soon)", 
            t3 = "(Unknown)", 
            t4 = "(Unknown)", 
            t5 = "(Unknown)" } )

    devlog("Workbench", workbench_def)

    --Defining normal hair items
    for Key, Value in pairs(Hair_Dye) do
        local item_def = api_define_item({
            id = "hair_dye_".. Value[1]:lower(),
            name = Value[1]:gsub("_"," ") .. " Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5 }, 
        "sprites/hair_items/hair_dye_".. Value[1]:lower() ..".png")

        devlog(Value[1], item_def)
    end

    --Defining special hair items
    for Key, Value in pairs(Special_Hair_Dye) do
        local item_def = api_define_item({
            id = "hair_dye_".. Value[1]:lower(),
            name = Value[1]:gsub("_"," ") .. "'s Special Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5 }, 
        "sprites/hair_items/hair_dye_".. Value[1]:lower() ..".png")

        devlog(Value[1], item_def)
    end

    --Defining dye remover item
    local item_def = api_define_item({
        id        = "hair_dye_remover",
        name      = "Dye Remover",
        category  = "Decoration",
        tooltip   = "Right click to remove dye from your hair.",
        shop_buy  = 15,
        shop_sell = 5 }, 
    "sprites/hair_items/hair_dye_remover.png")

    devlog("Dye Remover", item_def)

    --Defining all dye recipies
    for Key, Value in pairs(hair_recipes) do
        local res_def = api_define_recipe( 
            Value[1],
            Value[2],
            Value[3] )

        devlog("Dye recipe" .. Value[2], res_def)
    end
end

--Defining hair NPC
function define_hair_npc()

    --NPC definition
    local NPC_def = api_define_npc({
        id = 51,
        name = "DOT",
        pronouns = "He/Him",
        tooltip = "Need a new look?",
        --Must be a table of at least 3 items
        specials = {
            Special_Hair_Dye[1][2],
            Special_Hair_Dye[2][2],
            Special_Hair_Dye[3][2] },
        --Max table size of 10
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
            MOD_NAME .. "_hair_dye_remover" },
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

    devlog("Defining hair NPC", NPC_def)
end
