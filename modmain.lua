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
    -- components
    "components/obsidiantool",
    -- prefabs
    "prefabs/book_toggledownfall",
    "prefabs/dragoonfly",
    "prefabs/glasscutter",
    "prefabs/kraken",
    "prefabs/octopusking",

    -- root
    "buff_oneaten",
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end

for _, file in ipairs(postinits) do
    modimport("postinit/" .. file)
end
