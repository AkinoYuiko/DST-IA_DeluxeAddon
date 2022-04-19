local mainfiles =
{
    "assets",
    "prefabskin",
    "strings",

    "recipes",
    "spices",
}

local postinits =
{
    "boatlamps",
    "dragoonfly",
    "octopusking"
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end

for _, file in ipairs(postinits) do
    modimport("main/" .. file)
end
