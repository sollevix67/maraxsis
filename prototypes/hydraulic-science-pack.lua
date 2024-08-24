data:extend{{
    type = 'tool',
    name = 'h2o-hydraulic-science-pack',
    icon = '__dihydrogen-monoxide__/graphics/icons/hydraulic-science-pack.png',
    icon_size = 64,
    icon_mipmaps = nil,
    subgroup = 'science-pack',
    order = 'j[hydraulic-science-pack]',
    stack_size = 200,
    durability = data.raw.tool['automation-science-pack'].durability,
}}

data:extend{{
    type = 'technology',
    name = 'h2o-hydraulic-science-pack',
    icon = '__dihydrogen-monoxide__/graphics/technology/hydraulic-science-pack.png',
    icon_size = 256,
    icon_mipmaps = nil,
    effects = {
        {
            type = 'unlock-recipe',
            recipe = 'h2o-hydraulic-science-pack',
        },
    },
    unit = {
        count = 2500,
        ingredients = {
            {'automation-science-pack', 1},
            {'logistic-science-pack', 1},
            {'chemical-science-pack', 1},
            {'military-science-pack', 1},
            {'production-science-pack', 1},
            {'utility-science-pack', 1},
            --{'metallurgic-science-pack', 1},
            --{'electromagnetic-science-pack', 1},
            --{'agricultural-science-pack', 1},
        },
        time = 60,
    },
    prerequisites = {
        'h2o-maraxsis',
    },
    order = 'a',
}}

data:extend{{
    type = 'recipe',
    name = 'h2o-hydraulic-science-pack',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {'iron-plate', 1},
    },
    result = 'h2o-hydraulic-science-pack',
    result_count = 2,
}}