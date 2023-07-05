data modify storage sbstats:reforge SelectedItem.tag.Upgrades.reforge.type set value 'Fierce'

item modify entity @s weapon.mainhand sbstats:reforge_type

item modify entity @s[predicate=!sbstats:reforged] weapon.mainhand sbstats:old_name
data modify storage sbstats:item_name Name set from entity @s SelectedItem.tag.SBStats.OldName
data modify storage sbstats:reforge Name set from entity @s SelectedItem.tag.Upgrades.reforge.type

# Apply stats

execute if entity @s[predicate=sbstats:holding-rarities/holding-common] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.strength set value 2
execute if entity @s[predicate=sbstats:holding-rarities/holding-common] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_chance set value 2
execute if entity @s[predicate=sbstats:holding-rarities/holding-common] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_damage set value 4

execute if entity @s[predicate=sbstats:holding-rarities/holding-uncommon] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.strength set value 4
execute if entity @s[predicate=sbstats:holding-rarities/holding-uncommon] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_chance set value 3
execute if entity @s[predicate=sbstats:holding-rarities/holding-uncommon] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_damage set value 7

execute if entity @s[predicate=sbstats:holding-rarities/holding-rare] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.strength set value 6
execute if entity @s[predicate=sbstats:holding-rarities/holding-rare] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_chance set value 4
execute if entity @s[predicate=sbstats:holding-rarities/holding-rare] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_damage set value 10

execute if entity @s[predicate=sbstats:holding-rarities/holding-epic] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.strength set value 8
execute if entity @s[predicate=sbstats:holding-rarities/holding-epic] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_chance set value 5
execute if entity @s[predicate=sbstats:holding-rarities/holding-epic] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_damage set value 14

execute if entity @s[predicate=sbstats:holding-rarities/holding-leg] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.strength set value 10
execute if entity @s[predicate=sbstats:holding-rarities/holding-leg] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_chance set value 6
execute if entity @s[predicate=sbstats:holding-rarities/holding-leg] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_damage set value 18

execute if entity @s[predicate=sbstats:holding-rarities/holding-mythic] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.strength set value 12
execute if entity @s[predicate=sbstats:holding-rarities/holding-mythic] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_chance set value 8
execute if entity @s[predicate=sbstats:holding-rarities/holding-mythic] run data modify storage sbstats:reforge Item.tag.Upgrades.reforge.stats.crit_damage set value 24

function sbstats:stats/get_item_stats
item modify entity @s weapon.mainhand sbstats:reforge_stat
item modify entity @s weapon.mainhand sbstats:reforged
execute as @s run function sbstats:reforges/apply_lore