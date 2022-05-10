local strings =
{
    NAMES =
    {
        SPICE_JELLYFISH = "Zappy Powder",
        SPICE_JELLYFISH_FOOD = "Zappy {food}",
        MOONGLASSMACHETE = "Moon Glass Machete",
    },
    RECIPE_DESC =
    {
        SPICE_JELLYFISH = "The feeling of volt jelly.",
        MOONGLASSMACHETE = STRINGS.RECIPE_DESC.MOONGLASSAXE,
    },
    CHARACTERS =
    {
        GENERIC =
        {
            DESCRIBE =
            {
                SPICE_JELLYFISH = "Zap left.",
                MOONGLASSMACHETE = STRINGS.CHARACTERS.GENERIC.DESCRIBE.MOONGLASSAXE,
            }
        }
    },
    SKIN_NAMES =
    {
        cutlass_malbatross = STRINGS.NAMES.MALBATROSS_BEAK,
        double_umbrellahat_summer = "Summerella",
        aerodynamichat_shark = "Sharkness",
        spear_obsidian_spinner = "Spinner",
    }
}

GlassicAPI.MergeStringsToGLOBAL(strings)
GlassicAPI.MergeTranslationFromPO(MODROOT.."languages")

if GetModConfigData("e_yu") then
    GlassicAPI.MergeTranslationFromPO(MODROOT.."languages/e_yu")
end

function UpdateIADStrings()
    local file, errormsg = io.open(MODROOT .. "languages/strings.pot", "w")
    if not file then
        print("Can't generate " .. MODROOT .. "languages/strings.pot" .. "\n" .. tostring(errormsg))
        return
    end
    GlassicAPI.MakePOTFromStrings(file, strings)
end
