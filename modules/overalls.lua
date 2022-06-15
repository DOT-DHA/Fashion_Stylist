--overalls.lua
--This file defines everything for the overall items and npc's

overall_colors = {
    Jeans_Gold_Buttons = {     {215, 0, 0},     {215, 0, 0},     {245, 0, 0} }
teal        = MOD_NAME .. "_hair_dye_teal",
blue        = MOD_NAME .. "_hair_dye_blue",
Overalls = {
    Jeans_Gold_Buttons	= MOD_NAME .. "_overall_Jeans_Gold_Buttons"

Special_Hair_Dye = {
Special_Overalls = {
    DOT  = MOD_NAME .. "_overall_DOT"
}

function define_overall_items() 

    -- Define Overall Items
    for i, v in pairs(Overalls)do
        api_log("test", i .. " " .. v)
        test = api_define_item({
            id = "overall_".. string.lower(i),
            name = i:gsub("_", " "),
    -- Define Hair Dye Items
            tooltip = "Right click to equip overalls.",
        api_define_item({
            id = "hair_dye_".. i,
        }, "sprites/overall_items/overall_".. string.lower(i) ..".png")
        api_log("define " .. i, test)
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
    -- Define Special Overall Items
    for i, v in pairs(Special_Overalls)do
        test = api_define_item({
            id = "overall_".. string.lower(i),
            name = i .. " styled overalls",
    -- Define Special Hair Dye Items
            tooltip = "Right click to equip overalls.",
        api_define_item({
            id = "hair_dye_".. i,
        }, "sprites/overall_items/overall_".. string.lower(i) ..".png")
        api_log("define " .. i, test)
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/item/hair_dye_".. i ..".png")
    end

    --define dye remover item
    test = api_define_item({
      id = "overall_base",
      name = "Base Overalls",
      category = "Decoration",
      tooltip = "Right click to equip base overalls.",
      shop_buy = 15,
      shop_sell = 5
    }, "sprites/overall_items/overall_base.png")
    api_log("define overall_base", test)


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
