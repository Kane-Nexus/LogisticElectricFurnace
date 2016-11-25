data:extend({
  {
    type = "recipe",
    name = "logistic-electric-furnace-iron",
    ingredients = {{"electric-furnace", 1}, {"iron-plate", 1}, {"logistic-chest-passive-provider", 1}, {"logistic-chest-requester", 1}},
    result = "logistic-electric-furnace-iron",
    energy_required = 4,
    enabled = false
  },
  {
    type = "recipe",
    name = "logistic-electric-furnace-copper",
    ingredients = {{"electric-furnace", 1}, {"copper-plate", 1}, {"logistic-chest-passive-provider", 1}, {"logistic-chest-requester", 1}},
    result = "logistic-electric-furnace-copper",
    energy_required = 4,
    enabled = false
  },
  {
    type = "recipe",
    name = "logistic-electric-furnace-steel",
    ingredients = {{"electric-furnace", 1}, {"steel-plate", 1}, {"logistic-chest-passive-provider", 1}, {"logistic-chest-requester", 1}},
    result = "logistic-electric-furnace-steel",
    energy_required = 4,
    enabled = false
  },
  {
    type = "recipe",
    name = "logistic-electric-furnace-brick",
    ingredients = {{"electric-furnace", 1}, {"stone-brick", 1}, {"logistic-chest-passive-provider", 1}, {"logistic-chest-requester", 1}},
    result = "logistic-electric-furnace-brick",
    energy_required = 4,
    enabled = false
  },
  {
    type = "recipe-category",
    name = "lef-recipe-steel"
  },
  {
    type = "recipe",
    name = "iron-ore-steel",
    category = "lef-recipe-steel",
    enabled = true,
    energy_required = 21,
    ingredients = {{"iron-ore", 5}},
    result = "steel-plate"
  },
  {
    type = "recipe-category",
    name = "lef-recipe-iron"
  },
  {
    type = "recipe",
    name = "iron-ore-iron",
    category = "lef-recipe-iron",
    enabled = true,
    energy_required = 3.5,
    ingredients = {{"iron-ore", 1}},
    result = "iron-plate"
  },
  {
    type = "recipe-category",
    name = "lef-recipe-copper"
  },
  {
    type = "recipe",
    name = "copper-ore-copper",
    category = "lef-recipe-copper",
    enabled = true,
    energy_required = 3.5,
    ingredients = {{"copper-ore", 1}},
    result = "copper-plate"
  },
  {
    type = "recipe-category",
    name = "lef-recipe-brick"
  },
  {
    type = "recipe",
    name = "stone-ore-brick",
    category = "lef-recipe-brick",
    enabled = true,
    energy_required = 3.5,
    ingredients = {{"stone", 2}},
    result = "stone-brick"
  }
  
})