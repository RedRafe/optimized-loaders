local Sounds = require "__base__/prototypes/entity/sounds"
local Graphics = require "graphics"

-- ====== SETTINGS ============================================================

-- Select a set among "AAI", "Krastorio2", "Miniloader"
local function get_default_set()
  if settings and settings.startup["ol-graphic-preset"] and settings.startup["ol-graphic-preset"].value
  then return settings.startup["ol-graphic-preset"].value end
  return "Miniloader"
end

-- Use AAI darker loader and Space Exploration's deep belts
local function get_reskin_setting()
  if settings and settings.startup["ol-SE-reskin"] and settings.startup["ol-SE-reskin"].value
  then return settings.startup["ol-SE-reskin"].value end
  return false
end

-- Apply rust to Krastorio2 loaders
local function get_rust_setting()
  return false
end

-- ====== PROPERTIES ==========================================================

local OL = {}

OL.tiers = {
  [1] = {
    name = "ol-loader",
    base = {
      belt = "transport-belt",
      underground = "underground-belt",
      splitter = "splitter"
    },
    prerequisites = {"logistics", "fast-inserter", "steel-processing"},
    ingredients = {
      {"underground-belt", 1},
      {"steel-plate", 8},
      {"fast-inserter", 6},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or false,
    },
    tint = {
      ["AAI"] = util.color("ffd955ff"),
      ["Krastorio2"] = util.color("f9cf46ff"),
      ["Miniloader"] = util.color("ffc340d1"),
      ["Space Exploration"] = util.color("ffff00ff"), -- Yellow
    }
  },
  [2] = {
    name = "ol-fast-loader",
    base = {
      belt = "fast-transport-belt",
      underground = "fast-underground-belt",
      splitter = "fast-splitter"
    },
    prerequisites = {"logistics-2", "ol-loader"},
    ingredients = {
      {"ol-loader", 1},
      {"fast-underground-belt", 1},
      {"stack-inserter", 4},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or false,
    },
    tint = {
      ["AAI"] = util.color("ff1826ff"),
      ["Krastorio2"] = util.color("e41826ff"),
      ["Miniloader"] = util.color("e31717d1"),
      ["Space Exploration"] = util.color("ff0000ff"), -- Red
    }
  },
  [3] = {
    name = "ol-express-loader",
    base = {
      belt = "express-transport-belt",
      underground = "express-underground-belt",
      splitter = "express-splitter"
    },
    prerequisites = {"logistics-3", "ol-fast-loader"},
    ingredients = {
      {"ol-fast-loader", 1},
      {"express-underground-belt", 1},
      {"stack-inserter", 2},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or false,
    },
    tint = {
      ["AAI"] = util.color("5abeffff"),
      ["Krastorio2"] = util.color("5abedcff"),
      ["Miniloader"] = util.color("43c0fad1"),
      ["Space Exploration"] = util.color("00ffffff"), -- Cyan
    }
  },
  [4] = { -- Green
    name = "ol-ultra-fast-loader",
    base = {
      belt = "ultra-fast-transport-belt",
      underground = "ultra-fast-underground-belt",
      splitter = "ultra-fast-splitter"
    },
    prerequisites = {"ultra-fast-logistics", "ol-express-loader"},
    ingredients = {
      {"ol-express-loader", 1},
      {"ultra-fast-underground-belt", 1},
      {"stack-inserter", 6},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or true,
    },
    tint = {
      ["AAI"] = util.color("00b30cff"),
      ["Krastorio2"] = util.color("4ce830ff"),
      ["Miniloader"] = util.color("00b30cff"),
      ["Space Exploration"] = util.color("00ff00ff"), -- Green
    }
  },
  [5] = { -- Red
    name = "ol-extreme-fast-loader",
    base = {
      belt = "extreme-fast-transport-belt",
      underground = "extreme-fast-underground-belt",
      splitter = "extreme-fast-splitter"
    },
    prerequisites = {"extreme-fast-logistics", "ol-ultra-fast-loader"},
    ingredients = {
      {"ol-ultra-fast-loader", 1},
      {"extreme-fast-underground-belt", 1},
      {"stack-inserter", 6},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or true,
    },
    tint = {
      ["AAI"] = util.color("e00000ff"),
      ["Krastorio2"] = util.color("e00000ff"),
      ["Miniloader"] = util.color("e00000ff"),
      ["Space Exploration"] = util.color("191919ff"), -- ? Black
    }
  },
  [6] = { -- Purple
    name = "ol-ultra-express-loader",
    base = {
      belt = "ultra-express-transport-belt",
      underground = "ultra-express-underground-belt",
      splitter = "ultra-express-splitter"
    },
    prerequisites = {"ultra-express-logistics", "ol-extreme-fast-loader"},
    ingredients = {
      {"ol-extreme-fast-loader", 1},
      {"ultra-express-underground-belt", 1},
      {"stack-inserter", 6},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or true,
    },
    tint = {
      ["AAI"] = util.color("3604b5e8"),
      ["Krastorio2"] = util.color("9722bfff"),
      ["Miniloader"] = util.color("3604b5e8"),
      ["Space Exploration"] = util.color("ff00ffff"), -- Magenta
    }
  },
  [7] = { -- Blue
    name = "ol-extreme-express-loader",
    base = {
      belt = "extreme-express-transport-belt",
      underground = "extreme-express-underground-belt",
      splitter = "extreme-express-splitter"
    },
    prerequisites = {"extreme-express-logistics", "ol-ultra-express-loader"},
    ingredients = {
      {"ol-ultra-express-loader", 1},
      {"extreme-express-underground-belt", 1},
      {"stack-inserter", 6},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or true,
    },
    tint = {
      ["AAI"] = util.color("002bffff"),
      ["Krastorio2"] = util.color("002bffff"),
      ["Miniloader"] = util.color("002bffff"),
      ["Space Exploration"] = util.color("0000ffff"), -- Blue
    }
  },
  [8] = { -- Cyan
    name = "ol-ultimate-loader",
    base = {
      belt = "ultimate-transport-belt",
      underground = "ultimate-underground-belt",
      splitter = "ultimate-splitter"
    },
    prerequisites = {"ultimate-logistics", "ol-extreme-express-loader"},
    ingredients = {
      {"ol-extreme-express-loader", 1},
      {"original-ultimate-underground-belt", 1},
      {"stack-inserter", 6},
    },
    graphics = {
      rust = get_rust_setting(),
      dark = get_reskin_setting() or true,
    },
    tint = {
      ["AAI"] = util.color("00ffddd1"),
      ["Krastorio2"] = util.color("00ffddd1"),
      ["Miniloader"] = util.color("00ffddd1"),
      ["Space Exploration"] = util.color("ffffffff"), -- ? White
    }
  }
}

