-- Disable all default items (except for whitelisted), recipes and technologies.
local default_item_whitelist = {
  ["water"] = true,
  ["steam"] = true,
  ["pipe"] = true,
  ["storage-tank"] = true,
  ["steam-engine"] = true,
  ["offshore-pump"] = true,
  ["fast-transport-belt"] = true,
  ["fast-underground-belt"] = true,
  ["fast-splitter"] = true,
  ["express-transport-belt"] = true,
  ["express-underground-belt"] = true,
  ["express-splitter"] = true,
  ["small-lamp"] = true,
  ["copper-cable"] = true,
  ["red-wire"] = true,
  ["green-wire"] = true,
  ["constant-combinator"] = true,
  ["arithmetic-combinator"] = true,
  ["decider-combinator"] = true,
  ["power-switch"] = true,
  ["programmable-speaker"] = true,
  ["medium-electric-pole"] = true,
  ["big-electric-pole"] = true,
  ["substation"] = true,
  ["fast-inserter"] = true,
  ["long-handed-inserter"] = true,
  ["filter-inserter"] = true,
  ["stack-inserter"] = true,
  ["stack-filter-inserter"] = true,
}

-- TODO: various entities must be hidden explicitly (not just the item)
-- to avoid showing up in places. Done for inserters.
for _, v in pairs(data.raw) do
  for _, t in pairs(v) do
    if not default_item_whitelist[t.name] and t.next_upgrade then
      t.next_upgrade = nil
    end
  end
end
for _, t in pairs(data.raw.inserter) do
  if not default_item_whitelist[t.name] then
    if not t.flags then
      t.flags = {}
    end
    t.flags[#t.flags + 1] = "hidden"
  end
end
for _, t in pairs(data.raw.item) do
  if not default_item_whitelist[t.name] then
    if not t.flags then
      t.flags = {}
    end
    t.flags[#t.flags + 1] = "hidden"
  end
end

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end
for _, t in pairs(data.raw.recipe) do
  t.enabled = false
  if t.normal then
    t.normal.enabled = false
  end
  if t.expensive then
    t.expensive.enabled = false
  end
end

-- Disable all default autoplacing.
local function copy_autoplace_control(source, target)
  for _, t in pairs(data.raw["map-gen-presets"]) do
    for _, preset in pairs(t) do
      if preset.basic_settings and preset.basic_settings.autoplace_controls then
        preset.basic_settings.autoplace_controls[target] = preset.basic_settings.autoplace_controls[source]
      end
    end
  end
end

local function remove_autoplace_control(name)
  data.raw["autoplace-control"][name] = nil
  for _, t in pairs(data.raw["map-gen-presets"]) do
    for _, preset in pairs(t) do
      if preset.basic_settings and preset.basic_settings.autoplace_controls then
        preset.basic_settings.autoplace_controls[name] = nil
      end
    end
  end
end

copy_autoplace_control("stone", "cube-rare-metals")
remove_autoplace_control("iron-ore")
remove_autoplace_control("copper-ore")
remove_autoplace_control("stone")
remove_autoplace_control("coal")
remove_autoplace_control("uranium-ore")
remove_autoplace_control("crude-oil")
remove_autoplace_control("enemy-base")

data.raw.resource["iron-ore"].autoplace = nil
data.raw.resource["copper-ore"].autoplace = nil
data.raw.resource["stone"].autoplace = nil
data.raw.resource["coal"].autoplace = nil
data.raw.resource["uranium-ore"].autoplace = nil
data.raw.resource["crude-oil"].autoplace = nil

data.raw.turret["small-worm-turret"].autoplace = nil
data.raw.turret["medium-worm-turret"].autoplace = nil
data.raw.turret["big-worm-turret"].autoplace = nil
data.raw.turret["behemoth-worm-turret"].autoplace = nil
data.raw["unit-spawner"]["biter-spawner"].autoplace = nil
data.raw["unit-spawner"]["spitter-spawner"].autoplace = nil

-- TODO: useless stone/coal/wood/etc from decorations.
-- TODO: output buffer on rare metals / matter, etc, can it be fixed?
-- TODO: add some cool light/effect to whatever is holding the cube. Maybe matter explosions.
-- TODO: if possible, causality induction to retrieve cube. Maybe later allow in recovery bay
--       as a cube teleport logistic option. Or teleport building somehow.

-- TODO: crushing: enriched ore + sand (-> glass -> vesselheim) + calcium?
-- TODO: calcium -> intelligent calcium + (vesselheim) flask -> bottled consciousness / sentience transfer.
-- TODO: emotion synthesis. Joy / anguish. Regret (used for voiding?)
-- TODO: bottled consciousness + intermediates + Joy/Anguish -> 2x different construction
--       bots that look the same, but 1 horribly slow
-- TODO: good candidate here for something where a cube-source leads into big slow production
--       chain with several steps, then eventually into another cube-powered thing

-- TODO: science 2 techs:
--       chemical plant, replication (early)
--       construction robots, roboport (via sentience transfer)
--       circuit 2?
--       accumulators?
--       trains. fuel processing gives train fuel and somehow more efficient power
--       hypercube can be used in trains for lols

-- TODO: storylore tooltips!
-- TODO: rework lattice. Bit pointless right now. More complications.
-- TODO: ultradense constituent and reassembly. Something with weird ratios. Need to recharge many constituents at once?
-- TODO: upgrade graphics for (particularly) boiler, maybe also pipes/tanks/steam engine?
-- TODO: something that requires _dormant_ cube? Tooltip: for safety, must be done while indisposed to avoid adverse reactions.
-- TODO: some sort of weird biter farmer spawning synthesis.
-- TODO: late game forbidden tech. Experiments on cube. Suffering

-- TODO: (further on) basic antimatter unit. Basic dark matter unit.
-- TODO: some joke with hydroxyl group vs abelian group.

require("prototypes.fluids")
require("prototypes.fuel_categories")
require("prototypes.item_groups")
require("prototypes.items")
require("prototypes.items_resources")
require("prototypes.items_production")
require("prototypes.items_science")
require("prototypes.recipe_categories")
require("prototypes.recipes_intermediates")
require("prototypes.recipes_logistics")
require("prototypes.recipes_production")
require("prototypes.recipes_science")
require("prototypes.technology")
require("prototypes.resources")

require("prototypes.entities.boiler")
require("prototypes.entities.lab")
require("prototypes.entities.electric_mining_drills")
require("prototypes.entities.ultradense_furnace")
require("prototypes.entities.recovery_bay")
require("prototypes.entities.synthesizer")
require("prototypes.entities.fabricator")
require("prototypes.entities.explosions")
require("prototypes.entities.remnants")
require("prototypes.entities.tweaks")
