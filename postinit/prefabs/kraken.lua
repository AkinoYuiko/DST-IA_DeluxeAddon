if not GetModConfigData("wet_quacken") then return end

AddPrefabPostInit("kraken", function(inst)
    if not inst:HasTag("wet") then
        inst:AddTag("wet")
    end
end)
