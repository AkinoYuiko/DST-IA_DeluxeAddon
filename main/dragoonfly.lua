AddPrefabPostInit("dragonfly", function(inst)
    if inst.components.lootdropper then
        inst.components.lootdropper:AddChanceLoot("obsidian", 1)
        inst.components.lootdropper:AddChanceLoot("obsidian", 1)
        inst.components.lootdropper:AddChanceLoot("obsidian", 1)
        inst.components.lootdropper:AddChanceLoot("obsidian", 0.50)
        inst.components.lootdropper:AddChanceLoot("obsidian", 0.50)
        inst.components.lootdropper:AddChanceLoot("obsidian", 0.33)
        inst.components.lootdropper:AddChanceLoot("obsidian", 0.33)
        inst.components.lootdropper:AddChanceLoot("obsidian", 0.25)
    end
end)