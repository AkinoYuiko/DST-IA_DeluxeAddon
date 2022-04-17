local MODROOT = MODROOT
local GetModConfigData = GetModConfigData
GLOBAL.setfenv(1, GLOBAL)

local strings =
{
    SKIN_NAMES =
    {
        cutlass_malbatross = STRINGS.NAMES.MALBATROSS_BEAK
    }
}

GlassicAPI.MergeStringsToGLOBAL(strings)
if GetModConfigData("e_yu") then
    GlassicAPI.MergeTranslationFromPO(MODROOT.."languages")
end

UpdateIADEStrings = function()
    local file, errormsg = io.open(MODROOT .. "languages/strings.pot", "w")
    if not file then
        print("Can't generate " .. MODROOT .. "languages/strings.pot" .. "\n" .. tostring(errormsg))
        return
    end
    GlassicAPI.MakePOTFromStrings(file, strings)
end
