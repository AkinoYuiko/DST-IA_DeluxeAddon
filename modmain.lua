local mainfiles =
{
    "assets",
    "prefabskin",
    -- "strings",

    "recipes",

    "dragoonfly",
    "octopusking",
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end
