--mod.lua
--This is the main file to link everything together

MOD_NAME = "fashion_stylist"

--first is light then base then dark
local base_colors = {
    {  {68, 100, 131},    {50, 74, 98},    {36, 55, 82} },
    {  {118, 91, 105},    {94, 73, 90},    {67, 55, 74} },
    { {149, 117, 126},  {118, 91, 105},    {94, 73, 90} },
    { {162, 134, 142}, {149, 117, 126},  {118, 91, 105} },
    {   {115, 60, 78},    {97, 50, 66},    {79, 41, 56} },
    {   {174, 94, 94},   {145, 71, 78},   {122, 53, 68} },
    {  {212, 134, 83},  {202, 118, 78},   {161, 80, 63} },
    {  {237, 184, 92},  {209, 147, 71},  {191, 120, 65} },
    { {250, 211, 112},  {237, 184, 92},  {209, 147, 71} },
    {  {93, 176, 154},  {75, 155, 142},  {55, 110, 114} },
    {  {87, 142, 154},  {66, 111, 128},   {51, 90, 112} },
    {  {69, 165, 201},  {59, 142, 186},  {46, 113, 174} },
    { {113, 186, 214},  {69, 165, 201},  {59, 142, 186} },
    { {200, 213, 218}, {166, 184, 196}, {147, 166, 183} },
    { {233, 230, 226}, {207, 204, 202}, {168, 166, 165} },
    { {247, 219, 203}, {235, 204, 186}, {227, 185, 161} },
    { {235, 204, 186}, {227, 185, 161}, {217, 163, 139} },
    { {227, 185, 161}, {217, 163, 139}, {194, 121, 103} },
    { {217, 163, 139}, {194, 131, 116},  {176, 109, 99} },
    {  {149, 108, 97},   {129, 88, 84},   {112, 73, 74} } }

function register()
    return {
        name = MOD_NAME,
        hooks = {"click", "ready", "clock"},
        modules = {"hair", "overalls", "scripts"}
    }
end


function init()
    --Turn on DevMode(logs T/F, Devmode T/F)
    --Devmode function in scripts.lua

    DevMode(false, true)

    devlog("init", "start")

    define_hair_items()

    define_hair_npc()

    define_overall_items()

    define_overall_npc()

    devlog("init", "end")

    return "Success"
end

function ready()

    local npcs = {
        {api_get_menu_objects(nil, "npc51"), "npc51"},
        {api_get_menu_objects(nil, "npc52"), "npc52"}
    }

    local player = api_get_player_instance()
    api_define_property(player, "Hair-Dye", "none")
    for Key, Value in pairs(npcs) do
        local temp = api_define_property(Value[1]["id"])
        api_define_property(temp, "s_index", 1)
    end


    for Key, Value in pairs(npcs) do

        if #Value[1] == 0 then
            local playerPos = api_get_player_position()
            api_create_obj(Value[2], playerPos["x"] + 16, playerPos["y"] - 32)
        else
            --Remove duplicate NPCs
            for i=2, #Value[1] do
                api_destroy_inst(Value[1][i]["id"])
            end
        end
    end

    devlog("ready", "end")
end

local tick = 0

function clock()

    tick = (tick % 3) + 1
    local npc = api_get_menu_objects("npc51")
    local shopOpen

    if npc then shopOpen = api_get_property(api_get_property(npc[1]["menu_id"], "shop"), "open") end

    if shopOpen then
        rotate_stock("npc51", table.insert(Hair_Dye, Hair_Dye))
    end

    devlog("clock", tick)
end

