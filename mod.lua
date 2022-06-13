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
red         = {     {215, 0, 0},     {245, 0, 0} }, 
orange      = {   {215, 107, 0},   {245, 122, 0} }, 
yellow      = {   {215, 215, 0},   {245, 245, 0} }, 
green       = {     {0, 215, 0},     {0, 245, 0} }, 
teal        = {   {0, 215, 215},   {0, 245, 245} }, 
blue        = {   {0, 107, 215},   {0, 122, 245} }, 
royal_blue  = {     {0, 0, 215},     {0, 0, 245} }, 
purple      = {   {107, 0, 215},   {122, 0, 245} }, 
pink        = {   {215, 0, 107},   {245, 0, 122} },
mushy       = {  {208, 126, 66},  {224, 157, 83} },
zoobot      = {   {0, 225, 116},   {0, 255, 132} },
beenus      = { {216, 143, 149}, {255, 186, 192} }
}


function register()
  return {
    name = MOD_NAME,
    hooks = {"click", "ready"},
    modules = {"define", "scripts"}
  }
end

function init()

    -- turn on devmode
    --api_set_devmode(true)
    
    -- log to the console
    api_log("init", "Hello World!")
    
    define_items()
    
    define_npc()

    api_define_command("/rainbow","Command_Rainbow")


    return "Success"
end

function ready()

  friend = api_get_menu_objects(nil, "npc51")

  if #friend == 0 then
    player = api_get_player_position()
    api_create_obj("npc51", player["x"] + 16, player["y"] - 32)
  end
  -- remove duplicate DOTS
  if #friend > 1 then
    for i=2, #friend do
      api_destroy_inst(friend[i]["id"])
    end
  end

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

            if mouse["item"] == MOD_NAME.."_hair_dye_red" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["red"][1]
                palette.h2 = hair_colors["red"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_orange" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["orange"][1]
                palette.h2 = hair_colors["orange"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_yellow" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["yellow"][1]
                palette.h2 = hair_colors["yellow"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_green" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["green"][1]
                palette.h2 = hair_colors["green"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_teal" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["teal"][1]
                palette.h2 = hair_colors["teal"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_blue" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["blue"][1]
                palette.h2 = hair_colors["blue"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_royal_blue" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["royal_blue"][1]
                palette.h2 = hair_colors["royal_blue"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_purple" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["purple"][1]
                palette.h2 = hair_colors["purple"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_pink" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["pink"][1]
                palette.h2 = hair_colors["pink"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_remover" then

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

            elseif mouse["item"] == MOD_NAME.."_hair_dye_mushy" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["mushy"][1]
                palette.h2 = hair_colors["mushy"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_zoobot" then

                if mouse["count"] > 0 then
                    api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                palette.h1 = hair_colors["zoobot"][1]
                palette.h2 = hair_colors["zoobot"][2]
                api_sp(player, "pal", palette)
                api_use_item(slot["item"], 1)

            elseif mouse["item"] == MOD_NAME.."_hair_dye_beenus" then

                    if mouse["count"] > 0 then
                        api_sp(slot["id"], "count", slot["count"] + mouse["count"])
                        api_sp(mouse["id"], "count", 0)
                        api_sp(mouse["id"], "item", "")
                    end
                    --Do something with your item here
                    palette.h1 = hair_colors["beenus"][1]
                    palette.h2 = hair_colors["beenus"][2]
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)
            end
        end
    end
end