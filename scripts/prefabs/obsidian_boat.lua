-- local rowboatassets = {
--     Asset("ANIM", "anim/rowboat_basic.zip"),
--     Asset("ANIM", "anim/rowboat_build.zip"),
--     Asset("ANIM", "anim/rowboat_idles.zip"),
--     Asset("ANIM", "anim/rowboat_paddle.zip"),
--     Asset("ANIM", "anim/rowboat_trawl.zip"),
--     Asset("ANIM", "anim/swap_sail.zip"),
--     Asset("ANIM", "anim/swap_lantern_boat.zip"),
--     Asset("ANIM", "anim/boat_hud_row.zip"),
--     Asset("ANIM", "anim/boat_inspect_row.zip"),
--     Asset("ANIM", "anim/flotsam_rowboat_build.zip"),
-- }

-- local raftassets = {
--     Asset("ANIM", "anim/raft_basic.zip"),
--     Asset("ANIM", "anim/raft_build.zip"),
--     Asset("ANIM", "anim/raft_idles.zip"),
--     Asset("ANIM", "anim/raft_paddle.zip"),
--     Asset("ANIM", "anim/raft_trawl.zip"),
--     Asset("ANIM", "anim/boat_hud_raft.zip"),
--     Asset("ANIM", "anim/boat_inspect_raft.zip"),
--     Asset("ANIM", "anim/flotsam_bamboo_build.zip"),
-- }

-- local surfboardassets = {
--     Asset("ANIM", "anim/raft_basic.zip"),
--     Asset("ANIM", "anim/raft_surfboard_build.zip"),
--     Asset("ANIM", "anim/raft_idles.zip"),
--     Asset("ANIM", "anim/raft_paddle.zip"),
--     Asset("ANIM", "anim/raft_trawl.zip"),
--     Asset("ANIM", "anim/boat_hud_raft.zip"),
--     Asset("ANIM", "anim/boat_inspect_raft.zip"),
--     Asset("ANIM", "anim/flotsam_surfboard_build.zip"),
--     Asset("ANIM", "anim/surfboard.zip"),
-- }

-- local cargoassets = {
--     Asset("ANIM", "anim/rowboat_basic.zip"),
--     Asset("ANIM", "anim/rowboat_cargo_build.zip"),
--     Asset("ANIM", "anim/rowboat_idles.zip"),
--     Asset("ANIM", "anim/rowboat_paddle.zip"),
--     Asset("ANIM", "anim/rowboat_trawl.zip"),
--     Asset("ANIM", "anim/swap_sail.zip"),
--     Asset("ANIM", "anim/swap_lantern_boat.zip"),
--     Asset("ANIM", "anim/boat_hud_cargo.zip"),
--     Asset("ANIM", "anim/boat_inspect_cargo.zip"),
--     Asset("ANIM", "anim/flotsam_cargo_build.zip"),
-- }

-- local armouredboatassets = {
--     Asset("ANIM", "anim/rowboat_basic.zip"),
--     Asset("ANIM", "anim/rowboat_armored_build.zip"),
--     Asset("ANIM", "anim/rowboat_idles.zip"),
--     Asset("ANIM", "anim/rowboat_paddle.zip"),
--     Asset("ANIM", "anim/rowboat_trawl.zip"),
--     Asset("ANIM", "anim/swap_sail.zip"),
--     Asset("ANIM", "anim/swap_lantern_boat.zip"),
--     Asset("ANIM", "anim/boat_hud_row.zip"),
--     Asset("ANIM", "anim/boat_inspect_row.zip"),
--     Asset("ANIM", "anim/flotsam_armoured_build.zip"),
-- }

local obsidianboatassets = {
    Asset("ANIM", "anim/rowboat_basic.zip"),
    Asset("ANIM", "anim/rowboat_obsidian_build.zip"),
    Asset("ANIM", "anim/rowboat_idles.zip"),
    Asset("ANIM", "anim/rowboat_paddle.zip"),
    Asset("ANIM", "anim/rowboat_trawl.zip"),
    Asset("ANIM", "anim/swap_sail.zip"),
    Asset("ANIM", "anim/swap_lantern_boat.zip"),
    Asset("ANIM", "anim/boat_hud_obsidian.zip"),
    Asset("ANIM", "anim/boat_inspect_obsidian.zip"),
  -- TODO: add obsidian flotsam
    Asset("ANIM", "anim/flotsam_armoured_build.zip"),
}

