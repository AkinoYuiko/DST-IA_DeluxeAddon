if not GetModConfigData("starstuff_octopusking") then return end

local AddPrefabPostInit = AddPrefabPostInit
GLOBAL.setfenv(1, GLOBAL)

OCTOPUSKING_LOOT.chestloot["yellowstaff"] = "opalstaff"

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

    inst.sleeping = false
end

local function FinishedTrading(inst)
    inst.components.trader:Disable()
    inst.AnimState:PlayAnimation("sleep_pre")

    if inst.sleepfn then
        inst:RemoveEventCallback("animover", inst.sleepfn)
        inst.sleepfn = nil
    end

    inst.sleepfn = function(inst)
        inst.AnimState:PlayAnimation("sleep_loop")
        inst.SoundEmitter:PlaySound("ia/creatures/octopus_king/sleep")
    end

    inst:ListenForEvent("animover", inst.sleepfn)

    inst.sleeping = true
end

local function UpdateMultiplayer(inst)
    local pos = inst:GetPosition()
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 40, "player")
    local shouldsleep = true
    for i,v in ipairs(ents) do
        if v.userid ~= nil and inst.tradelist[v.userid] == nil then
            shouldsleep = false
        end
    end
    if not inst.sleeping and shouldsleep then
        FinishedTrading(inst)
    elseif not shouldsleep and inst.sleeping and ( not TheWorld.state.isnight or TheWorld.state.moonphase == "full" ) then
        StartTrading(inst)
    end
end

AddPrefabPostInit("octopusking", function(inst)
    if not TheWorld.ismastersim then return end
    local _testfn = inst.components.trader and inst.components.trader.test

    if _testfn then
        inst.components.trader:SetAcceptTest(function(_inst, _item, _giver)
            if _item.prefab == "yellowstaff" and not TheWorld.state.moonphase == "full" then
                return
            else
                return _testfn(_inst, _item, _giver)
            end
        end)
    end

    local startnight = inst.worldstatewatching.startnight
    if startnight then
        inst:WatchWorldState("startnight", function(inst)
            if not TheWorld.state.moonphase == "full" then
                FinishedTrading(inst)
            end
        end)
    end

    if inst._multiplayertask then
        inst._multiplayertask:Cancel()
        inst._multiplayertask = inst:DoPeriodicTask(1, UpdateMultiplayer)
    end
end)
