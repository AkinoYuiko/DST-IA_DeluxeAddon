-- This is a temp fix for boatlamp.

local AddPrefabPostInit = AddPrefabPostInit
GLOBAL.setfenv(1, GLOBAL)

local function takefuel_postinit(inst)

    if not TheWorld.ismastersim then return end

    local takefuel = inst.components.equippable.ontakefuelfn

    inst.components.equippable.ontakefuelfn = function(inst)
        takefuel(inst)

        if inst.components.equippable.togglable and inst.components.fueled and not inst:HasTag("toggled") then
            inst:AddTag("toggled")
        end
    end
end

AddPrefabPostInit("boat_lantern", takefuel_postinit)
