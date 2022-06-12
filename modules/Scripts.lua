

function Command_Rainbow(args)

  -- items, objects, and menu objects use your MOD_NAME in their oid
  api_give_item(MOD_NAME .. "_hair_dye_red", 10)
  api_give_item(MOD_NAME .. "_hair_dye_red", 10)
  api_give_item(MOD_NAME .. "_hair_dye_orange", 10)
  api_give_item(MOD_NAME .. "_hair_dye_yellow", 10)
  api_give_item(MOD_NAME .. "_hair_dye_green", 10)
  api_give_item(MOD_NAME .. "_hair_dye_teal", 10)
  api_give_item(MOD_NAME .. "_hair_dye_blue", 10)
  api_give_item(MOD_NAME .. "_hair_dye_royal_blue", 10)
  api_give_item(MOD_NAME .. "_hair_dye_purple", 10)
  api_give_item(MOD_NAME .. "_hair_dye_pink", 10)
  api_give_item(MOD_NAME .. "_hair_dye_remover", 10)
  api_give_item(MOD_NAME .. "_hair_dye_mushy", 10)
  api_give_item(MOD_NAME .. "_hair_dye_zoobot", 10)
  api_give_item(MOD_NAME .. "_hair_dye_beenus", 10)

  -- flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!
  
  api_give_item("npc51", 1)
end