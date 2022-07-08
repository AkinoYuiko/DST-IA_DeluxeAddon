local mainfiles =
{
    "assets",
    "tuning",
    "strings",
    "prefabskin",

    "recipes",
    "spices",

    -- "flood",
}

local postinits =
{
    components =
    {
        "obsidiantool",
    },
    prefabs =
    {
        "dragoonfly",
        "glasscutter",
        "kraken",
        "octopusking",
    },
    "buff_oneaten",
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end

for index, files in pairs(postinits) do
    if type(files) == "table" then
        for _, file in ipairs(files) do
            modimport("postinit/".. index .. "/" .. file)
        end
    elseif type(files) == "string" then
        modimport("postinit/".. files)
    end
end
