data:extend({ 
 
 {
    type = "furnace",
    name = "logistic-electric-furnace",
    icon = "__Logistic_Furnace__/graphics/icons/logistic-electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "logistic-electric-furnace"},
    max_health = 200,
	supply_area_distance = 2.5,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    light = {intensity = 1, size = 10},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 3,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"lef-recipe"},
    result_inventory_size = 4,
    crafting_speed = 2,
    energy_usage = "200kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.005
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
    animation =
    {
      filename = "__Logistic_Furnace__/graphics/entity/logistic-electric-furnace/logistic-electric-furnace-base.png",
      priority = "high",
      width = 129,
      height = 100,
      frame_count = 1,
      shift = {0.421875, 0}
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
          priority = "high",
          width = 25,
          height = 15,
          frame_count = 12,
          animation_speed = 0.5,
          shift = {0.015625, 0.890625}
        },
        light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}}
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
          priority = "high",
          width = 19,
          height = 13,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {-0.671875, -0.640625}
        }
      },
      {
        animation =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
          priority = "high",
          width = 12,
          height = 9,
          frame_count = 4,
          animation_speed = 0.5,
          shift = {0.0625, -1.234375}
        }
      }
    },
    fast_replaceable_group = "furnace"
  },
  {
        type = "logistic-container",
        name = "logistic-electric-furnace-logistic-chest-active-provider",
        icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
        flags = {"placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-electric-furnace-logistic-chest-active-provider"},
        max_health = 150,
        selectable_in_game = false,
        corpse = "small-remnants",
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.15, -0.15}, {0.15, 0.15}},
        fast_replaceable_group = "container",
        inventory_size = 4,
        logistic_mode = "active-provider",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        picture =
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-active-provider.png",
          priority = "extra-high",
          width = 0,
          height = 0,
          shift = {0, 0}
        }
     },
	 {
        type = "logistic-container",
        name = "logistic-electric-furnace-logistic-chest-requester",
        icon = "__base__/graphics/icons/logistic-chest-requester.png",
        flags = {"placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "logistic-electric-furnace-logistic-chest-requester"},
        max_health = 150,
        selectable_in_game = false,
        corpse = "small-remnants",
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.15, -0.15}, {0.15, 0.15}},
        fast_replaceable_group = "container",
        inventory_size = 3,
        logistic_mode = "requester",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        picture =
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
          priority = "extra-high",
          width = 0,
          height = 0,
          shift = {0, 0}
        }
     }
})