local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("cutlass_malbatross", {
    base_prefab = "cutlass",
    type = "item",
    rarity = "Glassic",
    assets = {
        Asset( "DYNAMIC_ANIM", "anim/dynamic/cutlass_malbatross.zip" ),
        Asset( "PKGREF", "anim/dynamic/cutlass_malbatross.dyn" ),
    },
    init_fn = function(inst)
        cutlass_init_fn(inst, "cutlass_malbatross")
    end,
    skin_tags = {"CUTLASS"}
}))

table.insert(prefabs, CreatePrefabSkin("double_umbrellahat_summer", {
    base_prefab = "double_umbrellahat",
    type = "item",
    rarity = "Glassic",
    assets = {
        Asset( "DYNAMIC_ANIM", "anim/dynamic/double_umbrellahat_summer.zip" ),
        Asset( "PKGREF", "anim/dynamic/double_umbrellahat_summer.dyn" ),
    },
    init_fn = function(inst)
        double_umbrellahat_init_fn(inst, "double_umbrellahat_summer")
    end,
    skin_tags = {"DOUBLE_UMBRELLAHAT"}
}))

table.insert(prefabs, CreatePrefabSkin("aerodynamichat_shark", {
    base_prefab = "aerodynamichat",
    type = "item",
    rarity = "Glassic",
    assets = {
        -- Asset( "ANIM", "anim/aerodynamichat_shark.zip" ), -- test
        Asset( "DYNAMIC_ANIM", "anim/dynamic/aerodynamichat_shark.zip" ),
        Asset( "PKGREF", "anim/dynamic/aerodynamichat_shark.dyn" ),
    },
    init_fn = function(inst)
        aerodynamichat_init_fn(inst, "aerodynamichat_shark")
    end,
    skin_tags = {"AERODYNAMICHAT"}
}))

return unpack(prefabs)
