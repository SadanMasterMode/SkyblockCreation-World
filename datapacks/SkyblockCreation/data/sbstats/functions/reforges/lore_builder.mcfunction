# PRE STUFF
function sbstats:stats/get_item_stats
tag @s add recombLoreBuilder

# Get item type/reforge
item modify entity @s[nbt=!{SelectedItem:{tag:{Upgrades:{reforged:1b}}}}] weapon.mainhand sbstats:old_name
data modify storage sbstats:item_name Name set from entity @s SelectedItem.tag.OldName
data modify storage sbstats:reforge Name set from entity @s SelectedItem.tag.Upgrades.reforge.type
# Apply new name (no reforge)
data remove storage sbstats:reforge Item.tag.OldName
fill 3000000 0 2000000 3000000 0 2000000 air replace oak_sign

execute if entity @s[nbt={SelectedItem:{tag:{Base:{rarity:'COMMON'}}}}] run setblock 3000000 0 2000000 oak_sign{Text1:'[{"nbt":"Name","storage": "sbstats:item_name","color": "white","interpret": true,"italic": false}]'}
execute if entity @s[nbt={SelectedItem:{tag:{Base:{rarity:'UNCOMMON'}}}}] run setblock 3000000 0 2000000 oak_sign{Text1:'[{"nbt":"Name","storage": "sbstats:item_name","color": "green","interpret": true,"italic": false}]'}
execute if entity @s[nbt={SelectedItem:{tag:{Base:{rarity:'RARE'}}}}] run setblock 3000000 0 2000000 oak_sign{Text1:'[{"nbt":"Name","storage": "sbstats:item_name","color": "blue","interpret": true,"italic": false}]'}
execute if entity @s[nbt={SelectedItem:{tag:{Base:{rarity:'EPIC'}}}}] run setblock 3000000 0 2000000 oak_sign{Text1:'[{"nbt":"Name","storage": "sbstats:item_name","color": "dark_purple","interpret": true,"italic": false}]'}
execute if entity @s[nbt={SelectedItem:{tag:{Base:{rarity:'LEGENDARY'}}}}] run setblock 3000000 0 2000000 oak_sign{Text1:'[{"nbt":"Name","storage": "sbstats:item_name","color": "gold","interpret": true,"italic": false}]'}
execute if entity @s[nbt={SelectedItem:{tag:{Base:{rarity:'MYTHIC'}}}}] run setblock 3000000 0 2000000 oak_sign{Text1:'[{"nbt":"Name","storage": "sbstats:item_name","color": "light_purple","interpret": true,"italic": false}]'}
execute if entity @s[nbt={SelectedItem:{tag:{Base:{rarity:'DIVINE'}}}}] run setblock 3000000 0 2000000 oak_sign{Text1:'[{"nbt":"Name","storage": "sbstats:item_name","color": "aqua","interpret": true,"italic": false}]'}

data modify storage sbstats:reforge Item.tag.OldName set from block 3000000 0 2000000 Text1
item modify entity @s[nbt=!{SelectedItem:{tag:{Upgrades:{reforged:1b}}}}] weapon.mainhand sbstats:item_name_2
# Apply new name (reforged)
execute if entity @s[nbt={SelectedItem:{tag:{Upgrades:{reforged:1b}}}}] run function sbstats:reforges/reforge_name
# Get the item's stats and old lore
data modify storage sbstats:reforge Item.tag.OldLore set from entity @s SelectedItem.tag.Base.description
# Prep
tag @s add LoreBuilder
setblock 3000000 0 2000000 air
data remove storage sbstats:reforge Item.tag.NewLore

# RED STATS