function rotate_stock(npc_id, stock_table)

    local npc_object = api_get_menu_objects(nil, npc_id)

    if npc_object then

        local index = api_get_property(npc_object[1], "s_index")
        local shop_id = api_get_property(npc_object[1]["menu_id"], "shop")

        if shop_id ~= nil then

          local shop_slots = api_get_slots(shop_id)
          local i_end = #stock_table
          i_end = i_end - (i_end//9)*9

          for i=1, i_end do
            api_slot_set(shop_slots[index]["id"],stock_table[i][2],0)
            index = index % 10 + 1
          end

          if i_end < 9 then
            for i=i_end+1, 9 do
              api_slot_clear(shop_slots[i]["id"])
            end
          end

          api_slot_set(shop_slots[10]["id"], MOD_NAME .. "_hair_dye_remover", 0)
        end
    end
end

function click(button, click_type)
    devlog("click", "start")
    devlog(button, click_type)

    local player = api_get_player_instance()
    local mouse = api_get_mouse_inst()
    local palette = api_get_property(player, "pal")
    local basePalette = api_get_property(player,"palette")
    local pSlots = api_get_slots(player)
    local done = false

    if button == "RIGHT" and click_type == "PRESSED" then
        local highlighted = api_get_highlighted("slot")

        if highlighted ~= nil then
            local slot = api_get_slot_inst(highlighted)

            if mouse["item"] == MOD_NAME.."_hair_dye_remover" then

                if api_get_property(player, "Hair-Dye") == "none" then

                    --Create a notification
                    api_set_notification("notice", "fashion_stylist_hair_dye_remover", "Dye Removed", "Cant remove any more dye")
                    done = true

                elseif api_get_property(player, "Hair-Dye") ~= "none" then

                    --Prevent halving a stack
                    if mouse["count"] > 0 then
                        api_set_property(slot["id"], "count", slot["count"] + mouse["count"])
                        api_slot_clear(mouse["id"])
                    end

                    --Dying hair and removing 1 item
                    palette.h2 = base_colors[basePalette["h"]+1][1]
                    palette.h1 = base_colors[basePalette["h"]+1][2]
                    api_set_property(player, "pal", palette)
                    api_set_property(player, "Hair-Dye", "none")
                    api_slot_decr(slot["item"])
                    done = true

                    --Create a notification
                    api_set_notification("notice", "fashion_stylist_hair_dye_remover", "Hair Dye Removed", "Your hair is now not dyed")
                end
            end

            if not done then

                for Key, Value in pairs(Hair_Dye) do

                    if mouse["item"] == Value[1] then

                        if api_get_property(player, "Hair-Dye") == Value[1] then

                            --Create a notification
                            api_set_notification("notice", Value[2], "Already Dyed", "Cant dye any more")
                            done = true

                        else

                            --Prevent halving a stack
                            if mouse["count"] > 0 then
                                api_set_property(slot["id"], "count", slot["count"] + mouse["count"])
                                api_set_property(slot["id"], "item", mouse["item"])
                                api_set_property(mouse["id"], "count", 0)
                                api_set_property(mouse["id"], "item", "")
                            end

                            --Dying hair and removing 1 item
                            palette.h1 = hair_colors[Value[1]][1]
                            palette.h2 = hair_colors[Value[1]][2]
                            api_set_property(player, "pal", palette)
                            api_set_property(player,"Hair-Dye", Value[1])
                            api_slot_decr(slot["item"])
                            done = true

                            --Create a notification
                            api_set_notification("notice", Value[2], "Hair Dyed", "Your hair is now " .. Value[1])
                        end
                    end
                end
            end

            if not done then

                for Key, Value in pairs(Special_Hair_Dye) do

                    if mouse["item"] == Value[2] then

                        if api_get_property(player, "Hair-Dye") == Value[1] then

                            --Create a notification
                            api_set_notification("notice", Value[2], "Already Dyed", "Cant dye any more")

                        else

                            --Prevent halving a stack
                            if mouse["count"] > 0 then
                                api_set_property(slot["id"], "count", slot["count"] + mouse["count"])
                                api_set_property(mouse["id"], "count", 0)
                                api_set_property(mouse["id"], "item", "")
                            end

                            --Dying hair and removing 1 item
                            palette.h1 = hair_colors[Value[1]][1]
                            palette.h2 = hair_colors[Value[1]][2]
                            api_set_property(player, "pal", palette)
                            api_set_property(player,"Hair-Dye", Value[1])
                            api_slot_decr(slot["item"])

                            --Create a notification
                            api_set_notification("notice", Value[2], "Hair Dyed", "Hair dyed the " .. Value[1] .. " Special")
                        end
                    end
                end
            end
        end
    end

    devlog("click", "end")
end