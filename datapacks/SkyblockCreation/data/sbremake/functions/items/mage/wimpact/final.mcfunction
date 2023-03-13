execute at @e[tag=wimpact1] run tp @s ~ ~ ~
function sbremake:gravity
execute at @s if score @p wimpactPart matches 0 run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 1 10 normal
execute at @s run playsound minecraft:entity.generic.explode ambient @s ~ ~ ~ 1 1 1
execute if score @s Wimpact matches 100.. run function sbremake:items/mage/wimpact/shield

scoreboard players set @s manaWarn 1
schedule clear sbremake:manareset
schedule function sbremake:manareset 1s append
title @s actionbar ["",{"text":"Used","color":"aqua"},{"text":" Wither Impact","color":"gold"},{"text":"! (-150 \u270e Mana)","color":"aqua"}]
scoreboard players remove @s mana 150

execute at @s as @e[distance=..6,tag=!spectator] run function sbremake:items/mage/wimpact/dmg

kill @e[tag=wimpact1,limit=1,sort=nearest]
execute at @s unless block ~ ~ ~ air run tp @s ~ ~1 ~