# DAMAGE
data remove storage sbstats:reforge damage
execute if score #damage reforgeStats matches 1.. run data modify storage sbstats:reforge damage set value '[{"text":"(+","color":"blue"},{"score":{"name":"#damage","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_damage stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Damage: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_damage","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"damage","storage": "sbstats:reforge","color": "blue","interpret": true,"italic": false}]'} destroy
execute if score #Base_damage stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# STRENGTH
data remove storage sbstats:reforge strength
execute if score #strength reforgeStats matches 1.. run data modify storage sbstats:reforge strength set value '[{"text":"(+","color":"blue"},{"score":{"name":"#strength","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_strength stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Strength: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_strength","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"strength","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_strength stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# CRIT DAMAGE
data remove storage sbstats:reforge crit_damage
execute if score #crit_damage reforgeStats matches 1.. run data modify storage sbstats:reforge crit_damage set value '[{"text":"(+","color":"blue"},{"score":{"name":"#crit_damage","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_crit_damage stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Crit Damage: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_crit_damage","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"crit_damage","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_crit_damage stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# CRIT CHANCE
data remove storage sbstats:reforge crit_chance
execute if score #crit_chance reforgeStats matches 1.. run data modify storage sbstats:reforge crit_chance set value '[{"text":"(+","color":"blue"},{"score":{"name":"#crit_chance","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_crit_chance stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Crit Chance: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_crit_chance","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"crit_chance","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_crit_chance stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# FEROCITY
data remove storage sbstats:reforge ferocity
execute if score #ferocity reforgeStats matches 1.. run data modify storage sbstats:reforge ferocity set value '[{"text":"(+","color":"blue"},{"score":{"name":"#ferocity","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_ferocity stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Ferocity: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_ferocity","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"ferocity","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_ferocity stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# ATTACK SPEED
data remove storage sbstats:reforge atk_speed
execute if score #atk_speed reforgeStats matches 1.. run data modify storage sbstats:reforge atk_speed set value '[{"text":"(+","color":"blue"},{"score":{"name":"#atk_speed","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_atk_speed stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Base Attack Speed: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_atk_speed","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"atk_speed","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_atk_speed stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# ABILITY DAMAGE
data remove storage sbstats:reforge abil_dmg
execute if score #abil_dmg reforgeStats matches 1.. run data modify storage sbstats:reforge abil_dmg set value '[{"text":"(+","color":"blue"},{"score":{"name":"#abil_dmg","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_abil_dmg stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Bonus Ability Damage: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_abil_dmg","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"abil_dmg","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_abil_dmg stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# VITALITY
data remove storage sbstats:reforge vitality
execute if score #vitality reforgeStats matches 1.. run data modify storage sbstats:reforge vitality set value '[{"text":"(+","color":"blue"},{"score":{"name":"#vitality","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_vitality stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Vitality: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_vitality","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"vitality","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_vitality stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1

# GREEN STATS

