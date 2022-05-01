if not GetModConfigData("starstuff_octopusking") then return end

local AddPrefabPostInit = AddPrefabPostInit
GLOBAL.setfenv(1, GLOBAL)


local function OnRefuseStarStaff()
    OCTOPUSKING_LOOT.chestloot["yellowstaff"] = nil
end

local function OnAcceptStarStaff()
    OCTOPUSKING_LOOT.chestloot["yellowstaff"] = "opalstaff"
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

    inst:WatchWorldState("startday", function(inst)
        OnRefuseStarStaff()
    end)

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad
end)
