tellraw @a [{"text": "Your Overflux Power Orb ran out!","color": "red"}]
scoreboard players reset #overflux-orb-bob fakePlayers
scoreboard players reset @s life
tag @a[tag=near-overflux] remove near-overflux
effect clear @a[predicate=sbremake:items/utility/deployables/overflux/regen-3] regeneration

execute on vehicle run kill @s
kill @s