# HEALTH
data remove storage sbstats:reforge health
execute if score #health reforgeStats matches 1.. run data modify storage sbstats:reforge health set value '[{"text":"(+","color":"blue"},{"score":{"name":"#health","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_health stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Health: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_health","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"health","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_health stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# DEFENSE
data remove storage sbstats:reforge defense
execute if score #defense reforgeStats matches 1.. run data modify storage sbstats:reforge defense set value '[{"text":"(+","color":"blue"},{"score":{"name":"#defense","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_defense stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Defense: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_defense","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"defense","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_defense stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# INTELLIGENCE
data remove storage sbstats:reforge intelligence
execute if score #intelligence reforgeStats matches 1.. run data modify storage sbstats:reforge intelligence set value '[{"text":"(+","color":"blue"},{"score":{"name":"#intelligence","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_intelligence stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Intelligence: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_intelligence","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"intelligence","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_intelligence stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# SPEED
data remove storage sbstats:reforge speed
execute if score #speed reforgeStats matches 1.. run data modify storage sbstats:reforge speed set value '[{"text":"(+","color":"blue"},{"score":{"name":"#speed","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_speed stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Speed: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_speed","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"speed","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_speed stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# MAGIC FIND
data remove storage sbstats:reforge magic_find
execute if score #magic_find reforgeStats matches 1.. run data modify storage sbstats:reforge magic_find set value '[{"text":"(+","color":"blue"},{"score":{"name":"#magic_find","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_magic_find stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Magic Find: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_magic_find","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"magic_find","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_magic_find stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# PET LUCK
data remove storage sbstats:reforge pet_luck
execute if score #pet_luck reforgeStats matches 1.. run data modify storage sbstats:reforge pet_luck set value '[{"text":"(+","color":"blue"},{"score":{"name":"#pet_luck","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_pet_luck stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Pet Luck: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_pet_luck","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"pet_luck","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_pet_luck stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# HEALTH REGEN
data remove storage sbstats:reforge health_regen
execute if score #health_regen reforgeStats matches 1.. run data modify storage sbstats:reforge health_regen set value '[{"text":"(+","color":"blue"},{"score":{"name":"#health_regen","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_health_regen stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Health Regen: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_health_regen","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"health_regen","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_health_regen stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# MENDING
data remove storage sbstats:reforge mending
execute if score #mending reforgeStats matches 1.. run data modify storage sbstats:reforge mending set value '[{"text":"(+","color":"blue"},{"score":{"name":"#mending","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_mending stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Mending: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_mending","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"mending","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_mending stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# TRUE DEFENSE
data remove storage sbstats:reforge true_def
execute if score #true_def reforgeStats matches 1.. run data modify storage sbstats:reforge true_def set value '[{"text":"(+","color":"blue"},{"score":{"name":"#true_def","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_true_def stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "True Defense: ","color":"gray","italic": false},{"text":"+","color":"green","italic": false},{"score":{"name": "#Base_true_def","objective": "stats"},"color":"green","italic": false},{"text": " "},{"nbt":"true_def","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_true_def stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1

# BLUE STATS
# SCC
data remove storage sbstats:reforge scc
execute if score #scc reforgeStats matches 1.. run data modify storage sbstats:reforge scc set value '[{"text":"(+","color":"blue"},{"score":{"name":"#scc","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_scc stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Sea Creature Chance: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_scc","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"scc","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_scc stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# Fishing Speed
data remove storage sbstats:reforge fishing_speed
execute if score #fishing_speed reforgeStats matches 1.. run data modify storage sbstats:reforge fishing_speed set value '[{"text":"(+","color":"blue"},{"score":{"name":"#fishing_speed","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_fishing_speed stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Fishing Speed: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_fishing_speed","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"fishing_speed","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_fishing_speed stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# COMBAT WISDOM
data remove storage sbstats:reforge wisdom_combat
execute if score #wisdom_combat reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_combat set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_combat","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_combat stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Combat Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_combat","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_combat","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_combat stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# MINING WISDOM
data remove storage sbstats:reforge wisdom_mining
execute if score #wisdom_mining reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_mining set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_mining","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_mining stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Mining Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_mining","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_mining","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_mining stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# FARMING WISDOM
data remove storage sbstats:reforge wisdom_farming
execute if score #wisdom_farming reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_farming set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_farming","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_farming stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Farming Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_farming","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_farming","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_farming stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# FORAGING WISDOM
data remove storage sbstats:reforge wisdom_foraging
execute if score #wisdom_foraging reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_foraging set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_foraging","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_foraging stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Foraging Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_foraging","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_foraging","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_foraging stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# FISHING WISDOM
data remove storage sbstats:reforge wisdom_fishing
execute if score #wisdom_fishing reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_fishing set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_fishing","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_fishing stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Fishing Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_fishing","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_fishing","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_fishing stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# ENCHANTING WISDOM
data remove storage sbstats:reforge wisdom_enchanting
execute if score #wisdom_enchanting reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_enchanting set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_enchanting","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_enchanting stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Enchanting Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_enchanting","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_enchanting","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_enchanting stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# ALCHEMY WISDOM
data remove storage sbstats:reforge wisdom_alchemy
execute if score #wisdom_alchemy reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_alchemy set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_alchemy","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_alchemy stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Alchemy Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_alchemy","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_alchemy","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_alchemy stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# CARPENTRY WISDOM
data remove storage sbstats:reforge wisdom_carpentry
execute if score #wisdom_carpentry reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_carpentry set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_carpentry","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_carpentry stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Carpentry Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_carpentry","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_carpentry","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_carpentry stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# RUNECRAFTING WISDOM
data remove storage sbstats:reforge wisdom_rune
execute if score #wisdom_rune reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_rune set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_rune","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_rune stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Runecrafting Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_rune","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_rune","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_rune stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# SOCIAL WISDOM
data remove storage sbstats:reforge wisdom_social
execute if score #wisdom_social reforgeStats matches 1.. run data modify storage sbstats:reforge wisdom_social set value '[{"text":"(+","color":"blue"},{"score":{"name":"#wisdom_social","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_wisdom_social stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Social Wisdom: ","color":"gray","italic": false},{"text":"+","color":"dark_aqua","italic": false},{"score":{"name": "#Base_wisdom_social","objective": "stats"},"color":"dark_aqua","italic": false},{"text": " "},{"nbt":"wisdom_social","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_wisdom_social stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1

