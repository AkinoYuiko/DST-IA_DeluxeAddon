if not GetModConfigData("starstuff_octopusking") then return end

local function OnRefuseStarStaff()
    OCTOPUSKING_LOOT.chestloot["yellowstaff"] = nil
end

local function OnAcceptStarStaff()
    OCTOPUSKING_LOOT.chestloot["yellowstaff"] = "opalstaff"
end

local function StartTrading(inst)
    if not inst.components.trader.enabled then
        inst.components.trader:Enable()

        if inst.sleepfn then
            inst.AnimState:PlayAnimation("sleep_pst")
            inst:RemoveEventCallback("animover", inst.sleepfn)
            inst.sleepfn = nil
        end

        inst.AnimState:PushAnimation("idle", true)
    end
end

local function OnSave(inst, data)
    data.accept_staff = OCTOPUSKING_LOOT.chestloot["yellowstaff"]
end

local function OnLoad(isnt, data)
    OCTOPUSKING_LOOT.chestloot["yellowstaff"] = data and data.accept_staff
end

AddPrefabPostInit("octopusking", function(inst)
    if not TheWorld.ismastersim then return end

    local stop_fn = inst.worldstatewatching.startnight[1]
    inst:StopWatchingWorldState("startnight", stop_fn)
    inst:WatchWorldState("startnight", function(inst)
        if TheWorld.state.moonphase == "full" then
            OnAcceptStarStaff()
        else
            stop_fn(inst)
        end
    end)

    local startfn = inst.worldstatewatching.startday[1]
    inst:StopWatchingWorldState("startday", startfn)
    inst:WatchWorldState("startday", function(inst)
        -- OnRefuseStarStaff()
        StartTrading(inst)
    end)

    local onsave = inst.OnSave
    inst.OnSave = function(inst, data)
        if onsave then onsave(inst, data) end
        OnSave(inst, data)
    end

    local onload = inst.OnLoad
    inst.OnLoad = function(inst, data)
        if onload then onload(inst, data) end
        OnLoad(inst, data)
    end
end)
