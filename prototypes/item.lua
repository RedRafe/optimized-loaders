local OL = require "prototypes.shared"

-- Vanilla
OL.create_loader_item({
  name = OL.tiers[1].name,
  order = "d[loader]-a1[" .. OL.tiers[1].name .. "]",
  tint = OL.tiers[1].tint,
  graphics = OL.tiers[1].graphics,
})
OL.create_loader_item({
  name = OL.tiers[2].name,
  order = "d[loader]-a2[" .. OL.tiers[2].name .. "]",
  tint = OL.tiers[2].tint,
  graphics = OL.tiers[2].graphics,
})
OL.create_loader_item({
  name = OL.tiers[3].name,
  order = "d[loader]-a3[" .. OL.tiers[3].name .. "]",
  tint = OL.tiers[3].tint,
  graphics = OL.tiers[3].graphics,
})

-- Ultimate Belts
if mods["UltimateBelts"] then
  OL.create_loader_item({
    name = OL.tiers[4].name,
    order = "d[loader]-a4[" .. OL.tiers[4].name .. "]",
    tint = OL.tiers[4].tint,
    graphics = OL.tiers[4].graphics,
  })
  OL.create_loader_item({
    name = OL.tiers[5].name,
    order = "d[loader]-a5[" .. OL.tiers[5].name .. "]",
    tint = OL.tiers[5].tint,
    graphics = OL.tiers[5].graphics,
  })
  OL.create_loader_item({
    name = OL.tiers[6].name,
    order = "d[loader]-a6[" .. OL.tiers[6].name .. "]",
    tint = OL.tiers[6].tint,
    graphics = OL.tiers[6].graphics,
  })
  OL.create_loader_item({
    name = OL.tiers[7].name,
    order = "d[loader]-a7[" .. OL.tiers[7].name .. "]",
    tint = OL.tiers[7].tint,
    graphics = OL.tiers[7].graphics,
  })
  OL.create_loader_item({
    name = OL.tiers[8].name,
    order = "d[loader]-a8[" .. OL.tiers[8].name .. "]",
    tint = OL.tiers[8].tint,
    graphics = OL.tiers[8].graphics,
  })
end
