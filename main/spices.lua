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

require("cooking" )
local spicedfoods = require("spicedfoods")
local UpvalueUtil = require("upvalueutil")
local wx78_chargable = env.GetModConfigData("wx78_charge_via_zappy_food") and 1 or nil

local SPICES = UpvalueUtil.GetUpvalue(GenerateSpicedFoods, "SPICES")
if not SPICES then return end
shallowcopy(IA_SPICES, SPICES)

GenerateSpicedFoods(require("preparedfoods"))
GenerateSpicedFoods(require("preparedfoods_warly"))

for name, recipe in pairs(spicedfoods) do
    if IA_SPICES[recipe.spice] then
        AddCookerRecipe("portablespicer", recipe)
        if recipe.spice == "SPICE_JELLYFISH" then
            TUNING.WX78_CHARGING_FOODS[name] = wx78_chargable or TUNING.WX78_CHARGING_FOODS[name]
        end
    end
end

local _spicedfoods = shallowcopy(spicedfoods)
local ia_foods = {}
for name, recipe in pairs(IA_PREPAREDFOODS) do
    if recipe.spice == nil then
        ia_foods[name] = recipe
    end
end
GenerateSpicedFoods(ia_foods)
local ia_spiced = {}
for name, recipe in pairs(spicedfoods) do
    if not _spicedfoods[name] then
        ia_spiced[name] = recipe
    end
end
for name, recipe in pairs(ia_spiced) do
    env.AddCookerRecipe("portablespicer", recipe)
    if recipe.spice == "SPICE_JELLYFISH" then
        TUNING.WX78_CHARGING_FOODS[name] = wx78_chargable or TUNING.WX78_CHARGING_FOODS[name]
    end
    IA_PREPAREDFOODS[name] = recipe
end

TUNING.WX78_CHARGING_FOODS["jellyfish_dead"] = wx78_chargable or TUNING.WX78_CHARGING_FOODS["jellyfish_dead"]
------------------------------------------------

local anim_state_override_symbol = AnimState.OverrideSymbol
function AnimState:OverrideSymbol(symbol, override_build, override_symbol, ...)
    if symbol == "swap_garnish" and override_build == "spices" and IA_SPICES[override_symbol:upper()] then
        override_build = "ia_spices"
    end
    return anim_state_override_symbol(self, symbol, override_build, override_symbol, ...)
end
