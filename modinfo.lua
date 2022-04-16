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

version = "1.1"
-- version_title = zh_en("龙蝇的回归，以及更多的皮肤！", "The Return of Dragonfly, and more skins!")
name = zh_en("岛屿冒险：豪华补充包", "Island Adventures: Deluxe Addon")
author = "Civi, Tony"

description = zh_en(
    -- zh
"[版本: "..version..[[]

更新内容:
- 修复一个环境变量问题。

- 初次更新。
- 龙蝇加入火山。
- 修改了一部分文本。

"让IA再次XXL。"]],
    -- en
"[Version: "..version..[[]

Changelog:
- Fix an env bug.

- First init.
- Dragonfly now spawns in the volcano.

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
