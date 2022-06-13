MOD_NAME = "fashion_stylist"

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


  return "Success"

end

function ready()

    player = api_get_player_instance()
    palette = api_gp(player, "pal")

    api_dp(player, "base_pal", palette)
    api_log("ready", api_gp(player, "base_pal"))
        

end

function click(button, click_type)
    player = api_get_player_instance()
    mouse = api_get_mouse_inst()
    palette = api_gp(player, "pal")
    basePalette = api_gp(player,"base_pal")
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
                    palette.h2 = {245, 0, 0}
                    palette.h1 = {215, 0, 0}
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
                    palette.h2 = basePalette.h2
                    palette.h1 = basePalette.h1
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