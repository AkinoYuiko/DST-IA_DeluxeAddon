if not GetModConfigData("eyebrella_second_recipe") then return end

GLOBAL.AddRecipePostInit("eyebrellahat", function(recipe)
    local ingredient = recipe:FindAndConvertIngredient("deerclops_eyeball")
    if ingredient then
        ingredient:AddDictionaryPrefab("tigereye")
    end
end)
