local OL = require "prototypes.shared"

-- Reskin "belt animation set"
if OL.make_SE_reskin() then
  local Graphics = require "graphics"
  local MAP_TYPES = {
    belt        = "transport-belt",
    underground = "underground-belt",
    splitter    = "splitter"
  }

  for ___, tier in pairs(OL.tiers) do
    local tint = tier.tint["Space Exploration"]
    local se = Graphics["Space Exploration"]

    for t, name in pairs(tier.base) do
      local type = MAP_TYPES[t]

      se[type].structure(tint, data.raw[type][name])
      se[type].icons(tint, data.raw.item[name])
    end
  end
end

local TB = "transport-belt"

-- Vanilla
OL.create_loader_entity({
  name = OL.tiers[1].name,
  speed = data.raw[TB][OL.tiers[1].base.belt].speed,
  upgrade = OL.tiers[2].name,
  belt_animation_set = data.raw[TB][OL.tiers[1].base.belt].belt_animation_set,
  tint = OL.tiers[1].tint,
  graphics = OL.tiers[1].graphics,
})
OL.create_loader_entity({
  name = OL.tiers[2].name,
  speed = data.raw[TB][OL.tiers[2].base.belt].speed,
  upgrade = OL.tiers[3].name,
  belt_animation_set = data.raw[TB][OL.tiers[2].base.belt].belt_animation_set,
  tint = OL.tiers[2].tint,
  graphics = OL.tiers[2].graphics,
})
OL.create_loader_entity({
  name = OL.tiers[3].name,
  speed = data.raw[TB][OL.tiers[3].base.belt].speed,
  upgrade = nil,
  belt_animation_set = data.raw[TB][OL.tiers[3].base.belt].belt_animation_set,
  tint = OL.tiers[3].tint,
  graphics = OL.tiers[3].graphics,
})

-- Ultimate Belts
if mods["UltimateBelts"] then
  data.raw["loader-1x1"][OL.tiers[3].name].next_upgrade = OL.tiers[4].name

  OL.create_loader_entity({
    name = OL.tiers[4].name,
    speed = data.raw[TB][OL.tiers[4].base.belt].speed,
    upgrade = OL.tiers[5].name,
    belt_animation_set = data.raw[TB][OL.tiers[4].base.belt].belt_animation_set,
    tint = OL.tiers[4].tint,
    graphics = OL.tiers[4].graphics,
  })
  OL.create_loader_entity({
    name = OL.tiers[5].name,
    speed = data.raw[TB][OL.tiers[5].base.belt].speed,
    upgrade = OL.tiers[6].name,
    belt_animation_set = data.raw[TB][OL.tiers[5].base.belt].belt_animation_set,
    tint = OL.tiers[5].tint,
    graphics = OL.tiers[5].graphics,
  })
  OL.create_loader_entity({
    name = OL.tiers[6].name,
    speed = data.raw[TB][OL.tiers[6].base.belt].speed,
    upgrade = OL.tiers[7].name,
    belt_animation_set = data.raw[TB][OL.tiers[6].base.belt].belt_animation_set,
    tint = OL.tiers[6].tint,
    graphics = OL.tiers[6].graphics,
  })
  OL.create_loader_entity({
    name = OL.tiers[7].name,
    speed = data.raw[TB][OL.tiers[7].base.belt].speed,
    upgrade = OL.tiers[8].name,
    belt_animation_set = data.raw[TB][OL.tiers[7].base.belt].belt_animation_set,
    tint = OL.tiers[7].tint,
    graphics = OL.tiers[7].graphics,
  })
  OL.create_loader_entity({
    name = OL.tiers[8].name,
    speed = data.raw[TB][OL.tiers[8].base.belt].speed,
    upgrade = nil,
    belt_animation_set = data.raw[TB][OL.tiers[8].base.belt].belt_animation_set,
    tint = OL.tiers[8].tint,
    graphics = OL.tiers[8].graphics,
  })
end
