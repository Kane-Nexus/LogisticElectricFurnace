data:extend({
{
    type = "item",
    name = "logistic-electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"goes-to-quickbar"},
    subgroup = "smelting-machine",
    order = "d[logistic-electric-furnace]",
    place_result = "logistic-electric-furnace",
    stack_size = 50
  },
  {
        type = "item",
        name = "logistic-electric-furnace-logistic-chest-active-provider",
        icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
        flags = {"goes-to-quickbar"},
        subgroup = "logistic-network",
        order = "b[storage]-c[logistic-chest-active-provider]",
        place_result = "logistic-electric-furnace-logistic-chest-active-provider",
        stack_size = 50
    },
  {
        type = "item",
        name = "logistic-electric-furnace-logistic-chest-requester",
        icon = "__base__/graphics/icons/logistic-chest-requester.png",
        flags = {"goes-to-quickbar"},
        subgroup = "logistic-network",
        order = "b[storage]-c[logistic-chest-requester]",
        place_result = "logistic-electric-furnace-logistic-chest-requester",
        stack_size = 50
    }
  
})