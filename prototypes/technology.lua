local OL = require "prototypes.shared"

-- Vanilla
OL.create_loader_technology({
  name = OL.tiers[1].name,
  prerequisites = OL.tiers[1].prerequisites,
  tint = OL.tiers[1].tint,
  graphics = OL.tiers[1].graphics,
})
OL.create_loader_technology({
  name = OL.tiers[2].name,
  prerequisites = OL.tiers[2].prerequisites,
  tint = OL.tiers[2].tint,
  graphics = OL.tiers[2].graphics,
})
OL.create_loader_technology({
  name = OL.tiers[3].name,
  prerequisites = OL.tiers[3].prerequisites,
  tint = OL.tiers[3].tint,
  graphics = OL.tiers[3].graphics,
})

-- Ultimate Belts
if mods["UltimateBelts"] then
  OL.create_loader_technology({
    name = OL.tiers[4].name,
    prerequisites = OL.tiers[4].prerequisites,
    tint = OL.tiers[4].tint,
    graphics = OL.tiers[4].graphics,
  })
  OL.create_loader_technology({
    name = OL.tiers[5].name,
    prerequisites = OL.tiers[5].prerequisites,
    tint = OL.tiers[5].tint,
    graphics = OL.tiers[5].graphics,
  })
  OL.create_loader_technology({
    name = OL.tiers[6].name,
    prerequisites = OL.tiers[6].prerequisites,
    tint = OL.tiers[6].tint,
    graphics = OL.tiers[6].graphics,
  })
  OL.create_loader_technology({
    name = OL.tiers[7].name,
    prerequisites = OL.tiers[7].prerequisites,
    tint = OL.tiers[7].tint,
    graphics = OL.tiers[7].graphics,
  })
  OL.create_loader_technology({
    name = OL.tiers[8].name,
    prerequisites = OL.tiers[8].prerequisites,
    tint = OL.tiers[8].tint,
    graphics = OL.tiers[8].graphics,
  })
end
