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
local function moon2obs_postinit(recipe)
    for _, v in ipairs(recipe.ingredients) do
        if v.type == "moonrocknugget" then
            v.type = "obsidian"
        end
    end
end

local MOONROCK_TO_OBSIDIAN =
{
    "friendshipring",
    "friendshiptotem_dark",
    "friendshiptotem_light",
}

for _, v in ipairs(MOONROCK_TO_OBSIDIAN) do
    env.AddRecipePostInit(v, moon2obs_postinit)
end

-- DST Fixed compatible
env.AddRecipePostInit("alterguardianhatshard", function(recipe)
    for _, v in ipairs(recipe.ingredients) do
        if v.type == "moonglass" then
            v.amount = 40
        end
    end
end)