# GOLD STATS
# MINING SPEED
data remove storage sbstats:reforge mining_speed
execute if score #mining_speed reforgeStats matches 1.. run data modify storage sbstats:reforge mining_speed set value '[{"text":"(+","color":"blue"},{"score":{"name":"#mining_speed","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_mining_speed stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Mining Speed: ","color":"gray","italic": false},{"text":"+","color":"gold","italic": false},{"score":{"name": "#Base_mining_speed","objective": "stats"},"color":"gold","italic": false},{"text": " "},{"nbt":"mining_speed","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_mining_speed stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# BREAKING POWER
data remove storage sbstats:reforge breaking_power
execute if score #breaking_power reforgeStats matches 1.. run data modify storage sbstats:reforge breaking_power set value '[{"text":"(+","color":"blue"},{"score":{"name":"#breaking_power","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_breaking_power stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "breaking_power: ","color":"gray","italic": false},{"text":"+","color":"gold","italic": false},{"score":{"name": "#Base_breaking_power","objective": "stats"},"color":"gold","italic": false},{"text": " "},{"nbt":"breaking_power","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_breaking_power stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# PRISTINE
data remove storage sbstats:reforge pristine
execute if score #pristine reforgeStats matches 1.. run data modify storage sbstats:reforge pristine set value '[{"text":"(+","color":"blue"},{"score":{"name":"#pristine","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_pristine stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Pristine: ","color":"gray","italic": false},{"text":"+","color":"gold","italic": false},{"score":{"name": "#Base_pristine","objective": "stats"},"color":"gold","italic": false},{"text": " "},{"nbt":"pristine","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_pristine stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# FORAGING FORTUNE
data remove storage sbstats:reforge fortune_foraging
execute if score #fortune_foraging reforgeStats matches 1.. run data modify storage sbstats:reforge fortune_foraging set value '[{"text":"(+","color":"blue"},{"score":{"name":"#fortune_foraging","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_fortune_foraging stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Foraging Fortune: ","color":"gray","italic": false},{"text":"+","color":"gold","italic": false},{"score":{"name": "#Base_fortune_foraging","objective": "stats"},"color":"gold","italic": false},{"text": " "},{"nbt":"fortune_foraging","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_fortune_foraging stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# FARMING FORTUNE
data remove storage sbstats:reforge fortune_farming
execute if score #fortune_farming reforgeStats matches 1.. run data modify storage sbstats:reforge fortune_farming set value '[{"text":"(+","color":"blue"},{"score":{"name":"#fortune_farming","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_fortune_farming stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Farming Fortune: ","color":"gray","italic": false},{"text":"+","color":"gold","italic": false},{"score":{"name": "#Base_fortune_farming","objective": "stats"},"color":"gold","italic": false},{"text": " "},{"nbt":"fortune_farming","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_fortune_farming stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
# MINING FORTUNE
data remove storage sbstats:reforge fortune_mining
execute if score #fortune_mining reforgeStats matches 1.. run data modify storage sbstats:reforge fortune_mining set value '[{"text":"(+","color":"blue"},{"score":{"name":"#fortune_mining","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_fortune_mining stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "Mining Fortune: ","color":"gray","italic": false},{"text":"+","color":"gold","italic": false},{"score":{"name": "#Base_fortune_mining","objective": "stats"},"color":"gold","italic": false},{"text": " "},{"nbt":"fortune_mining","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_fortune_mining stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1

