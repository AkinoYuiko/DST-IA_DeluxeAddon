local StaticLayout = require("map/static_layout")
local AllLayouts = require("map/layouts").Layouts

AllLayouts["VolcanoDragonflyArena"] = StaticLayout.Get("map/static_layouts/volcano_dragonfly")
AllLayouts["VolcanoDragonflyArena"].ground_types = {GROUND.BRICK_GLOW}

AddTaskSetPreInit("volcanoset", function(task_set_data)
    task_set_data.set_pieces.VolcanoDragonflyArena = {count = 1 , tasks = {"volcano"}}
end)