-- local lograftassets = {
--     Asset("ANIM", "anim/raft_basic.zip"),
--     Asset("ANIM", "anim/raft_log_build.zip"),
--     Asset("ANIM", "anim/raft_idles.zip"),
--     Asset("ANIM", "anim/raft_paddle.zip"),
--     Asset("ANIM", "anim/raft_trawl.zip"),
--     Asset("ANIM", "anim/boat_hud_raft.zip"),
--     Asset("ANIM", "anim/boat_inspect_raft.zip"),
--     Asset("ANIM", "anim/flotsam_lograft_build.zip"),
-- }

-- local woodlegsboatassets = {
--     Asset("ANIM", "anim/rowboat_basic.zip"),
--     Asset("ANIM", "anim/pirate_boat_build.zip"),
--     Asset("ANIM", "anim/rowboat_idles.zip"),
--     Asset("ANIM", "anim/rowboat_paddle.zip"),
--     Asset("ANIM", "anim/rowboat_trawl.zip"),
--     Asset("ANIM", "anim/boat_hud_raft.zip"),
--     Asset("ANIM", "anim/boat_inspect_raft.zip"),
--     Asset("ANIM", "anim/flotsam_rowboat_build.zip"),
--     Asset("ANIM", "anim/pirate_boat_placer.zip"),
-- }

local prefabs = {
    "rowboat_wake",
    "boat_hit_fx",
    "boat_hit_fx_raft_log",
    "boat_hit_fx_raft_bamboo",
    "boat_hit_fx_rowboat",
    "boat_hit_fx_cargoboat",
    "boat_hit_fx_armoured",
    "flotsam_armoured",
    "flotsam_bamboo",
    "flotsam_cargo",
    "flotsam_lograft",
    "flotsam_rowboat",
    "flotsam_surfboard",
}

local function sink(inst)
    local sailor = inst.components.sailable:GetSailor()
    if sailor then
        if sailor.components.health then
            sailor.components.health:Drown(true)
        end
        --moved to after drown call because of double drown for wurt and because otherwise when you drown too close to shore you can get put back onto shore due to keeponland
        sailor.components.sailor:Disembark()

        --im pretty sure its here because otherwise it will play twice due to keeponland, plus it needs the boats sinksound -Half
        inst.SoundEmitter:PlaySound(inst.sinksound) --Not sure why this is here and not in the SG -M
    end
    if inst.components.container then
        inst.components.container:DropEverything()
    end

    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("run_loop", true)
end

