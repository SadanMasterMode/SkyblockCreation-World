execute anchored eyes positioned ^ ^-0.5 ^0.5 run summon area_effect_cloud ~ ~ ~ {Radius:0,Duration:2147483647,Tags:["frozen-scythe-bolt","spectator","to-do","projectile"],Passengers:[{id:"minecraft:block_display",block_state:{Name:"minecraft:ice",Properties:{}},transformation:[0.1768f,-0.0000f,0.1768f,-0.1875f,0.1250f,0.1768f,-0.1250f,-0.1250f,-0.1250f,0.1768f,0.1250f,0.3750f,0.0000f,0.0000f,0.0000f,1.0000f],Tags:["frozen-scythe-bolt","spectator","to-do","projectile"]},{id:"minecraft:block_display",block_state:{Name:"minecraft:ice",Properties:{}},transformation:[0.1768f,-0.0000f,0.1768f,-0.1875f,0.1250f,0.1768f,-0.1250f,-0.1250f,-0.1250f,0.1768f,0.1250f,0.1250f,0.0000f,0.0000f,0.0000f,1.0000f],Tags:["frozen-scythe-bolt","spectator","to-do","projectile"]},{id:"minecraft:block_display",block_state:{Name:"minecraft:ice",Properties:{}},transformation:[0.1768f,-0.0000f,0.1768f,-0.1875f,0.1250f,0.1768f,-0.1250f,-0.1250f,-0.1250f,0.1768f,0.1250f,0.6250f,0.0000f,0.0000f,0.0000f,1.0000f],Tags:["frozen-scythe-bolt","spectator","to-do","projectile"]},{id:"minecraft:block_display",block_state:{Name:"minecraft:ice",Properties:{}},transformation:[0.1768f,-0.0000f,0.1768f,-0.1875f,0.1250f,0.1768f,-0.1250f,-0.1250f,-0.1250f,0.1768f,0.1250f,0.8750f,0.0000f,0.0000f,0.0000f,1.0000f],Tags:["frozen-scythe-bolt","spectator","to-do","projectile"]}]}

execute as @e[tag=to-do,tag=frozen-scythe-bolt] at @s rotated as @a run tp @s ~ ~ ~ ~ ~ 
tag @e[tag=to-do,tag=frozen-scythe-bolt] remove to-do