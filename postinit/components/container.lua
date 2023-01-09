if not GetModConfigData("moonglass_octopusking") then return end

GLOBAL.setfenv(1, GLOBAL)

local Container = require "components/container"
local Container_GiveItem = Container.GiveItem
function Container:GiveItem(item, ...)
    local inst = self.inst
    if inst.prefab == "octopuschest" and item.prefab == "dubloon" and TheWorld.state.moonphase == "full" then
        Container_GiveItem(self, SpawnPrefab("moonglass"), ...)
        item:Remove()
    else
        Container_GiveItem(self, item, ...)
    end
end