local function onworked(inst, worker)
    inst.components.lootdropper:DropLoot()
    if inst.components.container then
        inst.components.container:DropEverything()
    end
    SpawnAt("collapse_small", inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
    inst:Remove()
end

local function onrepaired(inst, doer, repair_item)
    inst.SoundEmitter:PlaySound("ia/common/boatrepairkit")
end

local function ondisembarked(inst)
    inst.components.workable.workable = false
end

local function onembarked(inst)
    inst.components.workable.workable = true
end

local function onopen(inst)
    if inst.components.sailable.sailor == nil then
        inst.SoundEmitter:PlaySound("ia/common/boat/inventory_open")
    end
end

local function onclose(inst)
    if inst.components.sailable.sailor == nil then
        inst.SoundEmitter:PlaySound("ia/common/boat/inventory_close")
    end
end

local function common()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.entity:AddPhysics()
    inst.entity:AddMiniMapEntity()

    inst:AddTag("boat")
    inst:AddTag("sailable")

    inst.Transform:SetFourFaced()
    inst.MiniMapEntity:SetPriority(5)

    inst.AnimState:SetFinalOffset(FINALOFFSET_MIN) --has some visual glitches but looks much better than the boat being infront of the player on a disembark

    inst.Physics:SetCylinder(0.25,2)

    inst.no_wet_prefix = true

    inst.sailmusic = "sailing"

    inst.boatvisuals = {}

    inst.boatname = net_string(inst.GUID, "boatname")

    inst.displaynamefn = function(_inst)
        local name = _inst.boatname:value()
        return name ~= "" and name or STRINGS.NAMES[string.upper(_inst.prefab)]
    end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:AddComponent("writeable")
    inst:RemoveEventCallback("onbuilt", inst.event_listening.onbuilt[inst][1])
    inst.components.writeable:SetDefaultWriteable(false)
    inst.components.writeable:SetAutomaticDescriptionEnabled(false)

    local _Write = inst.components.writeable.Write
    inst.components.writeable.Write = function(self, doer, text, ...)
        if not text then
            text = self.text
            if doer.tool_prefab then
                doer.components.inventory:GiveItem(SpawnPrefab(doer.tool_prefab), nil, inst:GetPosition())
            end
        else
            inst.SoundEmitter:PlaySound("dontstarve/common/together/draw")
        end

        inst.boatname:set(text and text ~= "" and text or "")
        _Write(self, doer, text, ...)
    end

    local _OnLoad = inst.components.writeable.OnLoad
    inst.components.writeable.OnLoad = function(self, ...)
        _OnLoad(self, ...)
        local text = self.text
        inst.boatname:set(text and text ~= "" and text or "")
    end

    inst:AddComponent("sailable")
    inst.components.sailable.sanitydrain = TUNING.RAFT_SANITY_DRAIN
    inst.components.sailable.movementbonus = TUNING.RAFT_SPEED
    inst.components.sailable.flotsambuild = "flotsam_bamboo_build"
    inst.components.sailable.maprevealbonus = TUNING.MAPREVEAL_RAFT_BONUS

    inst.landsound = "ia/common/boatjump_land_bamboo"
    inst.sinksound = "ia/common/boat/sinking/bamboo"

    inst.waveboost = TUNING.WAVEBOOST

    inst:AddComponent("rowboatwakespawner")

    inst:AddComponent("boathealth")
    inst.components.boathealth:SetDepletedFn(sink)
    inst.components.boathealth:SetHealth(TUNING.RAFT_HEALTH, TUNING.RAFT_PERISHTIME)
    inst.components.boathealth.leakinghealth = TUNING.RAFT_LEAKING_HEALTH
    inst.components.boathealth.damagesound = "ia/common/boat/damage/bamboo"
    inst.components.boathealth.hitfx = "boat_hit_fx_raft_bamboo"

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onworked)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("lootdropper")

    inst:AddComponent("repairable")
    inst.components.repairable.repairmaterial = "boat"
    inst.components.repairable.onrepaired = onrepaired

    inst:ListenForEvent("embarked", onembarked)
    inst:ListenForEvent("disembarked", ondisembarked)

    inst.onworked = onworked

    inst:AddComponent("flotsamspawner")

    inst.components.flotsamspawner.flotsamprefab = "flotsam_bamboo"

    inst:AddSpoofedComponent("boatcontainer", "container")

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst:AddComponent("boatvisualmanager")

    return inst
end

-- local function surfboard_pickupfn(inst, guy)
--     local item = SpawnPrefab(inst.boat_item)
--     if item then
--         local value = inst.boatname:value()
--         local name = value and value ~= "" and value or ""
--         item.components.writeable:SetText(name)
--         item.boatname:set(name)

--         guy.components.inventory:GiveItem(item)
--         item.components.pocket:GiveItem(inst.prefab, inst)
--     end

--     return true
-- end

-- local function surfboard_common()
--     local inst = common()

--     inst:AddTag("surfboard")

--     if not TheWorld.ismastersim then
--         function inst.OnEntityReplicated(_inst)
--             _inst.replica.sailable.creaksound = "ia/common/boat/creaks/creaks"
--             _inst.replica.sailable.sailsound = "ia/common/sail_LP/surfboard"
--             _inst.replica.sailable.sailloopanim = "surf_loop"
--             _inst.replica.sailable.sailstartanim = "surf_pre"
--             _inst.replica.sailable.sailstopanim = "surf_pst"
--             _inst.replica.sailable.alwayssail = true
--         end
--         return inst
--     end

