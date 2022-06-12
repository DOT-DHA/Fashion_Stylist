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

  api_define_command("/rainbow","Command_Rainbow")


  return "Success"

end

function ready()

end

function click(button, click_type)
    player = api_get_player_instance()
    mouse = api_get_mouse_inst()
    palette = api_gp(player, "pal")


    if button == "RIGHT" and click_type == "PRESSED" then

        highlighted = api_get_highlighted("slot")

        if highlighted ~= nil then

            slot = api_get_slot_inst(highlighted)

            if slot["item"] == MOD_NAME.."_hair_dye_red" then

                if mouse["count"]>0 then
                    api_sp(slot["id"], "count", slot["count"]+mouse["count"])
                    api_sp(mouse["id"], "count", 0)
                    api_sp(mouse["id"], "item", "")
                end
                --Do something with your item here
                if palette.h2 ~= {255, 0, 0} or palette.h1 ~= {230, 0, 0} then
                    palette.h2 = {255, 0, 0}
                    palette.h1 = {230, 0, 0}
                    api_sp(player, "pal", palette)
                    api_use_item(slot["item"], 1)
                    --palette.h2 = {174, 94, 94}
                    --palette.h1 = {145, 71, 78}
                end  
            end
        end
    end
end