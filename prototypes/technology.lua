data:extend({
{
    type = "technology",
    name = "logistic-material-processing",
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "logistic-electric-furnace"
      }
    },
    prerequisites = {"advanced-material-processing-2", "construction-robotics", "logistic-robotics", "logistic-system"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
		{"science-pack-3", 1},
      },
      time = 30
    },
    order = "c-c-c"
  }
})