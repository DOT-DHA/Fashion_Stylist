--overalls.lua
--This file defines everything for the overall items and NPC's

overallIndex = 1

overall_colors = {
    Jeans_Gold_Buttons  = {  {212, 175, 55},  {66, 111, 128},   {51, 90, 112} },
    DOT                 = {   {154, 83, 54},   {42, 67, 122},     {9, 14, 26} } }

Overalls = {
    {"Jeans_Gold_Buttons",  MOD_NAME .. "_overall_jeans_gold_buttons"} }

Special_Overalls = {
    {"DOT",                 MOD_NAME .. "_overall_dot"} }


--Defining all overall items
function define_overall_items() 
    devlog("define_overall_items", "start")

    --Defining normal overall items
    for Key, Value in pairs(Overalls) do
        local item_def = api_define_item({ 
            local id        = "overall_".. Value[1]:lower(), 
            local name      = Value[1]:gsub("_"," ") .. " Overalls", 
            local category  = "Decoration", 
            local tooltip   = "Right click to equip overalls.", 
            local shop_buy  = 15, 
            local shop_sell = 5 }, 
        "sprites/overall_items/overall_".. Value[1]:lower() ..".png")

        devlog("define " .. Value[1], item_def)
    end
    
    --Defining special overall items
    for Key, Value in pairs(Special_Overalls) do
        local item_def = api_define_item({
            local id        = "overall_".. Value[1]:lower(),
            local name      = Value[1]:gsub("_"," ") .. " Styled Overalls",
            local category  = "Decoration",
            local tooltip   = "Right click to dye your hair.",
            local shop_buy  = 15,
            local shop_sell = 5}, 
        "sprites/overall_items/overall_".. Value[1]:lower() ..".png")

        devlog("define " .. Value[1], item_def)
    end
    
    --Defining base overall item
    local item_def = api_define_item({
        local id        = "overall_base",
        local name      = "Base Overalls",
        local category  = "Decoration",
        local tooltip   = "Right click to remove dye from your hair.",
        local shop_buy  = 15,
        local shop_sell = 5 }, 
    "sprites/overall_items/overall_base.png")

    devlog("define overall_base", item_def)
end

--Defining overall NPC
function define_overall_npc()

    --NPC definition
    local NPC_def = api_define_npc({
        local id       = 52,
        local name     = "David",
        local pronouns = "He/Him",
        local tooltip  = "Need a new look?",
        --Must be a table of at least 3 items
        local specials = { 
            Special_Overalls[1][2], 
            Special_Overalls[1][2], 
            Special_Overalls[1][2] },
        --Max table size of 10
        local stock    = { 
           Overalls[1][2],
           Overalls[1][2],
           Overalls[1][2],
           Overalls[1][2],
           Overalls[1][2],
           Overalls[1][2],
           Overalls[1][2],
           Overalls[1][2],
           Overalls[1][2],
           MOD_NAME .. "_overall_base" }, 
        local greeting = "Time for a new fit?",
        local dialogue = { 
            "Lets get you some new threads!", 
            "I dont get all this beekeeping stuff" },
        local walking  = true,
        local shop     = true },
    "sprites/overall_npc/standing.png",
    "sprites/overall_npc/standing_h.png",
    "sprites/overall_npc/walking.png",
    "sprites/overall_npc/walking_h.png",
    "sprites/overall_npc/head.png",
    "sprites/overall_npc/bust.png",
    "sprites/overall_npc/item.png",
    "sprites/overall_npc/dialogue_menu.png",
    "sprites/overall_npc/shop_menu.png")
  
    devlog("Defining overall NPC", NPC_def)
end
