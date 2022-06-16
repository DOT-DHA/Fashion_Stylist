--scripts.lua
--This file is mainly for defining commands and dev functions

logs = false

function DevMode(turnOnLogs, turnOnDevMode)
    logs = turnOnLogs
    api_set_devmode(turnOnDevMode)
    api_log("DevMode", "developer mode is  " .. (turnOnDevMode and "on" or "off"))
    api_log("DevMode", "logs are " .. (turnOnLogs and "on" or "off"))
    api_define_command("/dyes","Command_Dye")
    api_define_command("/overalls","Command_Overall")
end

function Command_Dye(...)

  --Items, objects, and menu objects use your MOD_NAME in their oid
    for i,v in pairs(Hair_Dye) do
        api_give_item(v[2], 10) 
        devlog("command dye normal", i .. " " .. v[2])
    end

    for i,v in pairs(Special_Hair_Dye ) do 
        api_give_item(v[2], 10) 
        devlog("command dye special", i .. " " .. v[2])
    end

    api_give_item(MOD_NAME .."_hair_dye_remover", 10)
    devlog("command dye remover", Remover .. " " .. MOD_NAME .."_hair_dye_remover")

    --Flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!
    api_give_item("npc51", 1)

end

function Command_Overall(...)

    --Items, objects, and menu objects use your MOD_NAME in their oid
    for i,v in pairs(Overalls) do 
        api_give_item(v, 10) 
        devlog("command overall normal", i .. " " .. v)
    end

    for i,v in pairs(Special_Overalls) do 
        api_give_item(v, 10) 
        devlog("command overall special", i .. " " .. v)
    end

    api_give_item(MOD_NAME .."_overall_base", 10)
    devlog("command overall base", "Base " .. MOD_NAME .."_overall_base")

    --Flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid!
    api_give_item("npc52", 1)
    devlog("command overall npc", "Base " .. MOD_NAME .."_overall_base")

end

function devlog(title, text)
    --Only outputs logs if logs are turn on
    if logs then api_log("DevMode > " .. title,text) end
end