GLOBAL.AddRecipePostInit("eyebrellahat", function(recipe)
    local ingredient = recipe:FindAndConvertIngredient("deerclops_eyeball")
    if ingredient then
        ingredient:AddDictionaryPrefab("tigereye")
    end
end)
