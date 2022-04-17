GLOBAL.setfenv(1, GLOBAL)

cutlass_init_fn = function(inst, skinname, override_build)
    GlassicAPI.BasicInitFn(inst, skinname, override_build or skinname, override_build or skinname)
    GlassicAPI.BasicOnequipFn(inst, "hand", override_build or skinname, "swap_cutlass")
	inst.components.floater:UpdateAnimations("idle_water_malbatross", "idle")
end

cutlass_clear_fn = function(inst)
    -- inst.AnimState:SetBank("cutlass")
    basic_clear_fn(inst, "cutlass")
	inst.components.floater:UpdateAnimations("idle_water", "idle")

end

GlassicAPI.SkinHandler.AddModSkins({
    cutlass = { "cutlass_malbatross" },
})
