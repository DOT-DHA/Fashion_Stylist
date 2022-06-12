

function define_items()

  -- define custom items
  api_define_item({
    id = "hair_dye_red",
    name = "Red Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_red.png")

  api_define_item({
    id = "hair_dye_orange",
    name = "Orange Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_orange.png")

  api_define_item({
    id = "hair_dye_yellow",
    name = "Yellow Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_yellow.png")
  
  api_define_item({
    id = "hair_dye_green",
    name = "Green Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_green.png")

  api_define_item({
    id = "hair_dye_teal",
    name = "Teal Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_teal.png")

  api_define_item({
    id = "hair_dye_blue",
    name = "Blue Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_blue.png")

  api_define_item({
    id = "hair_dye_royal_blue",
    name = "Royal Blue Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_royal_blue.png")

  api_define_item({
    id = "hair_dye_purple",
    name = "Purple Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_purple.png")

  api_define_item({
    id = "hair_dye_pink",
    name = "Pink Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_pink.png")

  api_define_item({
    id = "hair_dye_remover",
    name = "Dye Remover",
    category = "Decoration",
    tooltip = "Right click to remove dye from your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_remover.png")

  api_define_item({
    id = "hair_dye_mushy",
    name = "Mushy's Special Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/hair_dye_mushy.png")

  -- add the item to the workbench as a recipe
  recipe = {
    { item = "dye1", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_red", recipe)

  recipe = {
    { item = "dye5", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_orange", recipe)

  recipe = {
    { item = "dye3", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_yellow", recipe)

  recipe = {
    { item = "dye4", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_green", recipe)

  recipe = {
    { item = "dye2", amount = 7 },
    { item = "dye8", amount = 3 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_teal", recipe)

  recipe = {
    { item = "dye2", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_blue", recipe)

  recipe = {
    { item = "dye2", amount = 7 },
    { item = "dye7", amount = 3 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_royal_blue", recipe)

  recipe = {
    { item = "dye6", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_purple", recipe)

  recipe = {
    { item = "dye1", amount = 7 },
    { item = "dye8", amount = 3 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_pink", recipe)

  recipe = {
    { item = "dye9", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_remover", recipe)

end

-- define a new npc
function define_npc()

  --set npc definition
  npc_def = {
    id = 51,
    name = "Cathy",
    pronouns = "She/Her",
    tooltip = "Need a new look?",
    specials = {
        MOD_NAME .. "_hair_dye_mushy",
        MOD_NAME .. "_hair_dye_mushy",
        MOD_NAME .. "_hair_dye_mushy"
    }, -- must be 3
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
    greeting = "Greeting",
    dialogue = {
      "Dialogue 1",
      "Dialogue 2"
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