--     inst.board = nil

--     inst.components.boathealth.hitfx = nil

--     inst.sinksound = "ia/common/boat/sinking/log_cargo"
--     inst.replica.sailable.sailsound = "ia/common/sail_LP/surfboard"
--     inst.replica.sailable.sailloopanim = "surf_loop"
--     inst.replica.sailable.sailstartanim = "surf_pre"
--     inst.replica.sailable.sailstopanim = "surf_pst"
--     inst.components.sailable.alwayssail = true
--     inst.sailmusic = "surfing"

--     inst:AddComponent("pickupable")
--     inst.components.pickupable:SetOnPickupFn(surfboard_pickupfn)
--     inst:SetInherentSceneAltAction(ACTIONS.RETRIEVE)

--     inst:ListenForEvent("embarked", function(_inst)
--         _inst.components.pickupable.canbepickedup = false
--         _inst:SetInherentSceneAltAction(nil)
--     end)

--     inst:ListenForEvent("disembarked", function(_inst)
--         _inst.components.pickupable.canbepickedup = true
--         _inst:SetInherentSceneAltAction(ACTIONS.RETRIEVE)
--     end)

--     return inst
-- end

local function item_ondropped(inst)
    --If this is a valid place to be deployed, auto deploy yourself.
    local x, y, z = inst.Transform:GetWorldPosition()
    local pt = Vector3(x, 0, z)
    if inst.components.deployable and inst._custom_candeploy_fn and inst:_custom_candeploy_fn(pt) then
        inst.components.deployable.forcedeploy = true
        inst.components.deployable:Deploy(pt, inst)
        inst.components.deployable.forcedeploy = false
    end
end

local function item_ondeploy(inst, pt, deployer)
    local boat = inst.components.pocket:RemoveItem(inst.boat) or SpawnPrefab(inst.boat)
    if boat then
        local value = inst.boatname:value()
        local name = value and value ~= "" and value or ""
        boat.components.writeable:SetText(name)
        boat.boatname:set(name)

        local x, y, z = pt:Get()
        boat.components.flotsamspawner.inpocket = false
        boat.Physics:SetCollides(false)
        boat.Physics:Teleport(x, y, z)
        boat.Physics:SetCollides(true)
        inst:Remove()
    end
end

local function item_common()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()

    inst.MiniMapEntity:SetPriority(5)

    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst)

    inst:AddTag("boat")

    inst.boatname = net_string(inst.GUID, "boatname")

    inst.displaynamefn = function(_inst)
        local name = _inst.boatname:value()
        return name ~= "" and name or STRINGS.NAMES[string.upper(_inst.prefab)]
    end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.boat = nil

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(item_ondropped)

    inst:AddComponent("pocket")

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst._custom_candeploy_fn = function(_inst, pt)
        local tile = TheWorld.Map:GetTileAtPoint(pt:Get())
        local IsWaterMode = IA_CONFIG.aquaticplacedstwater and IsWaterAny or IsWater
        return IsWaterMode(tile)
    end
    inst.components.deployable.ondeploy = item_ondeploy
    inst.components.deployable.candeployonland = false
    inst.components.deployable.candeployonbuildableocean = true
    inst.components.deployable.candeployonunbuildableocean = true
    inst.components.deployable.deploydistance = 3

    inst:AddComponent("writeable")
    inst.components.writeable:SetDefaultWriteable(false)
    inst.components.writeable:SetAutomaticDescriptionEnabled(false)
    local _Write = inst.components.writeable.Write
    inst.components.writeable.Write = function(self, doer, text, ...)
        if not text then
            text = self.text
            if doer and doer.tool_prefab then
                doer.components.inventory:GiveItem(SpawnPrefab(doer.tool_prefab), nil, inst:GetPosition())
            end
        else
            inst.SoundEmitter:PlaySound("dontstarve/common/together/draw")
        end

        inst.boatname:set(text and text ~= "" and text or "")
        _Write(self, doer, text, ...)
    end

    local _OnLoad = inst.components.writeable.OnLoad
    inst.components.writeable.OnLoad = function(self, ...)
        _OnLoad(self, ...)
        local text = self.text
        inst.boatname:set(text and text ~= "" and text or "")
    end

    return inst
