local path_g_aai =        "__optimized-loaders__/graphics/AAI/"
local path_g_krastorio =  "__optimized-loaders__/graphics/Krastorio2/"
local path_g_miniloader = "__optimized-loaders__/graphics/Miniloader/"
local path_g_se =         "__optimized-loaders__/graphics/SE/"

-- ====== AAI =================================================================

local AAI = {}

local function AAI_get_backsprite(spritename)
  return {
    priority = "high",
    filename = path_g_aai .. "entity/loader/" .. spritename,
    line_length = 1,
    width = 49,
    height = 59,
    frame_count = 1,
    direction_count = 1,
    shift = {0, -0.15},
    hr_version =
    {
      priority = "high",
      filename = path_g_aai .. "entity/loader/hr_" .. spritename,
      line_length = 1,
      width = 99,
      height = 117,
      frame_count = 1,
      direction_count = 1,
      shift = {0, -0.15},
      scale = 0.5
    }
  }
end

function AAI.icons(tint, params)
  local suffix = params.dark and "_dark" or ""
  return {
    {
      icon = path_g_aai .. "icons/loader" .. suffix .. ".png",
      icon_size = 64
    },
    {
      icon = path_g_aai .. "icons/loader_mask" .. suffix .. ".png",
      icon_size = 64,
      tint = tint
    }
  }
end
function AAI.structure(tint, params)
  local suffix = params.dark and "_dark" or ""
  local structure = params.structure or "loader"
  return {
    direction_in = {
      sheets = {
         {
          filename = path_g_aai .. "entity/loader/" .. structure .. "_shadows.png",
          priority = "extra-high",
          shift = {0.4, 0.15},
          width = 69,
          height = 39,
          draw_as_shadow = true,
          hr_version = {
            filename = path_g_aai .. "entity/loader/hr_" .. structure .. "_shadows.png",
            priority = "extra-high",
            shift = {0.4, 0.15},
            width = 138,
            height = 79,
            scale = 0.5,
            draw_as_shadow = true
          }
        },
        {
          filename = path_g_aai .. "entity/loader/" .. structure .. suffix .. ".png",
          priority = "extra-high",
          shift = {0, -0.15},
          width = 49,
          height = 58,
          hr_version = {
            filename = path_g_aai .. "entity/loader/hr_" .. structure .. suffix .. ".png",
            priority = "extra-high",
            shift = {0, -0.15},
            width = 99,
            height = 117,
            scale = 0.5
          }
        },
        {
          filename = path_g_aai .. "entity/loader/" .. structure .. "_tint" .. suffix .. ".png",
          priority = "extra-high",
          shift = {0, -0.15},
          width = 49,
          height = 58,
          tint = tint,
          hr_version = {
            filename = path_g_aai .. "entity/loader/hr_" .. structure .. "_tint" .. suffix .. ".png",
            priority = "extra-high",
            shift = {0, -0.15},
            width = 99,
            height = 117,
            scale = 0.5,
            tint = tint
          }
        },
      }
    },
    direction_out = {
      sheets = {
        {
          filename = path_g_aai .. "entity/loader/" .. structure .. "_shadows.png",
          priority = "extra-high",
          shift = {0.4, 0.15},
          width = 69,
          height = 39,
          y = 39,
          draw_as_shadow = true,
          hr_version = {
            filename = path_g_aai .. "entity/loader/hr_" .. structure .. "_shadows.png",
            priority = "extra-high",
            shift = {0.4, 0.15},
            width = 138,
            height = 79,
            y = 79,
            scale = 0.5,
            draw_as_shadow = true,
          }
        },
        {
          filename = path_g_aai .. "entity/loader/" .. structure .. suffix .. ".png",
          priority = "extra-high",
          shift = {0, -0.15},
          width = 49,
          height = 58,
          y = 59,
          hr_version = {
            filename = path_g_aai .. "entity/loader/hr_" .. structure .. suffix .. ".png",
            priority = "extra-high",
            shift = {0, -0.15},
            width = 99,
            height = 117,
            y = 117,
            scale = 0.5
          }
        },
        {
          filename = path_g_aai .. "entity/loader/" .. structure .. "_tint" .. suffix .. ".png",
          priority = "extra-high",
          shift = {0, -0.15},
          width = 49,
          height = 58,
          tint = tint,
          y = 59,
          hr_version = {
            filename = path_g_aai .. "entity/loader/hr_" .. structure .. "_tint" .. suffix .. ".png",
            priority = "extra-high",
            shift = {0, -0.15},
            width = 99,
            height = 117,
            scale = 0.5,
            y = 117,
            tint = tint
          }
        }
      }
    }
  }
