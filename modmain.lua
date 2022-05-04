local mainfiles =
{
    "assets",
    "tuning",
    "strings",
    "prefabskin",

    "recipes",
    "spices",

    "flood",
}

local postinits =
{
    -- "boatlamps",  -- committed fix to IA.
    "buff_oneaten",
    prefabs =
    {
        "dragoonfly",
        "glasscutter",
        "kraken",
        "octopusking",
    }
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end

for index, files in pairs(postinits) do
    if type(files) == "table" then
        for _, file in ipairs(files) do
            modimport("postinit/".. index .. "/" .. file)
        end
    else
        modimport("postinit/".. files)
    end
end
