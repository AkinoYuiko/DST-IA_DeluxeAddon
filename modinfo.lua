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

version = "1.3"
-- version_title = zh_en("龙蝇的回归，以及更多的皮肤！", "The Return of Dragonfly, and more skins!")
name = zh_en("岛屿冒险：豪华补充包", "Island Adventures: Deluxe Addon")
author = "Civi, Tony"

description = zh_en(
    -- zh
"[版本: "..version..[[]

更新内容:
- 新道具：电水母粉（大厨沃利的料理站）。
- 合并物品栏道具为一个文件。
- 更新了部分文本。

"让你的岛屿冒险更加丰富！"]],
    -- en
"[Version: "..version..[[]

Changelog:
- Add Zappy Powder exclusive to Warly.
- Merge inventory images to one file.
- Update translations.

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


local function AddTitle(title, hover)
    return {
        name = title,
        hover = hover,
        options = {{description = "", data = false}},
        default = false
    }
end

local boolean = {
    {description = zh_en("启用", "Yes"), data = true},
    {description = zh_en("禁用", "No"),  data = false}
}

configuration_options = {
    AddTitle(zh_en("- 世界相关 -","- The World -")),
    {
        name = "dragoonfly",
        label = zh_en("龙蝇震撼回归火山", "Dragonfly"),
        hover = zh_en("龙蝇会刷新在火山区域", "Dragonfly spawns in the Volcano"),
        options = boolean,
        default = true
    },
    {
        name = "starstuff_octopusking",
        label = zh_en("用星杖交易换取月杖", "Star Stuff Trading"),
        hover = zh_en("月圆时可以与章鱼王交易换取", "Trade with Octopus King, only available during full moon"),
        options = boolean,
        default = true
    },
    AddTitle(zh_en("- 配方相关 -","- The Crafting -")),
    {
        name = "eyebrella_second_recipe",
        label = zh_en("虎鲨眼作为眼球伞的第二配方", "Tiger Eye as Eyebrella's ingredient"),
        -- hover = zh_en("启用一些奇怪的翻译", "Enable some strange zh translations"),
        options = boolean,
        default = true
    },
    AddTitle(zh_en("- 语言相关 -","- The Translator -")),
    {
        name = "e_yu",
        label = zh_en("使用鹅语","Enable 'e_yu'"),
        hover = zh_en("启用一些奇怪的翻译", "Enable some strange zh translations"),
        options = boolean,
        default = false
    }
}
