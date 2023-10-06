---- All rights to to Raiguard for the code below

---- Source: Factorio Library, https://mods.factorio.com/mod/flib

--- https://github.com/factoriolib/flib/blob/736183bb27459f5bccf030bf819ec8eb758ad648/direction.lua#L30
--- Calculate the opposite direction.
--- @param direction defines.direction
--- @return defines.direction
local function direction_opposite(direction)
  return (direction + 4) % 8 --[[@as defines.direction]]
end

--- https://github.com/factoriolib/flib/blob/736183bb27459f5bccf030bf819ec8eb758ad648/position.lua#L17
--- Add two positions.
--- @generic P
--- @param pos1 P
--- @param pos2 P
--- @return P
local function position_add(pos1, pos2)
  local x1 = pos1.x or pos1[1]
  local y1 = pos1.y or pos1[2]
  local x2 = pos2.x or pos2[1]
  local y2 = pos2.y or pos2[2]
  if pos1.x then
    return { x = x1 + x2, y = y1 + y2 }
  else
    return { x1 + x2, y1 + y2 }
  end
end

---- Source: Krastorio2, https://mods.factorio.com/mod/Krastorio2
--- https://github.com/raiguard/Krastorio2/blob/master/scripts/snap-loader.lua

--- @type table<defines.direction, Vector>
local offsets = {
  [defines.direction.north] = { 0, -1 },
  [defines.direction.east] = { 1, 0 },
  [defines.direction.south] = { 0, 1 },
  [defines.direction.west] = { -1, 0 },
}

local belt_types = {
  "linked-belt",
  "loader",
  "loader-1x1",
  "splitter",
  "transport-belt",
  "underground-belt",
}

local container_types = {
  "assembling-machine",
  "beacon",
  "boiler",
  "burner-generator",
  "container",
  "curved-rail",
  "furnace",
  "infinity-container",
  "lab",
  "logistic-container",
  "mining-drill",
  "rail",
  "reactor",
  "rocket-silo",
  "straight-rail",
}

--- @param entity LuaEntity
local function flip_loader(entity)
  entity.direction = direction_opposite(entity.direction)
  entity.loader_type = entity.loader_type == "output" and "input" or "output"
end

--- Find entities and entity ghosts of the corresponding types.
--- @param surface LuaSurface
--- @param position MapPosition
--- @param force ForceIdentification
--- @param types string[]
--- @return LuaEntity[]
local function find_entities(surface, position, force, types)
  local entities = surface.find_entities_filtered({
    force = force,
    position = position,
    type = types,
  })
  local ghosts = surface.find_entities_filtered({
    force = force,
    ghost_type = types,
    position = position,
  })
  for i = 1, #ghosts do
    entities[#entities + 1] = ghosts[i]
  end
  return entities
end

--- Ensure that the loader has the belt on the correct side.
--- @param entity LuaEntity
local function snap_direction(entity)
  local offset_direction = entity.direction
  if entity.loader_type == "input" then
    offset_direction = direction_opposite(offset_direction)
  end
  local container_position = position_add(entity.position, offsets[offset_direction])

  -- Case 1: If a container is in front, then flip the loader
  local containers = find_entities(entity.surface, container_position, entity.force, container_types)
  if #containers > 0 then
    -- Check that it's not a composite loader entity
    local is_composite = entity.surface.count_entities_filtered({
      force = entity.force,
      position = container_position,
      type = { "loader", "loader-1x1" },
    }) > 0
    if not is_composite then
      flip_loader(entity)
      return
    end
  end

  -- Case 2: If a belt is behind, then flip the loader
  local offset_direction = direction_opposite(offset_direction)
  local belt_position = position_add(entity.position, offsets[offset_direction])
  local belt = find_entities(entity.surface, belt_position, entity.force, belt_types)[1]
  if not belt then
    return
  end

  local belt_type = belt.type
  if belt_type == "entity-ghost" then
    belt_type = belt.ghost_type
  end
  if
    belt_type == "transport-belt"
    or belt_type == "underground-belt"
    or math.abs(offset_direction - belt.direction) % 4 == 0
  then
    flip_loader(entity)
  end
end

--- @param entity LuaEntity
local function snap_to_belt(entity)
  local offset_direction = entity.direction
  if entity.loader_type == "input" then
    offset_direction = direction_opposite(offset_direction)
  end
  local belt_position = position_add(entity.position, offsets[offset_direction])

  local belt = find_entities(entity.surface, belt_position, entity.force, belt_types)[1]
  if not belt then
    return
  end

  local belt_direction = belt.direction
  local belt_type = belt.type
  if belt_type == "entity-ghost" then
    belt_type = belt.ghost_type
  end
  if entity.direction == belt_direction then
    -- Pass
  elseif entity.direction == direction_opposite(belt_direction) then
    entity.loader_type = "input"
  elseif belt_type == "transport-belt" or belt_type == "underground-belt" then
    -- Sideloading
    entity.loader_type = "output"
  end
end

--- @param entity LuaEntity
return function(entity)
  entity.update_connections()
  if not entity.loader_container then
    snap_direction(entity)
  end

  snap_to_belt(entity)
end