end

-- local function raftfn()
--     local inst = common()

--     inst.AnimState:SetBank("raft")
--     inst.AnimState:SetBuild("raft_build")
--     inst.AnimState:PlayAnimation("run_loop", true)
--     inst.MiniMapEntity:SetIcon("boat_raft.tex")

--     if not TheWorld.ismastersim then
--         function inst.OnEntityReplicated(inst)
--             inst.replica.sailable.creaksound = "ia/common/boat/creaks/bamboo"
--         end
--         return inst
--     end

--     inst.components.container:WidgetSetup("boat_raft")

--     inst.components.boathealth:SetHealth(TUNING.RAFT_HEALTH, TUNING.RAFT_PERISHTIME)
--     inst.components.boathealth.leakinghealth = TUNING.RAFT_LEAKING_HEALTH
--     inst.components.boathealth.damagesound = "ia/common/boat/damage/bamboo"
--     inst.components.boathealth.hitfx = "boat_hit_fx_raft_bamboo"

--     inst.landsound = "ia/common/boatjump_land_bamboo"
--     inst.sinksound = "ia/common/boat/sinking/bamboo"

--     inst.components.sailable.sanitydrain = TUNING.RAFT_SANITY_DRAIN
--     inst.components.sailable.movementbonus = TUNING.RAFT_SPEED
--     inst.components.sailable.flotsambuild = "flotsam_bamboo_build"
--     inst.components.sailable.maprevealbonus = TUNING.MAPREVEAL_RAFT_BONUS
--     inst.components.sailable.hitmoisturerate = TUNING.RAFT_HITMOISTURERATE

--     inst.replica.sailable.creaksound = "ia/common/boat/creaks/bamboo"

--     inst.components.flotsamspawner.flotsamprefab = "flotsam_bamboo"

--     return inst
-- end

-- local function lograftfn()
--     local inst = common()

--     inst.AnimState:SetBank("raft")
--     inst.AnimState:SetBuild("raft_log_build")
--     inst.AnimState:PlayAnimation("run_loop", true)
--     inst.MiniMapEntity:SetIcon("boat_lograft.tex")

--     if not TheWorld.ismastersim then
--         function inst.OnEntityReplicated(inst)
--             inst.replica.sailable.creaksound = "ia/common/boat/creaks/log"
--         end
--         return inst
--     end

--     inst.components.container:WidgetSetup("boat_lograft")

--     inst.components.boathealth:SetHealth(TUNING.LOGRAFT_HEALTH, TUNING.LOGRAFT_PERISHTIME)
--     inst.components.boathealth.leakinghealth = TUNING.LOGRAFT_LEAKING_HEALTH
--     inst.components.boathealth.damagesound = "ia/common/boat/damage/log"
--     inst.components.boathealth.hitfx = "boat_hit_fx_raft_log"

--     inst.landsound = "ia/common/boatjump_land_log"
--     inst.sinksound = "ia/common/boat/sinking/log_cargo"

--     inst.components.sailable.sanitydrain = TUNING.LOGRAFT_SANITY_DRAIN
--     inst.components.sailable.movementbonus = TUNING.LOGRAFT_SPEED
--     inst.components.sailable.flotsambuild = "flotsam_lograft_build"
--     inst.components.sailable.maprevealbonus = TUNING.MAPREVEAL_LOGRAFT_BONUS
--     inst.components.sailable.hitmoisturerate = TUNING.RAFT_HITMOISTURERATE

--     inst.components.boathealth.damagesound = "ia/common/boat/damage/log"

--     inst.components.flotsamspawner.flotsamprefab = "flotsam_lograft"

--     return inst
-- end

-- local function rowboatfn()
--     local inst = common()

--     inst.AnimState:SetBank("rowboat")
--     inst.AnimState:SetBuild("rowboat_build")
--     inst.AnimState:PlayAnimation("run_loop", true)
--     inst.MiniMapEntity:SetIcon("boat_row.tex")

--     if not TheWorld.ismastersim then
--         function inst.OnEntityReplicated(inst)

--         end
--         return inst
--     end

