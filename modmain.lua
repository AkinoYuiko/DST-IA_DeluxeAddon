local mainfiles =
{
    "assets",
    "prefabskin",
    "strings",

    "dragoonfly"
}

for _, file in ipairs(mainfiles) do
    modimport("main/" .. file)
end