# Add old lore
execute if entity @s[nbt={SelectedItem:{tag:{Upgrades:{reforge:{stats:{}}}}}}] run data modify storage sbstats:reforge Item.tag.NewLore append value '[{"text":" "}]'
data modify storage sbstats:reforge Item.tag.NewLore append from storage sbstats:reforge Item.tag.OldLore[]

# Reforge Bonus
execute if data storage sbstats:stone SelectedItem.tag.ReforgeStone.bonus[] run function sbstats:reforges/reforge_bonus
data modify storage sbstats:reforge Item.tag.NewLore append from storage sbstats:stone Item.tag.ReforgeBonus[]
data remove storage sbstats:stone SelectedItem
data remove storage sbstats:stone Item.tag.ReforgeBonus

# Clean Up (rarity + misc)
data modify storage sbstats:reforge Item.tag.NewLore append value '[{"text":" "}]'
execute if entity @s[nbt={SelectedItem:{tag:{Base:{soulbound:'COOP'}}}}] run data modify storage sbstats:reforge Item.tag.NewLore append value '[{"text":"٭ ","bold":true,"italic":false,"color":"dark_gray"},{"text":"Co-op Soulbound","bold":false,"italic":false,"color":"dark_gray"},{"text":" ٭","bold":true,"italic":false,"color":"dark_gray"}]'
execute if entity @s[nbt={SelectedItem:{tag:{Base:{soulbound:'SOLO'}}}}] run data modify storage sbstats:reforge Item.tag.NewLore append value '[{"text":"٭ ","bold":true,"italic":false,"color":"dark_gray"},{"text":"Soulbound","bold":false,"italic":false,"color":"dark_gray"},{"text":" ٭","bold":true,"italic":false,"color":"dark_gray"}]'
execute if entity @s[nbt={SelectedItem:{tag:{Upgrades:{reforge:{stats:{}}}}}}] unless entity @s[nbt={SelectedItem:{tag:{Upgrades:{reforged:1b}}}}] run data modify storage sbstats:reforge Item.tag.NewLore append value '[{"text":"This item can be reforged!","bold":false,"italic":false,"color":"dark_gray"}]'
function sbstats:reforges/lore_rarity
data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1
tag @s remove LoreBuilder
kill @e[type=item,nbt={Item:{id:"minecraft:oak_sign"}}]

# Apply Lore
item replace block 3000000 0 2000001 container.0 from entity @s weapon.mainhand
item modify block 3000000 0 2000001 container.0 sbstats:replace_lore
item replace entity @s weapon.mainhand from block 3000000 0 2000001 container.0

# YADA
data remove storage sbstats:reforge yada
execute if score #yada reforgeStats matches 1.. run data modify storage sbstats:reforge yada set value '[{"text":"(+","color":"blue"},{"score":{"name":"#yada","objective":"reforgeStats"},"color":"blue"},{"text":")","color":"blue"}]'
execute if score #Base_yada stats matches 1.. run setblock 3000000 0 2000000 oak_sign[rotation=12]{Text1:'[{"text": "yada: ","color":"gray","italic": false},{"text":"+","color":"red","italic": false},{"score":{"name": "#Base_yada","objective": "stats"},"color":"red","italic": false},{"text": " "},{"nbt":"yada","storage": "sbstats:reforge","color": "blue","interpret": true}]'} destroy
execute if score #Base_yada stats matches 1.. run data modify storage sbstats:reforge Item.tag.NewLore append from block 3000000 0 2000000 Text1