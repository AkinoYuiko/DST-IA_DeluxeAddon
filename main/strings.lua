local MODROOT = MODROOT
local GetModConfigData = GetModConfigData
GLOBAL.setfenv(1, GLOBAL)

local strings =
{
    NAMES =
    {
        SPICE_JELLYFISH = "Zappy Powder",
        SPICE_JELLYFISH_FOOD = "Zappy {food}",
    },
    RECIPE_DESC =
    {
        SPICE_JELLYFISH = "The feeling of volt jelly.",
    },
    CHARACTERS =
    {
        GENERIC =
        {
            DESCRIBE =
            {
                SPICE_JELLYFISH = "Zap left.",
            }
        }
    },
    SKIN_NAMES =
    {
        cutlass_malbatross = STRINGS.NAMES.MALBATROSS_BEAK,
    }
}

GlassicAPI.MergeStringsToGLOBAL(strings)
GlassicAPI.MergeTranslationFromPO(MODROOT.."languages")

if GetModConfigData("e_yu") then
    GlassicAPI.MergeTranslationFromPO(MODROOT.."languages/e_yu")
end

UpdateIADEStrings = function()
    local file, errormsg = io.open(MODROOT .. "languages/strings.pot", "w")
    if not file then
        print("Can't generate " .. MODROOT .. "languages/strings.pot" .. "\n" .. tostring(errormsg))
        return
    end
    GlassicAPI.MakePOTFromStrings(file, strings)
end
