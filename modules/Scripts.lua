--scripts.lua
--This file is mainly for defining commands and dev functions

local LOGS = false

function DevMode(turnOnLogs, turnOnDevMode)
    LOGS = turnOnLogs
    api_set_devmode(turnOnDevMode)
    api_log("DevMode", "developer mode is  " .. (turnOnDevMode and "on" or "off"))
    api_log("DevMode", "LOGS are " .. (turnOnLogs and "on" or "off"))
    api_define_command("/dyes","Command_Dye")
    api_define_command("/overalls","Command_Overall")
end

function Command_Dye()
    --Items, objects, and menu objects use your MOD_NAME in their oid
    --Flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid
    local amount = 10

    for Key, Value in pairs(Hair_Dye) do
        api_give_item(Value[2], amount)
        devlog("command dye normal", Value[1] .. " " .. amount)
    end

    for Key, Value in pairs(Special_Hair_Dye ) do
        api_give_item(Value[2], amount)
        devlog("command dye special", Value[1] .. " " .. amount)
    end

    api_give_item(MOD_NAME .."_hair_dye_remover", amount)
    devlog("command dye remover", "Remover " .. amount)

    api_give_item("npc51", 1)
    devlog("command overall npc", "npc51 1")

end

function Command_Overall(...)
    --Items, objects, and menu objects use your MOD_NAME in their oid
    --Flowers, bees, walls and NPCs DO NOT use your MOD_NAME in their oid

    local amount = arg[1] and arg[1] or 10

    for Key, Value in pairs(Overalls) do
        api_give_item(Value[2], amount)
        devlog("command overall normal", Value[1] .. " " .. amount)
    end

    for Key, Value in pairs(Special_Overalls) do
        api_give_item(Value[2], amount)
        devlog("command overall special", Value[1] .. " " .. amount)
    end

    api_give_item(MOD_NAME .."_overall_base", 10)
    devlog("command overall base", "Base " .. amount)

    api_give_item("npc52", 1)
    devlog("command overall npc", "npc52 1")

end

function devlog(title, text)
    --Only outputs LOGS if LOGS are turn on
    if LOGS then api_log("DevMode > " .. title,text) end
end