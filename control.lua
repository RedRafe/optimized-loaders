local snap_loader = require("scripts.snap-loader")

local snap_wrapper = function(e)
  local entity = e.entity or e.created_entity or e.destination
  if not entity or not entity.valid then
    return
  end
  local entity_name = entity.name

  if string.match(entity_name, "^ol.*%-loader$") then
    snap_loader(entity)
  end
end

local build_events = {
  defines.events.on_built_entity,
  defines.events.on_entity_cloned,
  defines.events.on_robot_built_entity,
  defines.events.script_raised_built,
  defines.events.script_raised_revive,
}

script.on_event(build_events, snap_wrapper)
