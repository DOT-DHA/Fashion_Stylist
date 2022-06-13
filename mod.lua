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
{  {149, 108, 97},   {129, 88, 84},   {112, 73, 74} }
}

--first is base second is highlight
hair_colors = {
{      {215, 0,0},     {245, 0, 0} }, 
{  {118, 91, 105},    {94, 73, 90} }, 
{ {149, 117, 126},  {118, 91, 105} }, 
{ {162, 134, 142}, {149, 117, 126} }, 
{   {115, 60, 78},    {97, 50, 66} }, 
{   {174, 94, 94},   {145, 71, 78} }, 
{  {212, 134, 83},  {202, 118, 78} }, 
{  {237, 184, 92},  {209, 147, 71} }, 
{ {250, 211, 112},  {237, 184, 92} }, 
{  {93, 176, 154},  {75, 155, 142} }, 
{  {87, 142, 154},  {66, 111, 128} }, 
{  {69, 165, 201},  {59, 142, 186} }, 
{ {113, 186, 214},  {69, 165, 201} }, 
{ {200, 213, 218}, {166, 184, 196} }, 
{ {233, 230, 226}, {207, 204, 202} }, 
{ {247, 219, 203}, {235, 204, 186} }, 
{ {235, 204, 186}, {227, 185, 161} }, 
{ {227, 185, 161}, {217, 163, 139} }, 
{ {217, 163, 139}, {194, 131, 116} }, 
{  {149, 108, 97},   {129, 88, 84} }
}

function register()
  return {
    name = MOD_NAME,
    hooks = {"ready", "click"},
    modules = {"define", "scripts"}
  }
end

function init()

    -- turn on devmode
    api_set_devmode(true)
    
    -- log to the console
    api_log("init", "Hello World!")
    
    define_items()
    
    define_npc()

    api_define_command("/rainbow","Command_Rainbow")

    api_log("base_colors > init", base_colors)


  return "Success"

end

function ready()
        
end

function click(button, click_type)
    player = api_get_player_instance()
    mouse = api_get_mouse_inst()
    palette = api_gp(player, "pal")
    basePalette = api_gp(player,"palette")
    pSlots = api_get_slots(player)


    if button == "RIGHT" and click_type == "PRESSED" then

        highlighted = api_get_highlighted("slot")

        if highlighted ~= nil then

            slot = api_get_slot_inst(highlighted)
            
            isOwned = false
            
            for i, v in pairs(pSlots) do 
                if slot["id"] == v["id"] then 
                    isOwned = true 
                end
            end

            if isOwned then

                if slot["item"] == MOD_NAME.."_hair_dye_red" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h1 = hair_colors[1][1]
                    palette.h2 = hair_colors[1][2]
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_orange" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {245, 122, 0}
                    palette.h1 = {215, 107, 0}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_yellow" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {245, 245, 0}
                    palette.h1 = {215, 215, 0}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_green" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {0, 245, 0}
                    palette.h1 = {0, 215, 0}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_teal" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {0, 245, 245}
                    palette.h1 = {0, 215, 215}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_blue" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {0, 122, 245}
                    palette.h1 = {0, 107, 215}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_royal_blue" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {0, 0, 245}
                    palette.h1 = {0, 0, 215}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_purple" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {122, 0, 245}
                    palette.h1 = {107, 0, 215}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_pink" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {245, 0, 122}
                    palette.h1 = {215, 0, 107}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_remover" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = base_colors[basePalette["h"]][1]
                    palette.h1 = base_colors[basePalette["h"]][2]
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_mushy" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {224,157,83}
                    palette.h1 = {208,126,66}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_zoobot" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {0, 255, 132}
                    palette.h1 = {0, 225, 116}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)

                elseif slot["item"] == MOD_NAME.."_hair_dye_beenus" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h2 = {255, 186, 192}
                    palette.h1 = {216, 143, 149}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)
                end
            end
        end
    end
end