

function command_treats(args)

  -- items, objects, and menu objects use your MOD_NAME in their oid
  api_give_item(MOD_NAME .. "_hair_dye_red", args[1])

  -- flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!

end