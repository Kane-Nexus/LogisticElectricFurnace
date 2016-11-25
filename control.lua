require "util"
require "defines"
require "stdlib/entity/inventory"

local on_chest_created = nil
local on_chest_destroyed = nil

function getOrLoadCreatedEvent()
	if on_chest_created == nil then
		on_chest_created = script.generate_event_name()
	end
	return on_chest_created
end

function getOrLoadDestroyedEvent()
	if on_chest_destroyed == nil then
		on_chest_destroyed = script.generate_event_name()
	end
	return on_chest_destroyed
end

function generateEvents()
	getOrLoadCreatedEvent()
	getOrLoadDestroyedEvent()
end

script.on_load(function()
	generateEvents()
end)

script.on_init(function()
	generateEvents()
end)

script.on_event(defines.events.on_built_entity, function(event)
	local entity = event.created_entity
	local player = game.players[event.player_index]
	if entity.name == "logistic-electric-furnace" then
		local direction = entity.direction
		-- Don't want any duplicate dummy chests
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position) 
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
	end
	if entity.name == "logistic-electric-furnace" then
		insertDummyItem(entity.surface, "lef-passive-provider-chest", entity.position, entity.force)
		insertDummyItem(entity.surface, "lef-requester-chest", entity.position, entity.force)
	end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	local entity = event.created_entity
	-- Don't want any duplicate dummy chests
	removeDummy(entity.surface, "lef-passive-provider-chest", entity.position) 
	removeDummy(entity.surface, "lef-requester-chest", entity.position) 
	if entity.name == "logistic-electric-furnace" then
		-- Replace vanilla electric furnace with logistic electric furnace
		orderEntityDeconstruction(entity.surface, "electric-furnace", entity.position) 
	end
	if entity.name == "logistic-electric-furnace" then
		insertDummyItem(entity.surface, "lef-passive-provider-chest", entity.position, entity.force)
		insertDummyItem(entity.surface, "lef-requester-chest", entity.position, entity.force)
	end
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	local entity = event.entity
	if (entity.type == "logistic-electric-furnace") then
		emptyChests(entity.logistic-electric-furnace)
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position)
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
	end
	if (entity.type == "lef-passive-provider-chest") then
		emptyChests(entity.logistic-electric-furnace)
		removeDummy(entity.surface, "logistic-electric-furnace", entity.position)
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
	end
	if (entity.type == "lef-requester-chest") then
		emptyChests(entity.logistic-electric-furnace)
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position)
		removeDummy(entity.surface, "logistic-electric-furnace", entity.position)
	end
end)

script.on_event(defines.events.on_robot_pre_mined, function(event) 
	-- The dummy chest can't actually be robo-deconstructed, so we don't have to worry about it
	local entity = event.entity
	if entity.name == "logistic-electric-furnace" then
		emptyChests(entity.logistic-electric-furnace)
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position)
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
	end
end)

script.on_event(defines.events.on_entity_died, function(event) 
	-- The dummy chest also can't die (indestructible), so we don't have to worry about it
	local entity = event.entity
	if entity.name == "logistic-electric-furnace" then
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position)
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
	end
end)

-- script.on_event(defines.events.on_train_changed_state, function(event)
