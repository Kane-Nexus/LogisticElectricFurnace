data:extend({
 {
    type = "recipe",
    name = "logistic-electric-furnace",
    ingredients = {{"electric-furnace", 1}, {"logistic-chest-passive-provider", 1}, {"logistic-chest-requester", 1}},
    result = "logistic-electric-furnace",
    energy_required = 4,
    enabled = false
 },

  {
    type = "recipe-category",
    name = "lef-recipe"
  },
  {
    type = "recipe",
    name = "iron-ore-steel",
    category = "lef-recipe",
    enabled = true,
    energy_required = 21,
    ingredients = {{"iron-ore", 5}},
    result = "steel-plate"
  },
  {
    type = "recipe",
    name = "iron-ore-iron",
    category = "lef-recipe",
    enabled = true,
    energy_required = 3.5,
    ingredients = {{"iron-ore", 1}},
    result = "iron-plate"
  },
  {
    type = "recipe",
    name = "copper-ore-copper",
    category = "lef-recipe",
    enabled = true,
    energy_required = 3.5,
    ingredients = {{"copper-ore", 1}},
    result = "copper-plate"
  },
  {
    type = "recipe",
    name = "stone-ore-brick",
    category = "lef-recipe",
    enabled = true,
    energy_required = 3.5,
    ingredients = {{"stone", 2}},
    result = "stone-brick"
  }
  
})