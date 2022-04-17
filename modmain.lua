local mainfiles =
{
    "assets",
    "prefabskin",
    "strings",

    "recipes",
    "spices",

    "dragoonfly",
    "octopusking",
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end
