--overalls.lua
--This file defines everything for the overall items and NPC's

--Refactor i,v

overallIndex = 1

overallIndex = 1

overall_colors = {
    Jeans_Gold_Buttons  = {  {212, 175, 55},  {66, 111, 128},   {51, 90, 112} },
    DOT                 = {   {154, 83, 54},   {42, 67, 122},     {9, 14, 26} } }

Overalls = {
    Jeans_Gold_Buttons	= MOD_NAME .. "_overall_jeans_gold_buttons" }

Special_Overalls = {
    DOT  = MOD_NAME .. "_overall_dot" }


--Defining all overall items
function define_overall_items() 
    devlog("define_overall_items", "start")

    --Defining normal overall items
    for i, v in pairs(Overalls) do
        local item_def = api_define_item({ 
            id = "overall_".. i:lower(), 
            name = i:gsub("_"," ") .. " Overalls", 
            category = "Decoration", 
            tooltip = "Right click to equip overalls.", 
            shop_buy = 15, 
            shop_sell = 5 }, 
        "sprites/overall_items/overall_".. i:lower() ..".png")

        devlog("define " .. i, item_def)
    end
    
    --Defining special overall items
    for i, v in pairs(Special_Overalls) do
        local item_def = api_define_item({
            id = "overall_".. i:lower(),
            name = i:gsub("_"," ") .. " Styled Overalls",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5}, 
        "sprites/overall_items/overall_".. i:lower() ..".png")

        devlog("define " .. i, item_def)
    end
    
    --Defining base overall item
    local item_def = api_define_item({
        id = "overall_base",
        name = "Base Overalls",
        category = "Decoration",
        tooltip = "Right click to remove dye from your hair.",
        shop_buy = 15,
        shop_sell = 5 }, 
    "sprites/overall_items/overall_base.png")

    devlog("define overall_base", item_def)
end

--Defining overall NPC
function define_overall_npc()

    --NPC definition
    local NPC_def = api_define_npc({
        id = 52,
        name = "David",
        pronouns = "He/Him",
        tooltip = "Need a new look?",
        --Must be a table of at least 3 items
        specials = { 
            Special_Overalls["DOT"], 
            Special_Overalls["DOT"], 
            Special_Overalls["DOT"] },
        --Max table size of 10
        stock = { 
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           Overalls["Jeans_Gold_Buttons"],
           MOD_NAME .. "_overall_base" }, 
        greeting = "Time for a new fit?",
        dialogue = { 
            "Lets get you some new threads!", 
            "I dont get all this beekeeping stuff" },
        walking = true,
        shop = true },
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
