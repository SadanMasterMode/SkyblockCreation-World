kill @e[tag=maskLC]

execute at @a run summon minecraft:interaction ~ ~ ~ {NoGravity:1b,Tags:["maskLC","lc","spectator"],height:3,width:3}
scoreboard players set @a[limit=1] fallingEdge 1