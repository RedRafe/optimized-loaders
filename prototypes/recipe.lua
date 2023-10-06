local OL = require "prototypes.shared"

-- Vanilla
OL.create_loader_recipe({
  name = OL.tiers[1].name,
  ingredients = OL.tiers[1].ingredients
})
OL.create_loader_recipe({
  name = OL.tiers[2].name,
  ingredients = OL.tiers[2].ingredients
})
OL.create_loader_recipe({
  name = OL.tiers[3].name,
  ingredients = OL.tiers[3].ingredients
})

-- Ultimate Belts
if mods["UltimateBelts"] then
  OL.create_loader_recipe({
    name = OL.tiers[4].name,
    ingredients = OL.tiers[4].ingredients
  })
  OL.create_loader_recipe({
    name = OL.tiers[5].name,
    ingredients = OL.tiers[5].ingredients
  })
  OL.create_loader_recipe({
    name = OL.tiers[6].name,
    ingredients = OL.tiers[6].ingredients
  })
  OL.create_loader_recipe({
    name = OL.tiers[7].name,
    ingredients = OL.tiers[7].ingredients
  })
  OL.create_loader_recipe({
    name = OL.tiers[8].name,
    ingredients = OL.tiers[8].ingredients
  })
end