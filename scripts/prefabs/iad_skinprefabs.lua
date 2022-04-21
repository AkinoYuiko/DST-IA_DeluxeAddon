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

return unpack(prefabs)
