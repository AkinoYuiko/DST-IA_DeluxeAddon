local AddPrefabPostInit = AddPrefabPostInit
GLOBAL.setfenv(1, GLOBAL)

local coffee_prefabs = {
    "coffee",
    "coffeebeans_cooked"
}

for prefab in pairs(Prefabs) do
    if string.sub(prefab, 1, 7) == "coffee_" then
        table.insert(coffee_prefabs, prefab)
    end
end

local function coffee_postinit(inst)
    if not TheWorld.ismastersim then return end

    local _oneaten = inst.components.edible.oneaten
    inst.components.edible.oneaten = function(inst, eater)
        if _oneaten then _oneaten(inst, eater) end
        if eater and eater.components.locomotor then
            eater.components.locomotor:SetExternalSpeedAdder(eater, "CAFFEINE", inst.components.edible.caffeinedelta, inst.components.edible.caffeineduration)
        end
    end
end
for _, prefab in ipairs(coffee_prefabs) do
    AddPrefabPostInit(prefab, coffee_postinit)
end
