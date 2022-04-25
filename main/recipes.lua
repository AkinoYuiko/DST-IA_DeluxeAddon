local AddRecipe = GlassicAPI.AddRecipe
local SortAfter = GlassicAPI.RecipeSortAfter
local GetModConfigData = GetModConfigData
GLOBAL.setfenv(1, GLOBAL)

AddRecipe("spice_jellyfish", {Ingredient("jellyfish_dead", 2), Ingredient("jellyfish", 1)}, TECH.FOODPROCESSING_ONE, {nounlock = true, numtogive = 2, nochar = true, builder_tag = "professionalchef"})
SortAfter("spice_jellyfish", "spice_salt")

AddRecipe("moonglassmachete", {Ingredient("twigs", 2), Ingredient("moonglass", 3)}, TECH.CELESTIAL_THREE, {nounlock = true, nomods = true})
SortAfter("moonglassmachete", "moonglassaxe")

if GetModConfigData("eyebrella_second_recipe") then
    AddRecipePostInit("eyebrellahat", function(recipe)
        local ingredient = recipe:FindAndConvertIngredient("deerclops_eyeball")
        if ingredient then
            ingredient:AddDictionaryPrefab("tigereye")
        end
    end)
end