OL.make_SE_reskin = get_reskin_setting

-- ====== ENTITY ==============================================================

OL.create_loader_entity = function(params)
  local name = params.name
  local speed = params.speed
  local belt_animation_set = table.deepcopy(params.belt_animation_set)
  local order = params.order
  local upgrade = params.upgrade or nil
  local set = params.set or get_default_set()
  local p_graphics = params.graphics
  local tint = table.deepcopy(params.tint[set]) --or { r = 1.0, g = 1.0, b = 1.0 }
  if get_reskin_setting() then tint = params.tint["Space Exploration"] end

  data:extend({
    {
      type = "loader-1x1",
      name = name,
      localised_name = params.localised_name,
      icons = Graphics[set].icons(tint, p_graphics),
      flags = { "placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving" },
      minable = { mining_time = 0.25, result = params.result or name },
      placeable_by = { item = params.result or name, count = 1 },
      max_health = 300,
      filter_count = 5,
      corpse = "small-remnants",
      resistances = {
        {
          type = "fire",
          percent = 90,
        },
      },
      collision_box = { { -0.4, -0.45 }, { 0.4, 0.45 } },
      selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
      drawing_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
      animation_speed_coefficient = 32,
      container_distance = 0.75, --Default: 1.5, KR: 0.75, ML: 0
      -- belt_distance = 0.0, --Default1x1: 0.0  --Default2x1: 0.5
      belt_length = 0.5, -- Default: 0.5, KR 0.2, ML: 0.6
      structure_render_layer = "object",
      -- structure_render_layer = "transport-belt-circuit-connector", --Default:"lower-object"
      belt_animation_set = belt_animation_set,
      fast_replaceable_group = "transport-belt", --"loader"
      next_upgrade = upgrade,
      speed = speed,
      -- for space exploration compatibility
      se_allow_in_space = params.se_allow_in_space,

      open_sound = Sounds.machine_open,
      close_sound = Sounds.machine_close,

      structure = Graphics[set].structure(tint, p_graphics),
      order = order,

      -- AAI only
      integration_patch_render_layer = (set == "AAI") and "decals" or nil,
      integration_patch = (set == "AAI") and Graphics[set].integration_patch(tint, p_graphics)or nil
    }
  })
end

-- ====== ITEM ================================================================

OL.create_loader_item = function(params)
  local name = params.name
  local subgroup = params.subgroup or "belt"
  local order = params.order
  local set = params.set or get_default_set()
  local p_graphics = params.graphics
  local tint = params.tint and params.tint[set] or { r = 1.0, g = 1.0, b = 1.0 }
  if get_reskin_setting() then tint = params.tint["Space Exploration"] end

  data:extend{{
    type = "item",
    name = name,
    icons = Graphics[set].icons(tint, p_graphics),
    subgroup = subgroup,
    order = order,
    place_result = name,
    stack_size = 50,
  }}
end

-- ====== RECIPE ==============================================================

OL.create_loader_recipe = function(params)
  local name = params.name
  local ingredients = params.ingredients

  data:extend{{
    type = "recipe",
    name = name,
    enabled = false,
    energy_required = 1,
    ingredients = ingredients,
    result = name,
  }}
end

-- ====== TECHNOLOGY ==========================================================

OL.create_loader_technology = function(params)
  local name = params.name
  local prerequisites = params.prerequisites
  local first = data.raw.technology[prerequisites[1] or "logistics"]
  local unit = params.unit or table.deepcopy(first.unit)
  local order = params.order or first.order .. "-2"
  local set = params.set or get_default_set()
  local p_graphics = params.graphics
  local tint = params.tint and params.tint[set] or { r = 1.0, g = 1.0, b = 1.0 }
  if get_reskin_setting() then tint = params.tint["Space Exploration"] end

  data:extend{{
    type = "technology",
    name = name,
    icons = Graphics[set].technology(tint, p_graphics),
    effects = {
      { 
        type = "unlock-recipe", 
        recipe = name
      }
    },
    prerequisites = prerequisites,
    unit = unit,
    order = order
  }}
end

-- ============================================================================

return OL