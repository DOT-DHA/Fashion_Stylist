--scripts.lua
--This file is mainly for defining commands

function Command_Dye(args)

  -- items, objects, and menu objects use your MOD_NAME in their oid
  for i,v in pairs(Hair_Dye)do api_give_item(v, 10) end
  for i,v in pairs(Special_Hair_Dye)do api_give_item(v, 10) end
  api_give_item(MOD_NAME .."_hair_dye_remover", 10)

  -- flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!
  api_give_item("npc51", 1)

end

function Command_Overall(args)

  -- items, objects, and menu objects use your MOD_NAME in their oid
  for i,v in pairs(Overalls)do api_give_item(v, 10) api_log("command dye", i .. " " .. v) end
  for i,v in pairs(Special_Overalls)do api_give_item(v, 10) api_log("command dye", i .. " " .. v) end
  api_give_item(MOD_NAME .."_overall_base", 10)

  -- flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!
  api_give_item("npc52", 1)

end