--     inst.components.container:WidgetSetup("boat_row")

--     inst.components.boathealth:SetHealth(TUNING.ROWBOAT_HEALTH, TUNING.ROWBOAT_PERISHTIME)
--     inst.components.boathealth.leakinghealth = TUNING.ROWBOAT_LEAKING_HEALTH
--     inst.components.boathealth.damagesound = "ia/common/boat/damage/row"
--     inst.components.boathealth.hitfx = "boat_hit_fx_rowboat"

--     inst.landsound = "ia/common/boatjump_land_wood"
--     inst.sinksound = "ia/common/boat/sinking/row"

--     inst.components.sailable.sanitydrain = TUNING.ROWBOAT_SANITY_DRAIN
--     inst.components.sailable.movementbonus = TUNING.ROWBOAT_SPEED
--     inst.components.sailable.flotsambuild = "flotsam_rowboat_build"
--     inst.components.sailable.maprevealbonus = TUNING.MAPREVEAL_ROWBOAT_BONUS

--     inst.components.flotsamspawner.flotsamprefab = "flotsam_rowboat"

--     return inst
-- end

-- local function armouredboatfn()
--     local inst = common()

--     inst.AnimState:SetBank("rowboat")
--     inst.AnimState:SetBuild("rowboat_armored_build")
--     inst.AnimState:PlayAnimation("run_loop", true)
--     inst.MiniMapEntity:SetIcon("boat_armoured.tex")

--     if not TheWorld.ismastersim then
--         function inst.OnEntityReplicated(inst)
--             inst.replica.sailable.creaksound = "ia/common/boat/creaks/armoured"
--         end
--         return inst
--     end

--     inst.components.container:WidgetSetup("boat_armoured")

--     inst.components.boathealth:SetHealth(TUNING.ARMOUREDBOAT_HEALTH, TUNING.ARMOUREDBOAT_PERISHTIME)
--     inst.components.boathealth.leakinghealth = TUNING.ARMOUREDBOAT_LEAKING_HEALTH
--     inst.components.boathealth.damagesound = "ia/common/boat/damage/armoured"
--     inst.components.boathealth.hitfx = "boat_hit_fx_armoured"

--     inst.landsound = "ia/common/boatjump_land_shell"
--     inst.sinksound = "ia/common/boat/sinking/row"

--     inst.components.sailable.sanitydrain = TUNING.ARMOUREDBOAT_SANITY_DRAIN
--     inst.components.sailable.movementbonus = TUNING.ARMOUREDBOAT_SPEED
--     inst.components.sailable.flotsambuild = "flotsam_armoured_build"
--     inst.components.sailable.maprevealbonus = TUNING.MAPREVEAL_ARMOUREDBOAT_BONUS
--     inst.components.sailable:SetHitImmunity(TUNING.ARMOUREDBOAT_HIT_IMMUNITY)

--     inst.replica.sailable.creaksound = "ia/common/boat/creaks/armoured"

--     inst.components.flotsamspawner.flotsamprefab = "flotsam_armoured"

--     return inst
-- end