end
function AAI.integration_patch(tint, params)
  local structure = params.structure or "loader"
  return {
    north = AAI_get_backsprite(structure .. "_empty.png"),
    east  = AAI_get_backsprite(structure .. "_side.png"),
    south = AAI_get_backsprite(structure .. "_empty.png"),
    west  = AAI_get_backsprite(structure .. "_side.png"),
  }
end
function AAI.technology(tint, params)
  local suffix = params.dark and "_dark" or ""
  return {
    {
      icon = path_g_aai .. "technology/loader-tech-icon" .. suffix .. ".png" ,
      icon_size = 256
    },
    {
      icon = path_g_aai .. "technology/loader-tech-icon_mask" .. suffix .. ".png",
      icon_size = 256,
      tint = tint
    }
  }
end

-- ====== Krastorio2 ==========================================================

local Krastorio2 = {}


local KR_rust_layer_direction_in = {
  filename = path_g_krastorio .. "entity/kr-loader-rust.png",
  priority = "extra-high",
  shift = { 0.15625, 0.0703125 },
  width = 53,
  height = 43,
  y = 43,
  hr_version = {
    filename = path_g_krastorio .. "entity/hr-kr-loader-rust.png",
    priority = "extra-high",
    shift = { 0.15625, 0.0703125 },
    width = 106,
    height = 85,
    y = 85,
    scale = 0.5,
  }
}
local KR_rust_layer_direction_out = {
  filename = path_g_krastorio .. "entity/kr-loader-rust.png",
  priority = "extra-high",
  shift = { 0.15625, 0.0703125 },
  width = 53,
  height = 43,
  hr_version = {
    filename = path_g_krastorio .. "entity/hr-kr-loader-rust.png",
    priority = "extra-high",
    shift = { 0.15625, 0.0703125 },
    width = 106,
    height = 85,
    scale = 0.5,
  }
}

function Krastorio2.icons(tint, params)
  return {
    {
      icon = path_g_krastorio .. "icons/hr-kr-loader.png",
      icon_size = 64,
    },
    {
      icon = path_g_krastorio .. "icons/hr-kr-loader-mask.png",
      icon_size = 64,
      tint = tint,
    }
  }
end
function Krastorio2.structure(tint, params)
  params = params or {}
  params.rust = params.rust or false
  return {
    direction_in = {
      sheets = {
        {
          filename = path_g_krastorio .. "entity/kr-loader.png",
          priority = "extra-high",
          shift = { 0.15625, 0.0703125 },
          width = 53,
          height = 43,
          y = 43,
          hr_version = {
            filename = path_g_krastorio .. "entity/hr-kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
          }
        },
        {
          filename = path_g_krastorio .. "entity/kr-loader-mask.png",
          priority = "extra-high",
          shift = { 0.15625, 0.0703125 },
          width = 53,
          height = 43,
          y = 43,
          tint = tint,
          hr_version = {
            filename = path_g_krastorio .. "entity/hr-kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
            tint = tint,
          },
        },
        params.rust and KR_rust_layer_direction_in or nil,
      },
    },
    direction_out = {
      sheets = {
        {
          filename = path_g_krastorio .. "entity/kr-loader.png",
          priority = "extra-high",
          shift = { 0.15625, 0.0703125 },
          width = 53,
          height = 43,
          hr_version = {
            filename = path_g_krastorio .. "entity/hr-kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 106,
            height = 85,
            scale = 0.5,
          },
        },
        {
          filename = path_g_krastorio .. "entity/kr-loader-mask.png",
          priority = "extra-high",
          shift = { 0.15625, 0.0703125 },
          width = 53,
          height = 43,
          tint = tint,
          hr_version = {
            filename = path_g_krastorio .. "entity/hr-kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 106,
            height = 85,
            scale = 0.5,
            tint = tint,
          },
        },
        params.rust and KR_rust_layer_direction_out or nil,
      },
    }
  }
