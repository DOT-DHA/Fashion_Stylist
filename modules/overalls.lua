--overalls.lua
--This file defines everything for the overall items and npc's

overall_colors = {
    Jeans_Gold_Buttons = {     {215, 0, 0},     {215, 0, 0},     {245, 0, 0} } }

Overalls = {
    Jeans_Gold_Buttons	= MOD_NAME .. "_overall_Jeans_Gold_Buttons" }

Special_Overalls = {
    DOT  = MOD_NAME .. "_overall_dot" }

function define_overall_items() 

    -- Define Overall Items
    for i, v in pairs(Overalls)do
        item_def = api_define_item({ 
            id = "overall_".. i:lower(), 
            name = i:gsub("_"," ") .. " Overalls", 
            category = "Decoration", 
            tooltip = "Right click to equip overalls.", 
            shop_buy = 15, 
            shop_sell = 5 }, 
        "sprites/overall_items/overall_".. i:lower() ..".png")
        devlog("define " .. i, item_def)
    end

    -- Define Special Overall Items
    for i, v in pairs(Special_Overalls)do
        item_def = api_define_item({
            id = "overall_".. i:lower(),
            name = i:gsub("_"," ") .. " Styled Overalls",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5}, 
        "sprites/overall_items/overall_".. i:lower() ..".png")
        devlog("define " .. i, item_def)
    end

    --define Base Overall Item
    item_def = api_define_item({
        id = "overall_base",
        name = "Base Overalls",
        category = "Decoration",
        tooltip = "Right click to remove dye from your hair.",
        shop_buy = 15,
        shop_sell = 5 }, 
    "sprites/overall_items/overall_base.png")
    devlog("define base_overall", item_def)

end

-- define a new npc
function define_overall_npc()

    -- define npc
    npc_def = api_define_npc({
        id = 52,
        name = "David",
        pronouns = "He/Him",
        tooltip = "Need a new look?",
        specials = { 
            Special_Overalls["DOT"], 
            Special_Overalls["DOT"], 
            Special_Overalls["DOT"] }, -- must be at least 3
        stock = { 
           Overalls["Jeans_Gold_Buttons"],
           MOD_NAME .. "_overall_base" }, -- max 10
        greeting = "Time for a new fit?",
        dialogue = { 
            "Lets get you some new threads!", 
            "I dont get all this beekeeping stuff" },
        walking = true,
        shop = true },
    "sprites/overalls_npc/npc_standing.png",
    "sprites/overalls_npc/npc_standing_h.png",
    "sprites/overalls_npc/npc_walking.png",
    "sprites/overalls_npc/npc_walking_h.png",
    "sprites/overalls_npc/npc_head.png",
    "sprites/overalls_npc/npc_bust.png",
    "sprites/overalls_npc/npc_item.png",
    "sprites/overalls_npc/npc_dialogue_menu.png",
    "sprites/overalls_npc/npc_shop_menu.png"
    )
  
    devlog("define overall npc", npc_def)
end
