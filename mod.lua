--mod.lua
--This is the main file to link everything together

MOD_NAME = "fashion_stylist"

--first is light then base then dark
base_colors = {
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
        hooks = {"click", "ready", "clock", "data"},
        modules = {"hair", "overalls", "scripts"} 
    }
end


function init()
    --Turn on devmode
    --function in scripts.lua
    DevMode(false, true)

    devlog("init", "start")

    define_hair_items()
    
    define_hair_npc()

    define_overall_items()
    
    --define_overall_npc()
    
    devlog("init", "end")

    return "Success"
end

function data()


end

function ready()

    local player = api_get_player_instance()
    api_dp(player, "Hair-Dye", "none")

    local npcs = {
         local hair_npc      = {api_get_menu_objects(nil, "npc51"), "npc51"}--,
         --local overall_npc   = {api_get_menu_objects(nil, "npc52"), "npc52"} 
    }
    
    
    for i,v in pairs(npcs) do
    
        if #v[1] == 0 then
            local PlayerPos = api_get_player_position()
            api_create_obj(v[2], PlayerPos["x"] + 16, PlayerPos["y"] - 32)
        else
            -- remove duplicate NPCs
            for i=2, #v[1] do
                api_destroy_inst(v[1][i]["id"])
            end
        end

    end
    devlog("ready", "end")
end


function clock()

    local tick = not tick
    local npc = api_get_menu_objects(nil, "npc51")
    if npc then
        local shopOpen = api_gp(api_gp(npc[1]["menu_id"], "shop"), "open")
    end

    if shopOpen then
        rotate_stock("npc51", ROTATING_STOCK)
    end
    
    --devlog("clock", tick and "tick" or "tock")
end


function rotate_stock(npc_id, stock_table)
    local npc_object = api_get_menu_objects(nil, npc_id)
    local shop_id = api_gp(npc_object[1]["menu_id"], "shop")
    if hairIndex > #Hair_Dye then
        hairIndex = 1
    end
  --
  --if shop_id ~= nil then
  --  local shop_slots = api_get_slots(shop_id)
  --  local i_end = #stock_table[stock_table[1]+1]
  --  if i_end > 10 then
  --    i_end = 10
  --  end
  --  for i=1, i_end do
  --    api_slot_set(shop_slots[i+1]["id"],stock_table[stock_table[1]+1][i],0)
  --  end
  --  if i_end < 10 then
  --    for i=i_end+1, 10 do
  --      api_slot_clear(shop_slots[i+1]["id"])
  --    end
  --  end
  --
  --  if stock_table[1]+1 == #stock_table then
  --    stock_table[1] = 1
  --  else
  --    stock_table[1] = stock_table[1] + 1
  --  end
  --end
end

function click(button, click_type)
    devlog("click", "start")
    devlog(button, click_type)

    player = api_get_player_instance()
    mouse = api_get_mouse_inst()
    palette = api_gp(player, "pal")
    basePalette = api_gp(player,"palette")
    pSlots = api_get_slots(player)
    done = false

    if button == "RIGHT" and click_type == "PRESSED" then

        highlighted = api_get_highlighted("slot")

        if highlighted ~= nil then

            slot = api_get_slot_inst(highlighted)

            if api_gp(player, "Hair-Dye") == "none" then 
                -- create a notification
                api_set_notification("notice", "fashion_stylist_hair_dye_remover", "Dye Removed", "Cant remove any more dye")

            elseif api_gp(player, "Hair-Dye") ~= "none" then 

                if mouse["item"] == MOD_NAME.."_hair_dye_remover" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = base_colors[basePalette["h"]+1][1]
                    palette.h1 = base_colors[basePalette["h"]+1][2]
                    api_sp(player, "pal", palette)
                    api_sp(player,"Hair-Dye", "none")
                    api_use_item(slot["item"], 1)
                    done = true
                    -- create a notification
                    api_set_notification("notice", "fashion_stylist_hair_dye_remover", "Hair Dye Removed", "Your hair is now not dyed")
                end
            end

            if not done then

                for i, v in pairs(Hair_Dye) do

                    if api_gp(player, "Hair-Dye") == i then 
                    
                        -- create a notification
                        api_set_notification("notice", v, "Already Dyed", "Cant dye any more")

                    elseif api_gp(player, "Hair-Dye") == "none" then

                        if mouse["item"] == v then

                            if mouse["count"] > 0 then
                                api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                                api_sp(slot["id"], "item", mouse["item"])
                                api_sp(mouse["id"], "count", 0)
                                api_sp(mouse["id"], "item", "")
                            end
                            --Do something with your item here
                            palette.h1 = hair_colors[i][1]
                            palette.h2 = hair_colors[i][2]
                            api_sp(player, "pal", palette)
                            api_sp(player,"Hair-Dye", i)
                            api_slot_decr(slot["id"])
                            done = true
                            -- create a notification
                            api_set_notification("notice", v, "Hair Dyed", "Your hair is now " .. i)
                        end
                    end
                end
            end

            if not done then

                for i, v in pairs(Special_Hair_Dye) do

                    if api_gp(player, "Hair-Dye") == i then 
                    
                        -- create a notification
                        api_set_notification("notice", v, "Already Dyed", "Cant dye any more")

                    elseif api_gp(player, "Hair-Dye") ~= i then 

                        if mouse["item"] == v then

                            if mouse["count"] > 0 then
                                api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                                api_sp(mouse["id"], "count", 0)
                                api_sp(mouse["id"], "item", "")
                            end
                            --Do something with your item here
                            palette.h1 = hair_colors[i][1]
                            palette.h2 = hair_colors[i][2]
                            api_sp(player, "pal", palette)
                            api_sp(player,"Hair-Dye", i)
                            api_slot_decr(slot["item"])
                            -- create a notification
                            api_set_notification("notice", v, "Hair Dyed", "Hair dyed the " .. string.upper(i) .. " Special")
                        end
                    end
                end
            end
        end
    end

    devlog("click", "end")
end