end
function Krastorio2.technology(tint, params)
  return {
    {
      icon = path_g_krastorio .. "technology/hr-kr-loader.png",
      --shift = { 0.15625, 0.0703125 },
      icon_size = 85,
      icon_mipmaps = 1,
    },
    {
      icon = path_g_krastorio .. "technology/hr-kr-loader-mask.png",
      --shift = { 0.15625, 0.0703125 },
      icon_size = 85,
      icon_mipmaps = 1,
      tint = tint,
    }
  }
end

-- ====== Miniloader ==========================================================

local Miniloader = {}

function Miniloader.icons(tint, params)
  return {
    {
      icon = path_g_miniloader .. "icons/icon-base.png",
      icon_size = 64,
    },
    {
      icon = path_g_miniloader .. "icons/icon-mask.png",
      icon_size = 64,
      tint = tint,
    },
  }
end
function Miniloader.structure(tint, params)
  return {
    direction_in = {
      sheets = {
        -- Base
        {
          filename = path_g_miniloader .. "entity/miniloader-structure-base.png",				
          width = 96,
          height = 96,
          y = 0,
          hr_version = {
            filename = path_g_miniloader .. "entity/hr-miniloader-structure-base.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 0
          }
        },
        -- Mask
        {
          filename = path_g_miniloader .. "entity/miniloader-structure-mask.png",			
          width = 96,
          height = 96,
          y = 0,
          tint = tint,
          hr_version = {
            filename = path_g_miniloader .. "entity/hr-miniloader-structure-mask.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 0,
            tint = tint,
          }
        },
        -- Shadow
        {
          filename = path_g_miniloader .. "entity/miniloader-structure-shadow.png",			
          draw_as_shadow = true,
          width = 96,
          height = 96,
          y = 0,
          hr_version = {
            filename = path_g_miniloader .. "entity/hr-miniloader-structure-shadow.png",
            draw_as_shadow = true,
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 0,
          }
        }
      }
    },
    direction_out = {
      sheets = {
        -- Base
        {
          filename = path_g_miniloader .. "entity/miniloader-structure-base.png",			
          width = 96,
          height = 96,
          y = 96,
          hr_version = {
            filename = path_g_miniloader .. "entity/hr-miniloader-structure-base.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 192
          }
        },
        -- Mask
        {
          filename = path_g_miniloader .. "entity/miniloader-structure-mask.png",			
          width = 96,
          height = 96,
          y = 96,
          tint = tint,
          hr_version = {
            filename = path_g_miniloader .. "entity/hr-miniloader-structure-mask.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 192,
            tint = tint
          }
        },
        -- Shadow
        {
          filename = path_g_miniloader .. "entity/miniloader-structure-shadow.png",			
          width = 96,
          height = 96,
          y = 96,
          draw_as_shadow = true,
          hr_version = {
            filename = path_g_miniloader .. "entity/hr-miniloader-structure-shadow.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 192,
            draw_as_shadow = true,
          }
        }
      }
    },
    back_patch = {
      sheet = {
        filename = path_g_miniloader .. "entity/miniloader-structure-back-patch.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        hr_version = {
          filename = path_g_miniloader .. "entity/hr-miniloader-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    },
    front_patch = {
      sheet = {
        filename = path_g_miniloader .. "entity/miniloader-structure-front-patch.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        hr_version = {
          filename = path_g_miniloader .. "entity/hr-miniloader-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  }
end
function Miniloader.technology(tint, params)
  return {
    {
      icon = path_g_miniloader .. "technology/technology-base.png",
      icon_size = 128,
    },
    {
      icon = path_g_miniloader .. "technology/technology-mask.png",
      icon_size = 128,
      tint = tint,
    },
  }
end

-- ====== Space Exploration - Substructure ====================================

local SE_belt        = {}
local SE_underground = {}
local SE_splitter    = {}

-- ------ Space Exploration - TRANSPORT BELT ----------------------------------

function SE_belt.icons(tint, obj)
  if not obj then return end
  obj.icon_mipmaps = 1
  obj.icon_size = 64
  obj.icons = {
    {
      icon = path_g_se .. "icons/deep-space-transport-belt.png",
      icon_size = 64
    },
    {
      icon = path_g_se .. "icons/deep-space-transport-belt-glow.png",
      icon_size = 64,
      tint = tint
    }
  }
end
function SE_belt.structure(tint, obj)
  if not obj then return end
  obj.animation_speed_coefficient = 32
  obj.belt_animation_set = {
    animation_set = {
      direction_count = 20,
      filename = path_g_se .. "entity/space-transport-belt/space-transport-belt.png",
      frame_count = 32,
      height = 64,
      hr_version = {
        direction_count = 20,
        filename = path_g_se .. "entity/space-transport-belt/hr-space-transport-belt.png",
        frame_count = 32,
        height = 128,
        priority = "extra-high",
        scale = 0.5,
        width = 128
      },
      layers = {
        {
          direction_count = 20,
          filename = path_g_se .. "entity/deep-space-transport-belt/deep-space-transport-belt.png",
          flags = { "no-crop" },
          frame_count = 32,
          height = 64,
          hr_version = {
            direction_count = 20,
            filename = path_g_se .. "entity/deep-space-transport-belt/hr-deep-space-transport-belt.png",
            flags = { "no-crop" },
            frame_count = 32,
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          scale = 1,
          width = 64
        },
        {
          blend_mode = "additive",
          direction_count = 20,
          filename = path_g_se .. "entity/deep-space-transport-belt/deep-space-transport-belt-glow.png",
          flags = { "no-crop" },
          frame_count = 32,
          height = 64,
          hr_version = {
            blend_mode = "additive",
            direction_count = 20,
            filename = path_g_se .. "entity/deep-space-transport-belt/hr-deep-space-transport-belt-glow.png",
            flags = { "no-crop" },
            frame_count = 32,
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            tint = tint,
            width = 128
          },
          priority = "extra-high",
          scale = 1,
          tint = tint,
          width = 64
        }
      },
      priority = "extra-high",
      width = 64
    }
  }
  obj.icon = path_g_se .. "icons/deep-space-transport-belt.png"
  obj.icon_mipmaps = 1
  obj.icon_size = 64
  obj.icons = {
    {
      icon = path_g_se .. "icons/deep-space-transport-belt.png",
      icon_size = 64
    },
    {
      icon = path_g_se .. "icons/deep-space-transport-belt-glow.png",
      icon_size = 64,
      tint = tint
    }
  }
end

-- ------ Space Exploration - UNDERGROUND BELT --------------------------------

function SE_underground.icons(tint, obj)
  if not obj then return end
  obj.icon_mipmaps = 1
  obj.icon_size = 64
  obj.icons = {
    {
      icon = path_g_se .. "icons/deep-space-underground-belt.png",
      icon_size = 64
    },
    {
      icon = path_g_se .. "icons/deep-space-underground-belt-glow.png",
      icon_size = 64,
      tint = tint
    }
  }
end
function SE_underground.structure(tint, obj)
  if not obj then return end

  obj.belt_animation_set = {
    animation_set = {
      direction_count = 20,
      filename = path_g_se .. "entity/space-transport-belt/space-transport-belt.png",
      frame_count = 32,
      height = 64,
      hr_version = {
        direction_count = 20,
        filename = path_g_se .. "entity/space-transport-belt/hr-space-transport-belt.png",
        frame_count = 32,
        height = 128,
        priority = "extra-high",
        scale = 0.5,
        width = 128
      },
      layers = {
        {
          direction_count = 20,
          filename = path_g_se .. "entity/deep-space-transport-belt/deep-space-transport-belt.png",
          flags = { "no-crop" },
          frame_count = 32,
          height = 64,
          hr_version = {
            direction_count = 20,
            filename = path_g_se .. "entity/deep-space-transport-belt/hr-deep-space-transport-belt.png",
            flags = { "no-crop" },
            frame_count = 32,
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          scale = 1,
          width = 64
        },
        {
          blend_mode = "additive",
          direction_count = 20,
          filename = path_g_se .. "entity/deep-space-transport-belt/deep-space-transport-belt-glow.png",
          flags = { "no-crop" },
          frame_count = 32,
          height = 64,
          hr_version = {
            blend_mode = "additive",
            direction_count = 20,
            filename = path_g_se .. "entity/deep-space-transport-belt/hr-deep-space-transport-belt-glow.png",
            flags = { "no-crop" },
            frame_count = 32,
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            tint = tint,
            width = 128
          },
          priority = "extra-high",
          scale = 1,
          tint = tint,
          width = 64
        }
      },
      priority = "extra-high",
      width = 64
    }
  }
  obj.icon = path_g_se .. "icons/deep-space-underground-belt.png"
  obj.icon_mipmaps = 1
  obj.icon_size = 64
  obj.icons = {
    {
      icon = path_g_se .. "icons/deep-space-underground-belt.png",
      icon_size = 64
    },
    {
      icon = path_g_se .. "icons/deep-space-underground-belt-glow.png",
      icon_size = 64,
      tint = tint
    }
  }
  obj.structure = {
    back_patch = {
      sheet = {
        filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure-back-patch.png",
        height = 96,
        hr_version = {
          filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure-back-patch.png",
          height = 192,
          priority = "extra-high",
          scale = 0.5,
          width = 192
        },
        priority = "extra-high",
        width = 96
      }
    },
    direction_in = {
      sheets = {
        {
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure.png",
          height = 96,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 192
          },
          priority = "extra-high",
          width = 96,
          y = 96
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure-glow.png",
          height = 96,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure-glow.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            tint = tint,
            width = 192,
            y = 192
          },
          priority = "extra-high",
          tint = tint,
          width = 96,
          y = 96
        }
      }
    },
    direction_in_side_loading = {
      sheets = {
        {
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure.png",
          height = 96,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 576
          },
          priority = "extra-high",
          width = 96,
          y = 288
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure-glow.png",
          height = 96,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure-glow.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            tint = tint,
            width = 192,
            y = 576
          },
          priority = "extra-high",
          tint = tint,
          width = 96,
          y = 288
        }
      }
    },
    direction_out = {
      sheets = {
        {
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure.png",
          height = 96,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192
          },
          priority = "extra-high",
          width = 96
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure-glow.png",
          height = 96,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure-glow.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            tint = tint,
            width = 192
          },
          priority = "extra-high",
          tint = tint,
          width = 96
        }
      }
    },
    direction_out_side_loading = {
      sheets = {
        {
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure.png",
          height = 96,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 384
          },
          priority = "extra-high",
          width = 96,
          y = 192
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure-glow.png",
          height = 96,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure-glow.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            tint = tint,
            width = 192,
            y = 384
          },
          priority = "extra-high",
          tint = tint,
          width = 96,
          y = 192
        }
      }
    },
    front_patch = {
      sheet = {
        filename = path_g_se .. "entity/deep-space-underground-belt/deep-space-underground-belt-structure-front-patch.png",
        height = 96,
        hr_version = {
          filename = path_g_se .. "entity/deep-space-underground-belt/hr-deep-space-underground-belt-structure-front-patch.png",
          height = 192,
          priority = "extra-high",
          scale = 0.5,
          width = 192
        },
        priority = "extra-high",
        width = 96
      }
    }
  }
