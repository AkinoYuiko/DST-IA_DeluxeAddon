local AddRecipe = GlassicAPI.AddRecipe
local SortAfter = GlassicAPI.SortAfter
local GetModConfigData = GetModConfigData
GLOBAL.setfenv(1, GLOBAL)

AddRecipe("spice_jellyfish", {Ingredient("jellyfish_dead", 3), Ingredient("jellyfish", 1)}, TECH.FOODPROCESSING_ONE, {nounlock = true, numtogive = 2, builder_tag = "professionalchef"})
SortAfter("spice_jellyfish", "spice_salt", "CRAFTING_STATION")

if not GetModConfigData("eyebrella_second_recipe") then return end

AddRecipePostInit("eyebrellahat", function(recipe)
    local ingredient = recipe:FindAndConvertIngredient("deerclops_eyeball")
    if ingredient then
        ingredient:AddDictionaryPrefab("tigereye")
    end
end)
