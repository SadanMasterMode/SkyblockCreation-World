execute as @a at @s anchored eyes run summon marker ^ ^ ^0.1 {Invulnerable:1b,NoGravity:1b,Tags:["fury","spectator"],UUID:[I;873955211,423448039,-1205102092,-1989923792],data:{SBRemake:{UUID:"34177f8b-193d-4de7-b82b-99f489642c30"}}}
execute as 34177f8b-193d-4de7-b82b-99f489642c30 at @s run tp @s ~ ~ ~ facing entity @a[limit=1] eyes

data remove storage sbremake:data PlayerData
data remove storage sbremake:data DamageCalc.Ability
scoreboard players set DamageCalc.Scaling fakePlayers 0

data modify storage sbremake:data Fury.PlayerData set from entity @a[limit=1]
data modify storage sbremake:data DamageCalc.Ability set from storage sbremake:data Fury.PlayerData.SelectedItem.tag.Abilities[0]

schedule clear sbremake:manareset
schedule function sbremake:manareset 1s append
data modify storage sbremake:data Actionbar.AbilityUsage set value '[{"text":"-1000 Mana (","color":"aqua"},{"text":"Firestorm","color":"gold"},{"text":")   ","color":"aqua"}]'

playsound entity.blaze.shoot master @a[distance=..10] ~ ~ ~

scoreboard players remove @a mana 1000
scoreboard players set @a furyCD 0