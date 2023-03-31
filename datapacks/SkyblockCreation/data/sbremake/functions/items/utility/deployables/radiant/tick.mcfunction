execute as d00ad08c-6d83-4816-95ff-33b3d23d312e run scoreboard players remove @s[scores={life=1..}] life 1

scoreboard players add #radiant-orb-bob fakePlayers 1
execute if score #radiant-orb-bob fakePlayers matches 80.. run scoreboard players reset #radiant-orb-bob fakePlayers

execute as @a[predicate=sbremake:items/utility/deployables/radiant/holding] at @s unless entity 23659f9b-55c6-4089-908e-1cc6a38c3584 run summon area_effect_cloud ~ ~-1 ~ {Radius:0,Duration:2147483647,NoGravity:1b,Passengers:[{id:"minecraft:interaction",NoGravity:1b,Tags:["left-click","spectator"],height:5,width:5,response:1b}],Tags:["left-click","spectator"],UUID:[I;593862555,1439056009,-1869734714,-1551092348]}
# 23659f9b-55c6-4089-908e-1cc6a38c3584

execute as d00ad08c-6d83-4816-95ff-33b3d23d312e if score @s life matches 0 run function sbremake:items/utility/deployables/radiant/final

execute store result score #radiant-life fakePlayers run scoreboard players get d00ad08c-6d83-4816-95ff-33b3d23d312e life
scoreboard players operation #radiant-life fakePlayers /= #20 const
data modify block 3000000 1 3000000 Text1 set value '[{"text":"Radiant ","color":"green"},{"score":{"objective":"fakePlayers","name": "#radiant-life"},"color":"yellow"},{"text":"s","color":"yellow"}]'
data modify entity d00ad08c-6d83-4816-95ff-33b3d23d312e CustomName set from block 3000000 1 3000000 Text1

execute as 9befeee3-67e9-4b7f-b282-987efeb7d2cb at @s run function sbremake:items/utility/deployables/radiant/as-stand

scoreboard players set #radiant-regen fakePlayers 0
execute at cf4104c7-f284-42d1-9c58-9b105a8d158b if entity @a[distance=..18,limit=1] run scoreboard players add #radiant-regen fakePlayers 1
execute at 2122e1df-9d93-496e-8826-edae54fbead6 if entity @a[distance=..18,limit=1] run scoreboard players add #radiant-regen fakePlayers 1
execute at 9befeee3-67e9-4b7f-b282-987efeb7d2cb as @a[distance=..18] if score #radiant-regen fakePlayers matches 0 run effect give @s regeneration infinite 0 true

scoreboard players set #radiant-regen fakePlayers 0
execute at cf4104c7-f284-42d1-9c58-9b105a8d158b if entity @a[distance=..18,limit=1] run scoreboard players add #radiant-regen fakePlayers 1
execute at 2122e1df-9d93-496e-8826-edae54fbead6 if entity @a[distance=..18,limit=1] run scoreboard players add #radiant-regen fakePlayers 1
execute at 9befeee3-67e9-4b7f-b282-987efeb7d2cb as @a[distance=18..,predicate=sbremake:items/utility/deployables/radiant/regen-1,tag=!regen] run effect clear @s regeneration
execute if score #radiant-regen fakePlayers matches 1.. as @a[predicate=sbremake:items/utility/deployables/radiant/regen-1,tag=!regen] run effect clear @s regeneration