

function define_items()

  -- define custom items
  api_define_item({
    id = "hair_dye_red",
    name = "Red Box Dye",
    category = "Decoration",
    tooltip = "Right click to dye your hair.",
    shop_buy = 15,
    shop_sell = 5
  }, "sprites/item/axe_item.png")

  -- add the item to the workbench as a recipe
  recipe = {
    { item = "dye1", amount = 10 },
    { item = "sawdust1", amount = 5 }
  }
  res = api_define_recipe("painting", MOD_NAME .. "_hair_dye_red", recipe)

end

-- define a new npc
function define_npc()

  --set npc definition
  npc_def = {
    id = 51,
    name = "Cathy",
    pronouns = "She/Her",
    tooltip = "Need a new look?",
    shop = true,
    walking = true,
    stock = {MOD_NAME .. "_hair_dye_red"}, -- max 10
    specials = {"log", "log", "log"}, -- must be 3
    dialogue = {
      "Wot ya mean av I gots anything other than logs to sell??",
      "Wot a stoopid question hoomie"
    },
    greeting = "Alright pal ow ya gettin' on"
  }

  -- define npc
  api_define_npc(npc_def,
    "sprites/npc_standing.png",
    "sprites/npc_standing_h.png",
    "sprites/npc_walking.png",
    "sprites/npc_walking_h.png",
    "sprites/npc_head.png",
    "sprites/npc_bust.png",
    "sprites/npc_item.png",
    "sprites/npc_dialogue_menu.png",
    "sprites/npc_shop_menu.png"
  )

end