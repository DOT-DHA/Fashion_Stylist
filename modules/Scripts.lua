--scripts.lua
--This file is mainly for defining commands

function DevMode(input)
    api_set_devmode(input)
    api_define_command("/dyes","Command_Dye")
    api_define_command("/overalls","Command_Overall")
end

function Command_Dye(...)

  -- items, objects, and menu objects use your MOD_NAME in their oid
    for i,v in pairs(Hair_Dye)
        do api_give_item(v, 10) 
        api_log("command dye normal", i .. " " .. v) 
    end

    for i,v in pairs(Special_Hair_Dye)do 
        api_give_item(v, 10) 
        api_log("command dye special", i .. " " .. v) 
    end

    api_give_item(MOD_NAME .."_hair_dye_remover", 10)
    api_log("command dye remover", Remover .. " " .. MOD_NAME .."_hair_dye_remover")

    -- flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!
    api_give_item("npc51", 1)

end

function Command_Overall(...)

    -- items, objects, and menu objects use your MOD_NAME in their oid
    for i,v in pairs(Overalls)do 
        api_give_item(v, 10) 
        api_log("command overall normal", i .. " " .. v) 
    end

    for i,v in pairs(Special_Overalls)do 
        api_give_item(v, 10) 
        api_log("command overall special", i .. " " .. v) 
    end

    api_give_item(MOD_NAME .."_overall_base", 10)
    api_log("command overall base", Base .. " " .. MOD_NAME .."_overall_base")

    -- flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!
    api_give_item("npc52", 1)

end