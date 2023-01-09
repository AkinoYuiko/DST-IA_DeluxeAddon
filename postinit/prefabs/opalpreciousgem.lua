if not GetModConfigData("moonglass_octopusking") then return end

local AddPrefabPostInit = AddPrefabPostInit
GLOBAL.setfenv(1, GLOBAL)

AddPrefabPostInit("opalpreciousgem", function(inst)
    if not TheWorld.ismastersim then return end

    inst:AddTag("trinket")

    if not inst.components.tradable then
        inst:AddComponent("tradable")
    end
    inst.components.tradable.dubloonvalue = math.random(20, 40)
    inst:WatchWorldState("startday", function(inst)
        inst.components.tradable.dubloonvalue = math.random(20, 40)
    end)
end)
