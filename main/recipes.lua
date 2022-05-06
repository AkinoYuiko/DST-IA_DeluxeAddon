local env = env
local AddRecipe = GlassicAPI.AddRecipe
local SortAfter = GlassicAPI.RecipeSortAfter
GLOBAL.setfenv(1, GLOBAL)

AddRecipe("spice_jellyfish", {Ingredient("jellyfish_dead", 2), Ingredient("jellyfish", 1)}, TECH.FOODPROCESSING_ONE, {nounlock = true, numtogive = 2, nochar = true, builder_tag = "professionalchef"})
SortAfter("spice_jellyfish", "spice_salt")

AddRecipe("moonglassmachete", {Ingredient("twigs", 2), Ingredient("moonglass", 3)}, TECH.CELESTIAL_THREE, {nounlock = true, nomods = true})
SortAfter("moonglassmachete", "moonglassaxe")

if env.GetModConfigData("eyebrella_second_recipe") then
    AddRecipePostInit("eyebrellahat", function(recipe)
        local ingredient = recipe:FindAndConvertIngredient("deerclops_eyeball")
        if ingredient then
            ingredient:AddDictionaryPrefab("tigereye")
        end
    end)
end

if env.GetModConfigData("ancient_obsidian_workbench") then
    GlassicAPI.MergeTechBonus("OBSIDIAN_BENCH", "ANCIENT", 4)
end

if env.GetModConfigData("wx78_jellyfishbrain") then
    TECH.LOST.ROBOTMODULECRAFT = 10
end

-----------------------------------------------------------------------------------------------------
-- Night Stories compatible
local MOONROCK_TO_OBSIDIAN =
{
    "friendshipring",
    "friendshiptotem_dark",
    "friendshiptotem_light",
}

local DSTFIX_TABLE =
{
    "alterguardianhatshard",
}

env.AddSimPostInit(function()
    if TheWorld:HasTag("volcano") then
        for _, prefab in ipairs(MOONROCK_TO_OBSIDIAN) do
            local recipe = AllRecipes[prefab]
            if recipe then
                for _, ingredient in ipairs(recipe.ingredients) do
                    if ingredient.type == "moonrocknugget" then
                        ingredient.type = "obsidian"
                    end
                end
            end
        end
    end
    if TheWorld:HasTag("island") or TheWorld:HasTag("volcano") then
        for _, prefab in ipairs(DSTFIX_TABLE) do
            local recipe = AllRecipes[prefab]
            if recipe then
                for _, ingredient in ipairs(recipe.ingredients) do
                    if ingredient.type == "moonglass" then
                        ingredient.amount = 40
                    end
                end
            end
        end
    end
end)