local function obsidianboatfn()
    local inst = common()

    inst.AnimState:SetBank("rowboat")
    inst.AnimState:SetBuild("rowboat_encrusted_build")
    inst.AnimState:PlayAnimation("run_loop", true)
    inst.MiniMapEntity:SetIcon("boat_encrusted.tex")

    if not TheWorld.ismastersim then
        function inst.OnEntityReplicated(inst)
            inst.replica.sailable.creaksound = "ia/common/boat/creaks/encrusted"
        end
        return inst
    end

    inst.waveboost = TUNING.OBSIDIANBOAT_WAVEBOOST

    -- inst.components.container:WidgetSetup("boat_encrusted")
    inst.components.container:WidgetSetup("boat_woodlegs")

    inst.components.boathealth:SetHealth(TUNING.OBSIDIANBOAT_HEALTH, TUNING.OBSIDIANBOAT_PERISHTIME)
    inst.components.boathealth.leakinghealth = TUNING.OBSIDIANBOAT_LEAKING_HEALTH
    inst.components.boathealth.damagesound = "ia/common/boat/damage/encrusted"
    inst.components.boathealth.hitfx = "boat_hit_fx_armoured"

    inst.landsound = "ia/common/boatjump_land_shell"
    inst.sinksound = "ia/common/boat/sinking/row"

    inst.components.sailable.sanitydrain = TUNING.OBSIDIANBOAT_SANITY_DRAIN
    inst.components.sailable.movementbonus = TUNING.OBSIDIANBOAT_SPEED
    inst.components.sailable.flotsambuild = "flotsam_armoured_build"
    inst.components.sailable.maprevealbonus = TUNING.MAPREVEAL_OBSIDIANBOAT_BONUS
    inst.components.sailable:SetHitImmunity(TUNING.OBSIDIANBOAT_HIT_IMMUNITY)

    inst.replica.sailable.creaksound = "ia/common/boat/creaks/encrusted"

    inst.components.flotsamspawner.flotsamprefab = "flotsam_armoured"

    inst:DoTaskInTime(0.1, function(inst)
        local sailitem = inst.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_SAIL)
        if sailitem == nil then
            local sail = SpawnPrefab("sail_woodlegs")
            inst.components.container:Equip(sail)
        end
        local torchitem = inst.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_LAMP)
        if torchitem == nil then
            local cannon = SpawnPrefab("woodlegs_boatcannon")
            inst.components.container:Equip(cannon)
        end
    end)

    return inst
end

-- local function woodlegsboatfn()
--     local inst = common()

--     inst.AnimState:SetBank("rowboat")
--     inst.AnimState:SetBuild("pirate_boat_build")
--     inst.AnimState:PlayAnimation("run_loop", true)
--     inst.MiniMapEntity:SetIcon("boat_woodlegs.tex")

--     if not TheWorld.ismastersim then
--         function inst.OnEntityReplicated(inst)
--             inst.replica.sailable.creaksound = "ia/common/boat/creaks/armoured"
--         end
--         return inst
--     end

--     inst.components.container:WidgetSetup("boat_woodlegs")

--     inst.components.boathealth:SetHealth(TUNING.WOODLEGSBOAT_HEALTH, TUNING.ARMOUREDBOAT_PERISHTIME)
--     inst.components.boathealth.leakinghealth = TUNING.WOODLEGSBOAT_LEAKING_HEALTH
--     inst.components.boathealth.damagesound = "ia/common/boat/damage/armoured"
--     inst.components.boathealth.hitfx = "boat_hit_fx_armoured"

--     inst.landsound = "ia/common/boatjump_land_shell"
--     inst.sinksound = "ia/common/boat/sinking/row"

--     inst.components.sailable.sanitydrain = 0
--     inst.components.sailable.movementbonus = TUNING.WOODLEGSBOAT_SPEED
--     inst.components.sailable.flotsambuild = "flotsam_armoured_build"
--     inst.components.sailable.maprevealbonus = TUNING.MAPREVEAL_WOODLEGSBOAT_BONUS
--     inst.components.sailable:SetHitImmunity(TUNING.WOODLEGSBOAT_HIT_IMMUNITY)

--     inst.replica.sailable.creaksound = "ia/common/boat/creaks/armoured"

--     inst.components.flotsamspawner.flotsamprefab = "flotsam_rowboat"

--     inst:DoTaskInTime(0.1, function(inst)
--         local sailitem = inst.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_SAIL)
--         if sailitem == nil then
--             local sail = SpawnPrefab("sail_woodlegs")
--             inst.components.container:Equip(sail)
--         end
--         local torchitem = inst.components.container:GetItemInBoatSlot(BOATEQUIPSLOTS.BOAT_LAMP)
--         if torchitem == nil then
--             local cannon = SpawnPrefab("woodlegs_boatcannon")
--             inst.components.container:Equip(cannon)
--         end
--     end)

--     return inst
-- end

return Prefab("boat_obsidian", obsidianboatfn, encrustedboatassets, prefabs),
--the 2 is offset for controller users (Bullkelp from basegame also uses 2)
MakePlacer("boat_obsidian_placer", "rowboat", "rowboat_encrusted_build", "run_loop", nil, nil, nil, nil, nil, nil, nil, 2)
