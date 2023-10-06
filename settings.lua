data:extend({
  {
    type = "string-setting",
    name = "ol-graphic-preset",
    localised_name = "Choose loaders' graphics",
    setting_type = "startup",
    default_value = "Miniloader",
    allowed_values = { "AAI", "Miniloader", "Krastorio2" },
    order = "a",
  },
  {
    type = "bool-setting",
    name = "ol-SE-reskin",
    localised_name = "Reskin regular belts",
    localised_description = "Reskin regular belts using Space Exploration's deep space graphics. Recommended only for AAI graphics set",
    setting_type = "startup",
    default_value = false,
    order = "b",
  },
})