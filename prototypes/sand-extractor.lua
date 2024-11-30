data:extend{{
    type = "recipe-category",
    name = "maraxsis-sand-extraction"
}}

data:extend{{
    type = "recipe",
    name = "sand",
    category = "maraxsis-sand-extraction",
    energy_required = 10,
    ingredients = {},
    results = {
        {type = "item", name = "sand", amount = 1}
    },
    enabled = false,
    show_amount_in_title = false,
    allow_decomposition = false,
    allow_productivity = true,
}}

for i = 1, 10 do
    local mining_productivity = data.raw["technology"]["mining-productivity-" .. i]
    if not mining_productivity then break end

    table.insert(mining_productivity.effects, {
        type = "change-recipe-productivity",
        recipe = "sand",
        change = 0.1,
        hidden = true
    })
end

for extractor in pairs(maraxsis.MARAXSIS_SAND_EXTRACTORS) do
    if not data.raw["mining-drill"][extractor] then error("Invalid sand extractor: " .. extractor) end
    local extractor = table.deepcopy(data.raw["mining-drill"][extractor])
    extractor.type = "assembling-machine"
    extractor.crafting_categories = {"maraxsis-sand-extraction"}
    extractor.placeable_by = {item = extractor.name, count = 1}
    extractor.localised_name = extractor.localised_name or {"entity-name." .. extractor.name}
    extractor.localised_description = extractor.localised_description or {"?", {"entity-description." .. extractor.name}, ""}
    extractor.hidden_in_factoriopedia = true
    extractor.fixed_recipe = "sand"
    extractor.fixed_quality = "normal"
    extractor.crafting_speed = extractor.mining_speed
    extractor.mining_speed = nil
    extractor.allowed_effects = {"productivity", "consumption", "speed", "pollution", "quality"}
    extractor.resource_drain_rate_percent = nil
    extractor.name = extractor.name .. "-sand-extractor"
    data:extend{extractor}
end