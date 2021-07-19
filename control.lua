require "util"

local indestructible_entities = {
		"straight-rail",
		"curved-rail",
		"rail-signal",
		"rail-chain-signal",
		"train-stop",
		"locomotive",
		"cargo-wagon",
		"fluid-wagon",
		"artillery-wagon"
}

function on_built_entity(event)
	for _, ie in pairs(indestructible_entities) do
		if ie == event.created_entity.name then
			event.created_entity.destructible = false
		end
	end
end

function on_init()
	for _, ie in pairs(indestructible_entities) do
		for _, s in pairs(game.surfaces) do
			local entities = s.find_entities_filtered{name=ie}
			for _, e in pairs(entities) do
				e.destructible = false
			end
		end
	end
end

script.on_event(defines.events.on_built_entity, on_built_entity)
script.on_event(defines.events.on_robot_built_entity, on_built_entity)
script.on_init(on_init)
