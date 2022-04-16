GLOBAL.setfenv(1, GLOBAL)

local strings = {}

GlassicAPI.MergeStringsToGLOBAL(strings)
GlassicAPI.MergeTranslationFromPO(MODROOT.."languages")

UpdateIADEStrings = function()
    local file, errormsg = io.open(MODROOT .. "languages/strings.pot", "w")
    if not file then
        print("Can't generate " .. MODROOT .. "languages/strings.pot" .. "\n" .. tostring(errormsg))
        return
    end
    GlassicAPI.MakePOTFromStrings(file, strings)
end