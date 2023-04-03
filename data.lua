require("prototypes.scripts.remove_unused")
require("prototypes.scripts.autoplace")

-- TODO: rename to megacube?
-- TODO: useless stone/coal/wood/etc from decorations.
-- TODO: output buffer on rare metals / matter, etc, can it be fixed?
-- TODO: layered icons look bad when disabled. Bake them.

-- TODO: science 2 techs:
--       move emotional synthesis to its own tech? +make different and not need dormant cube (or cube at all)
--       construction robots, roboport + 2 chests
--       circuit 2?
--       accumulators?
--       science 3

-- TODO: integrated power/fuel thing. Use Kras2 fuel building?
--       some kind of slightly more efficient/complicated power/steam solution
--       water+sand+wood (?) -> ultradense furnace -> untreated / gelatinous (etc) tar
--       tar -> chemical plant (somewhat big, slow, complicated with byproduct (matter? etc) / loopback) ->
--           -> elbow grease (easier) (for engines?)
--           -> another cube step giving some (small number) kind of solid fuel for vehicles, boilers, etc
--       maybe use glass in vehicles (especially car)
--       remove fuel values or categories from wood/coal
--       hypercube can be used in trains for lols.
--       technology allows (hypercube only) speed/acceleration bonus to work from cargo
-- TODO: good candidate here for something where a cube-source leads into big slow production
--       chain with several steps, then eventually into another cube-powered thing. maybe science 3 or power thing?

-- TODO: science 2 recipes
--       matter + circuit + motor/engine + bottled consciousness + joy/anguish -> 2x different construction robot
--       bottled consciousness + ??? -> science 3

-- TODO: little things
--       walls; gates; radar; cliff explosives; landfill
--       extend upgrade techs
--       - lab speed + increase times (?)

-- TODO: storylore tooltips!
-- TODO: some cube process that outputs random / multiple products.
-- TODO: ultradense constituent and reassembly. Something with weird ratios. Need to recharge many constituents at once?
-- TODO: something that forces cube to go far away on train (probably miners)
-- TODO: upgrade graphics for (particularly) boiler, maybe also pipes/tanks/steam engine?
-- TODO: some sort of weird biter farmer spawning synthesis.
-- TODO: late game forbidden tech. Experiments on cube. Suffering. Regret.
-- TODO: some sort of teleport cube logistics option.
-- TODO: (further on) basic antimatter unit. Basic dark matter unit. Matter annihilation (matter + antimatter) -> energy!
-- TODO: eventually, modules.
-- TODO: some joke with hydroxyl group vs abelian group.

require("prototypes.equipment")
require("prototypes.fluids")
require("prototypes.fuel_categories")
require("prototypes.item_groups")
require("prototypes.items")
require("prototypes.items_equipment")
require("prototypes.items_resources")
require("prototypes.items_production")
require("prototypes.items_science")
require("prototypes.recipe_categories")
require("prototypes.recipes_intermediates")
require("prototypes.recipes_logistics")
require("prototypes.recipes_production")
require("prototypes.recipes_science")
require("prototypes.resources")
require("prototypes.technology_upgrades")
require("prototypes.technology")
require("prototypes.tweaks")

require("prototypes.entities.boiler")
require("prototypes.entities.chemical_plant")
require("prototypes.entities.crusher")
require("prototypes.entities.electric_furnace")
require("prototypes.entities.electric_mining_drills")
require("prototypes.entities.explosions")
require("prototypes.entities.fabricator")
require("prototypes.entities.greenhouse")
require("prototypes.entities.lab")
require("prototypes.entities.recovery_bay")
require("prototypes.entities.remnants")
require("prototypes.entities.robots")
require("prototypes.entities.synthesizer")
require("prototypes.entities.ultradense_furnace")

for _, t in pairs(data.raw.technology) do
  t.enabled = false
end