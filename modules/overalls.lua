--overalls.lua
--This file defines everything for the overall items and npc's

overall_colors = {
    Jeans_Gold_Buttons = {     {215, 0, 0},     {215, 0, 0},     {245, 0, 0} }

Overalls = {
    Jeans_Gold_Buttons	= MOD_NAME .. "_overall_Jeans_Gold_Buttons"

Special_Overalls = {
    DOT  = MOD_NAME .. "_overall_DOT"
}

function define_overall_items() 

    -- Define Overall Items
    for i, v in pairs(Overalls)do
        test = api_define_item({
            id = "overall_".. i:lower(),
            name = i:sub("_"," ") .. " Overalls",
            category = "Decoration",
            tooltip = "Right click to equip overalls.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/overall_items/overall_".. i:lower() ..".png")
        api_log("define " .. i, test)
    end

    -- Define Special Overall Items
    for i, v in pairs(Special_Overalls)do
        test = api_define_item({
            id = "overall_".. i,
            name = i:upper() .. " Styled Overalls",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/overall_items/overall_".. i:lower() ..".png")
        api_log("define " .. i, test)
    end

    --define Base Overall Item
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
function define_overall_npc()

  -- define npc
  npc_def = api_define_npc({
        id = 52,
        name = "Neshift",
        pronouns = "She/Her",
        tooltip = "Need a new look?",
        specials = { 
            Special_Overalls["DOT"], 
            Special_Overalls["DOT"], 
            Special_Overalls["DOT"]
        }, -- must be at least 3
        stock = { 
           Overalls["Jeans_Gold_Buttons" ]
           MOD_NAME .. "_overall_base"
        }, -- max 10
        greeting = "Time for a new fit?",
        dialogue = { 
            "Lets get you some new threads!", 
            "I dont get all this beekeeping stuff" 
        },
        walking = true,
        shop = true
        },
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
  
  api_log("define overall npc", npc_def )
end
