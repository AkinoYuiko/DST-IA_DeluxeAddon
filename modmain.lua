local mainfiles =
{
    "assets",
    "tuning",
    "strings",
    "prefabskin",

    "recipes",
    "spices",
}

local postinits =
{
    -- "boatlamps",  -- committed fix to IA.
    "dragoonfly",
    "glasscutter",
    "octopusking",
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end

for _, file in ipairs(postinits) do
    modimport("postinit/" .. file)
end
