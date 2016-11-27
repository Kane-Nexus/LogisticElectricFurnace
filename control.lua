require "config"

if not on_chest_created then on_chest_created = nil end
if not on_chest_destroyed then on_chest_destroyed = nil end
if not created_requesters then created_requesters = {} end
if not created_providers then created_providers = {} end
if not created_furnace then created_furnace = 0 end


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
	if entity.name == "logistic-electric-furnace-iron" or entity.name == "logistic-electric-furnace-copper" or entity.name == "logistic-electric-furnace-steel" or entity.name == "logistic-electric-furnace-brick" then
		-- Don't want any duplicate dummy chests
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position) 
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
		-- Create new chests
		insertDummyItem(entity.surface, "lef-passive-provider-chest", entity.position, entity.force, entity.name)
		insertDummyItem(entity.surface, "lef-requester-chest", entity.position, entity.force, entity.name)
	end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	local entity = event.created_entity
	if entity.name == "logistic-electric-furnace-iron" or entity.name == "logistic-electric-furnace-copper" or entity.name == "logistic-electric-furnace-steel" or entity.name == "logistic-electric-furnace-brick" then
		-- Don't want any duplicate dummy chests
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position) 
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
		-- Create new chests
		insertDummyItem(entity.surface, "lef-passive-provider-chest", entity.position, entity.force, entity.name)
		insertDummyItem(entity.surface, "lef-requester-chest", entity.position, entity.force, entity.name)
	end
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	local entity = event.entity
	if (entity.type == "furnace") or (entity.name == "lef-passive-provider-chest") or (entity.name == "lef-requester-chest") then
		-- syncChests(entity)
		removeDummy(entity.surface, "lef-passive-provider-chest", entity.position)
		removeDummy(entity.surface, "lef-requester-chest", entity.position)
	end
end)

script.on_event(defines.events.on_robot_pre_mined, function(event) 
	-- The dummy chest can't actually be robo-deconstructed, so we don't have to worry about it
	local entity = event.entity
	if (entity.type == "furnace") or (entity.name == "lef-passive-provider-chest") or (entity.name == "lef-requester-chest") then
		-- syncChests(entity)
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

function syncChests(furnace)
	for i = 1, #furnace.cargo_wagons do
		local wagon = furnace.cargo_wagons[i]
		if wagon.type == "cargo-wagon" then
			prepareDeparture(wagon, "requester-chest-from-wagon")
			prepareDeparture(wagon, "passive-provider-chest-from-wagon")
			prepareDeparture(wagon, "active-provider-chest-from-wagon")
			prepareDeparture(wagon, "storage-chest-from-wagon")
			game.raise_event(on_chest_destroyed, {wagon_index=i, furnace=furnace})
		end
	end
end

function insertDummyItem(surface, chestName, chestPosition, chestForce, entityName)
	local dummy = surface.create_entity({name = chestName, position = chestPosition, force = chestForce})
	dummy.insert{name=chestName, count=1}
	if chestName == "lef-requester-chest" then
		if entityName == "logistic-electric-furnace-iron" then
			dummy.set_request_slot({name = "iron-ore", count = lefRequestedIron}, 1)
		elseif entityName == "logistic-electric-furnace-copper" then
			dummy.set_request_slot({name = "copper-ore", count = lefRequestedCopper}, 1)
		elseif entityName == "logistic-electric-furnace-steel" then
			dummy.set_request_slot({name = "iron-ore", count = lefRequestedSteel}, 1)
		elseif entityName == "logistic-electric-furnace-brick" then
			dummy.set_request_slot({name = "stone", count = lefRequestedStone}, 1)
		end 
		table.insert(created_requesters, dummy)
	elseif chestName == "lef-passive-provider-chest" then
		table.insert(created_providers, dummy)
	end
	if dummy then
		game.raise_event(on_chest_created, {chest=dummy})
		-- print({"Created ",table.getn(created_requesters)," furnace requester chests"})
		-- print({"Created ",table.getn(created_providers)," furnace provider chests"})
	end
end

function removeDummy(surface, dummyName, position)
	local dummy = surface.find_entity(dummyName, position)
	if dummy and dummy.valid then
		dummy.destroy()
		if dummyName == "lef-requester-chest" then
			for foo, bar in pairs(created_requesters) do
				if dummy == created_requesters[foo] then
					table.remove(created_requesters, foo)
				end
			end
		elseif chestName == "lef-passive-provider-chest" then
			for foo, bar in pairs(created_providers) do
				if dummy == created_providers[foo] then
					table.remove(created_providers, foo)
				end
			end
		end
		return true
	end
	return false
end

script.on_event(defines.events.on_tick, function(event)
   -- Move items on tick
	local tick = game.tick
	if created_requesters ~= nil then
		for k, v in pairs(created_requesters) do
			if k ~= nil and tonumber(k) > 0 and interval ~= nil and tonumber(interval) > 0 and tick ~= nil and tonumber(tick) > 0 then
				if (tonumber(k) + tonumber(tick)) % tonumber(interval) == 0 then
					-- syncChests(k)
					local foo = "bar"
				end
			end  
		end
	end
end)

