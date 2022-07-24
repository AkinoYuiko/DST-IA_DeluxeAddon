if not GetModConfigData("dragoonfly") then return end
local AddLevelPreInit = AddLevelPreInit
local StaticLayout = require("map/static_layout")
local AllLayouts = require("map/layouts").Layouts
GLOBAL.setfenv(1, GLOBAL)

AllLayouts["VolcanoDragonflyArena"] = StaticLayout.Get("map/static_layouts/volcano_dragonfly")
AllLayouts["VolcanoDragonflyArena"].ground_types = {WORLD_TILES.BRICK_GLOW}

AddLevelPreInit("VOLCANO_LEVEL", function(level)
    level.set_pieces = level.set_pieces or {}
    level.require = level.require or {}

    level.set_pieces.VolcanoDragonflyArena = {count = 1, tasks = {"Volcano"}}
    table.insert(level.require, "dragonfly_spawner")
end)
