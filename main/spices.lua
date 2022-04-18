local env = env
GLOBAL.setfenv(1, GLOBAL)

local function oneaten_jellyfish(inst, eater)
    eater:AddDebuff("buff_electricattack", "buff_electricattack")
end

IA_SPICES = {
    SPICE_JELLYFISH = {
        oneatenfn = oneaten_jellyfish,
        prefabs = {"buff_electricattack"}
    }
}

local ia_foods = {}
local ia_spiced_foods = {}
for name, recipe in pairs(IA_PREPAREDFOODS) do
    if recipe.spice == nil then
        ia_foods[name] = recipe
        for spice_name in pairs(IA_SPICES) do
            local spiced_food = name .. "_" .. string.lower(spice_name)
            ia_spiced_foods[spiced_food] = true
        end
    end
end

require("cooking" )
local spicedfoods = require("spicedfoods")
local UpvalueUtil = require("upvalueutil")

local SPICES = UpvalueUtil.GetUpvalue(GenerateSpicedFoods, "SPICES")
if not SPICES then return end
shallowcopy(IA_SPICES, SPICES)

GenerateSpicedFoods(require("preparedfoods"))
GenerateSpicedFoods(require("preparedfoods_warly"))
GenerateSpicedFoods(ia_foods)

local ia_spiced = {}
for name, recipe in pairs(spicedfoods) do
    if IA_SPICES[recipe.spice] then
        if ia_spiced_foods[name] then
            env.AddCookerRecipe("portablespicer", recipe) -- SB
        else
            AddCookerRecipe("portablespicer", recipe)
        end
        if ia_spiced_foods[name] then
            ia_spiced[name] = recipe
        end
    end
end

IA_PREPAREDFOODS = MergeMaps(IA_PREPAREDFOODS, ia_spiced)

------------------------------------------------

local anim_state_override_symbol = AnimState.OverrideSymbol
function AnimState:OverrideSymbol(symbol, override_build, override_symbol, ...)
    if symbol == "swap_garnish" and override_build == "spices" and IA_SPICES[override_symbol:upper()] then
        override_build = "ia_spices"
    end
    return anim_state_override_symbol(self, symbol, override_build, override_symbol, ...)
end
