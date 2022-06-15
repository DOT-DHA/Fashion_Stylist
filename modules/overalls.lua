Overalls = {
    Jeans_Gold_Buttons	= MOD_NAME .. "_overall_JGB"
}

Special_Overalls = {
    DOT  = MOD_NAME .. "_overall_DOT"
}
function define_items() 

    -- Define Hair Dye Items
    for i, v in pairs(Overalls)do
        api_define_item({
            id = "overall_".. i,
            name = i:gsub("_", " "),
            category = "Decoration",
            tooltip = "Right click to put on overalls.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/overall_items/overall_".. i ..".png")
    end

    -- Define Hair Dye Items
    for i, v in pairs(Overalls)do
        api_define_item({
            id = "overall_".. i,
            name = i:gsub("_", " ").. "'s Special Dye",
            category = "Decoration",
            tooltip = "Right click to put on overalls.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/overall_items/overall_".. i ..".png")
    end

    --define dye remover item
    api_define_item({
      id = "hair_dye_remover",
      name = "Dye Remover",
      category = "Decoration",
      tooltip = "Right click to remove dye from your hair.",
      shop_buy = 15,
      shop_sell = 5
    }, "sprites/item/hair_dye_remover.png")

end

-- define a new npc
function define_npc()

  --set npc definition
  npc_def = {
    id = 51,
    name = "DOT",
    pronouns = "He/Him",
    tooltip = "Need a new look?",
    specials = {
        MOD_NAME .. "_hair_dye_mushy",
        MOD_NAME .. "_hair_dye_zoobot",
        MOD_NAME .. "_hair_dye_beenus"
    }, -- must be atleast 3
    stock = {
        MOD_NAME .. "_hair_dye_red",
        MOD_NAME .. "_hair_dye_orange",
        MOD_NAME .. "_hair_dye_yellow",
        MOD_NAME .. "_hair_dye_green",
        MOD_NAME .. "_hair_dye_teal",
        MOD_NAME .. "_hair_dye_blue",
        MOD_NAME .. "_hair_dye_royal_blue",
        MOD_NAME .. "_hair_dye_purple",
        MOD_NAME .. "_hair_dye_pink",
        MOD_NAME .. "_hair_dye_remover"
    }, -- max 10
    greeting = "Howdy!",
    dialogue = {
      "Im starting a new life here in APICO",
      "The weather is something to get used to, huh?"
    },
    walking = true,
    shop = true
  }

  -- define npc
  api_define_npc(npc_def,
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

end
