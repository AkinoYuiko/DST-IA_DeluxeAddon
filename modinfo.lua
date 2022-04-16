local function loc(t)
    t.zhr = t.zh
    t.zht = t.zht or t.zh
    return t[locale] or t.en
end

local function zh_en(a, b)
    return loc({
        zh = a,
        en = b
    })
end

version = "1.2"
-- version_title = zh_en("龙蝇的回归，以及更多的皮肤！", "The Return of Dragonfly, and more skins!")
name = zh_en("岛屿冒险：豪华补充包", "Island Adventures: Deluxe Addon")
author = "Civi, Tony"

description = zh_en(
    -- zh
"[版本: "..version..[[]

更新内容:
- 在月圆时可以用星杖跟章鱼王交换月杖。
- 剑鱼剑现在拥有“邪天翁喙”的皮肤（部分细节尚不完善）。
- 调整了龙蝇的掉落物表。

"让你的岛屿冒险更加丰富！"]],
    -- en
"[Version: "..version..[[]

Changelog:
- Star Staff become tradable with Octopus King during full moon.
- Cutlass has a new skin.
- Tweak loot table of Dragonfly.

"Make IA great L again."]]
)

api_version = 10
dst_compatible = true
all_clients_require_mod = true

icon_atlas = "images/modicon.xml"
icon = "modicon.tex"

server_filter_tags =
{
    "island_adventures",
	"island adventures",
	"island",
	"adventures",
	"shipwrecked",
}

folder_name = folder_name or "workshop-"
if not folder_name:find("workshop-") then
    name = name .. " - DEV"
end

mod_dependencies = {
    {    -- Glassic API
        workshop = "workshop-2521851770",
        ["GlassicAPI"] = false,
        ["Glassic API - DEV"] = true
    },
    {    -- Island Adventures
        workshop = "workshop-1467214795",
        ["IslandAdventures"] = false,
        ["Island Adventures - GitLab Ver."] = true
    },
}
