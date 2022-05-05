GLOBAL.setfenv(1, GLOBAL)

local function ia_basic_clear_fn(inst, def_build)
    inst.AnimState:SetBuild(def_build)
    if inst.components.inventoryitem then
        inst.components.inventoryitem:ChangeImageName()
    end
    -- if inst.components.floater ~= nil then               -- IA doesn't use this to update water anim, so basic_clear_fn sucks.
    --     if inst.components.floater:IsFloating() then
    --         inst.components.floater:SwitchToDefaultAnim(true)
    --         inst.components.floater:SwitchToFloatAnim()
    --     end
    -- end
end

cutlass_init_fn = function(inst, skinname, override_build)
    GlassicAPI.BasicInitFn(inst, skinname, override_build)
    GlassicAPI.BasicOnequipFn(inst, "hand", override_build or skinname, "swap_cutlass")
	inst.components.floater:UpdateAnimations("idle_water_malbatross", "idle")
end

cutlass_clear_fn = function(inst)
    ia_basic_clear_fn(inst, "cutlass")
	inst.components.floater:UpdateAnimations("idle_water", "idle")
end

double_umbrellahat_init_fn = function(inst, skinname, override_build)
    GlassicAPI.BasicInitFn(inst, skinname, override_build)
    GlassicAPI.BasicOnequipFn(inst, "hat", override_build or skinname)
end

double_umbrellahat_clear_fn = function(inst)
    ia_basic_clear_fn(inst, "hat_double_umbrella")
end

aerodynamichat_init_fn = function(inst, skinname, override_build)
    GlassicAPI.BasicInitFn(inst, skinname, override_build)
    GlassicAPI.BasicOnequipFn(inst, "hat", override_build or skinname)
end

aerodynamichat_clear_fn = function(inst)
    ia_basic_clear_fn(inst, "hat_aerodynamic")
end

spear_obsidian_init_fn = function(inst, skinname, override_build)
    GlassicAPI.BasicInitFn(inst, skinname, override_build)
    GlassicAPI.BasicOnequipFn(inst, "hand", override_build or skinname, "swap_spear")
end

spear_obsidian_clear_fn = function(inst)
    ia_basic_clear_fn(inst, "spear_obsidian")
end

GlassicAPI.SkinHandler.AddModSkins({
    cutlass = {"cutlass_malbatross"},
    double_umbrellahat = {"double_umbrellahat_summer"},
    aerodynamichat = {"aerodynamichat_shark"},
    spear_obsidian = {"spear_obsidian_spinner"},
})
