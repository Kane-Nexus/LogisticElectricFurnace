data:extend({
{
    type = "technology",
    name = "logistic-material-processing",
    icon = "__Logistic_Furnace__/graphics/technology/logistic-material-processing64.png",
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