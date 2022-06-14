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

function define_items() 

    -- Define Hair Dye Items
    for i, v in pairs(Hair_Dye)do
        api_define_item({
            id = "hair_dye_".. i,
            name = string.upper(i) .. " Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/item/hair_dye_".. i ..".png")
    end

    -- Define Special Hair Dye Items
    for i, v in pairs(Special_Hair_Dye)do
        api_define_item({
            id = "hair_dye_".. i,
            name = string.upper(i) .. "'s Special Dye",
            category = "Decoration",
            tooltip = "Right click to dye your hair.",
            shop_buy = 15,
            shop_sell = 5
        }, "sprites/item/hair_dye_".. i ..".png")
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
    "sprites/npc/npc_standing.png",
    "sprites/npc/npc_standing_h.png",
    "sprites/npc/npc_walking.png",
    "sprites/npc/npc_walking_h.png",
    "sprites/npc/npc_head.png",
    "sprites/npc/npc_bust.png",
    "sprites/npc/npc_item.png",
    "sprites/npc/npc_dialogue_menu.png",
    "sprites/npc/npc_shop_menu.png"
  )

end