end

-- ------ Space Exploration - SPLITTER ----------------------------------------

function SE_splitter.icons(tint, obj)
  if not obj then return end
  obj.icon_mipmaps = 1
  obj.icon_size = 64
  obj.icons = {
    {
      icon = path_g_se .. "icons/deep-space-splitter.png",
      icon_size = 64
    },
    {
      icon = path_g_se .. "icons/deep-space-splitter-glow.png",
      icon_size = 64,
      tint = tint
    }
  }
end
function SE_splitter.structure(tint, obj)
  if not obj then return end
  obj.belt_animation_set = {
    animation_set = {
      direction_count = 20,
      filename = path_g_se .. "entity/space-transport-belt/space-transport-belt.png",
      frame_count = 32,
      height = 64,
      hr_version = {
        direction_count = 20,
        filename = path_g_se .. "entity/space-transport-belt/hr-space-transport-belt.png",
        frame_count = 32,
        height = 128,
        priority = "extra-high",
        scale = 0.5,
        width = 128
      },
      layers = {
        {
          direction_count = 20,
          filename = path_g_se .. "entity/deep-space-transport-belt/deep-space-transport-belt.png",
          flags = { "no-crop" },
          frame_count = 32,
          height = 64,
          hr_version = {
            direction_count = 20,
            filename = path_g_se .. "entity/deep-space-transport-belt/hr-deep-space-transport-belt.png",
            flags = { "no-crop" },
            frame_count = 32,
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            width = 128
          },
          priority = "extra-high",
          scale = 1,
          width = 64
        },
        {
          blend_mode = "additive",
          direction_count = 20,
          filename = path_g_se .. "entity/deep-space-transport-belt/deep-space-transport-belt-glow.png",
          flags = { "no-crop" },
          frame_count = 32,
          height = 64,
          hr_version = {
            blend_mode = "additive",
            direction_count = 20,
            filename = path_g_se .. "entity/deep-space-transport-belt/hr-deep-space-transport-belt-glow.png",
            flags = { "no-crop" },
            frame_count = 32,
            height = 128,
            priority = "extra-high",
            scale = 0.5,
            tint = tint,
            width = 128
          },
          priority = "extra-high",
          scale = 1,
          tint = tint,
          width = 64
        }
      },
      priority = "extra-high",
      width = 64
    }
  }
  obj.icon = path_g_se .. "icons/deep-space-splitter.png"
  obj.icon_mipmaps = 1
  obj.icon_size = 64
  obj.icons = {
    {
      icon = path_g_se .. "icons/deep-space-splitter.png",
      icon_size = 64
    },
    {
      icon = path_g_se .. "icons/deep-space-splitter-glow.png",
      icon_size = 64,
      tint = tint
    }
  }
  obj.structure = {
    east = {
      filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-east.png",
      frame_count = 32,
      height = 42,
      hr_version = {
        filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-east.png",
        frame_count = 32,
        height = 84,
        line_length = 8,
        priority = "extra-high",
        scale = 0.5,
        shift = { 0.125, 0.40625 },
        width = 90
      },
      layers = {
        {
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-east.png",
          frame_count = 32,
          height = 42,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-east.png",
            frame_count = 32,
            height = 84,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.125, 0.40625 },
            width = 90
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.125, 0.375 },
          width = 45
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-east-glow.png",
          frame_count = 32,
          height = 42,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-east-glow.png",
            frame_count = 32,
            height = 84,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.125, 0.40625 },
            tint = tint,
            width = 90
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.125, 0.375 },
          tint = tint,
          width = 45
        }
      },
      line_length = 8,
      priority = "extra-high",
      shift = { 0.125, 0.375 },
      width = 45
    },
    north = {
      filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-north.png",
      frame_count = 32,
      height = 35,
      hr_version = {
        filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-north.png",
        frame_count = 32,
        height = 70,
        line_length = 8,
        priority = "extra-high",
        scale = 0.5,
        shift = { 0.21875, 0 },
        width = 160
      },
      layers = {
        {
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-north.png",
          frame_count = 32,
          height = 35,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-north.png",
            frame_count = 32,
            height = 70,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.21875, 0 },
            width = 160
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.1875, 0 },
          width = 80
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-north-glow.png",
          frame_count = 32,
          height = 35,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-north-glow.png",
            frame_count = 32,
            height = 70,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.21875, 0 },
            tint = tint,
            width = 160
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.1875, 0 },
          tint = tint,
          width = 80
        }
      },
      line_length = 8,
      priority = "extra-high",
      shift = { 0.1875, 0 },
      width = 80
    },
    south = {
      filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-south.png",
      frame_count = 32,
      height = 32,
      hr_version = {
        filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-south.png",
        frame_count = 32,
        height = 64,
        line_length = 8,
        priority = "extra-high",
        scale = 0.5,
        shift = { 0.125, 0 },
        width = 164
      },
      layers = {
        {
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-south.png",
          frame_count = 32,
          height = 32,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-south.png",
            frame_count = 32,
            height = 64,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.125, 0 },
            width = 164
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.125, 0 },
          width = 82
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-south-glow.png",
          frame_count = 32,
          height = 32,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-south-glow.png",
            frame_count = 32,
            height = 64,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.125, 0 },
            tint = tint,
            width = 164
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.125, 0 },
          tint = tint,
          width = 82
        }
      },
      line_length = 8,
      priority = "extra-high",
      shift = { 0.125, 0 },
      width = 82
    },
    west = {
      filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-west.png",
      frame_count = 32,
      height = 43,
      hr_version = {
        filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-west.png",
        frame_count = 32,
        height = 86,
        line_length = 8,
        priority = "extra-high",
        scale = 0.5,
        shift = { 0.15625, 0.375 },
        width = 94
      },
      layers = {
        {
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-west.png",
          frame_count = 32,
          height = 43,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-west.png",
            frame_count = 32,
            height = 86,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.15625, 0.375 },
            width = 94
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.1875, 0.375 },
          width = 47
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-west-glow.png",
          frame_count = 32,
          height = 43,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-west-glow.png",
            frame_count = 32,
            height = 86,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.15625, 0.375 },
            tint = tint,
            width = 94
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.1875, 0.375 },
          tint = tint,
          width = 47
        }
      },
      line_length = 8,
      priority = "extra-high",
      shift = { 0.1875, 0.375 },
      width = 47
    }
  }
  obj.structure_animation_movement_cooldown = 10
  obj.structure_animation_speed_coefficient = 1.2
  obj.structure_patch = {
    east = {
      filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-east-top_patch.png",
      frame_count = 32,
      height = 52,
      hr_version = {
        filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-east-top_patch.png",
        frame_count = 32,
        height = 104,
        line_length = 8,
        priority = "extra-high",
        scale = 0.5,
        shift = { 0.125, -0.625 },
        width = 90
      },
      layers = {
        {
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-east-top_patch.png",
          frame_count = 32,
          height = 52,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-east-top_patch.png",
            frame_count = 32,
            height = 104,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.125, -0.625 },
            width = 90
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.125, -0.625 },
          width = 45
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-east-top_patch-glow.png",
          frame_count = 32,
          height = 52,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-east-top_patch-glow.png",
            frame_count = 32,
            height = 104,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.125, -0.625 },
            tint = tint,
            width = 90
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.125, -0.625 },
          tint = tint,
          width = 45
        }
      },
      line_length = 8,
      priority = "extra-high",
      shift = { 0.125, -0.625 },
      width = 45
    },
    north = {
      direction_count = 1,
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      height = 1,
      layers = {
        {
          direction_count = 1,
          filename = "__core__/graphics/empty.png",
          frame_count = 1,
          height = 1,
          priority = "extra-high",
          width = 1
        },
        {
          blend_mode = "additive",
          direction_count = 1,
          filename = "__core__/graphics/empty.png",
          frame_count = 1,
          height = 1,
          priority = "extra-high",
          tint = tint,
          width = 1
        }
      },
      priority = "extra-high",
      width = 1
    },
    south = {
      direction_count = 1,
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      height = 1,
      layers = {
        {
          direction_count = 1,
          filename = "__core__/graphics/empty.png",
          frame_count = 1,
          height = 1,
          priority = "extra-high",
          width = 1
        },
        {
          blend_mode = "additive",
          direction_count = 1,
          filename = "__core__/graphics/empty.png",
          frame_count = 1,
          height = 1,
          priority = "extra-high",
          tint = tint,
          width = 1
        }
      },
      priority = "extra-high",
      width = 1
    },
    west = {
      filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-west-top_patch.png",
      frame_count = 32,
      height = 48,
      hr_version = {
        filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-west-top_patch.png",
        frame_count = 32,
        height = 96,
        line_length = 8,
        priority = "extra-high",
        scale = 0.5,
        shift = { 0.15625, -0.5625 },
        width = 94
      },
      layers = {
        {
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-west-top_patch.png",
          frame_count = 32,
          height = 48,
          hr_version = {
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-west-top_patch.png",
            frame_count = 32,
            height = 96,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.15625, -0.5625 },
            width = 94
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.1875, -0.5625 },
          width = 47
        },
        {
          blend_mode = "additive",
          filename = path_g_se .. "entity/deep-space-splitter/deep-space-splitter-west-top_patch-glow.png",
          frame_count = 32,
          height = 48,
          hr_version = {
            blend_mode = "additive",
            filename = path_g_se .. "entity/deep-space-splitter/hr-deep-space-splitter-west-top_patch-glow.png",
            frame_count = 32,
            height = 96,
            line_length = 8,
            priority = "extra-high",
            scale = 0.5,
            shift = { 0.15625, -0.5625 },
            tint = tint,
            width = 94
          },
          line_length = 8,
          priority = "extra-high",
          shift = { 0.1875, -0.5625 },
          tint = tint,
          width = 47
        }
      },
      line_length = 8,
      priority = "extra-high",
      shift = { 0.1875, -0.5625 },
      width = 47
    }
  }
end

-- ------ Space Exploration ---------------------------------------------------

local SE = {}
SE["transport-belt"]   = SE_belt
SE["underground-belt"] = SE_underground
SE["splitter"]         = SE_splitter

function SE.technology(tint, params)
  return {}
end

-- ============================================================================

return
{
  ["AAI"]               = AAI,
  ["Miniloader"]        = Miniloader,
  ["Krastorio2"]        = Krastorio2,
  ["Space Exploration"] = SE
}