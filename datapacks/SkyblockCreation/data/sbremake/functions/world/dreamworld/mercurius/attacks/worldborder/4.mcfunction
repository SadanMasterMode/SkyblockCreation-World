scoreboard players set @s phase 4

tag @s add mercuriusShield
tag @s add invulnerable

fill 98 41 101 102 57 97 barrier replace air
fill 100 43 99 100 44 99 air replace barrier
tp e39dc353-0355-4517-b803-00dee36ca116 100.5 43 99.5
tellraw @a [{"text": "Destroy the Barrier Orbs to damage the boss!","color": "dark_gray","italic": true}]

execute positioned 111 43 99 run summon item_display ~ ~ ~ {Glowing:1b,glow_color_override:1966335,item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-123210,4309,1391,-8618],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvN2RhYWRmODJiYjY3ODI2ZDZkMzNjZTdkODY2ZDU0M2FlMzUxZWFmYWQ3Y2IzOWFhMzhlOTU4YTA1ZDY4OTI4NCJ9fX0="}]}}}},Tags:["not_kill","summon_orb","mercuriusSummon","newDmg","borderOrb","noName"],CustomNameVisible:1b}

execute positioned 88 43 99 run summon item_display ~ ~ ~ {Glowing:1b,glow_color_override:16711680,item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-123210,4409,1391,-8818],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYThiZTFkZmM5Yjc0M2VhODM4ZDUzODNjMzA1YTlhYTVjNWE0MDNmYjY3MGZiYjUyMTBkNGMxNDNiYzliZjAyNiJ9fX0="}]}}}},Tags:["not_kill","damage_orb","mercuriusSummon","newDmg","borderOrb","noName"],CustomNameVisible:1b}

execute positioned 100 43 88 run summon item_display ~ ~ ~ {Glowing:1b,glow_color_override:13369599,item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-123210,4709,1391,-9418],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOWE3NWJlNzhkNjhiOGQwNTE5MWYzNTZmOGYyZThmMWM2ZmRmYzkyYjViNDJiZWQwMDgwN2E3MTgxNDRkZjZjNyJ9fX0="}]}}}},Tags:["not_kill","stalker_orb","mercuriusSummon","newDmg","borderOrb","noName"],CustomNameVisible:1b}

execute positioned 100 43 111 run summon item_display ~ ~ ~ {Glowing:1b,glow_color_override:65522,item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-123210,4809,1391,-9618],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2RiZWIxZDg5NWY0YWM2NmIwOGQyYWRiNDU3ZmYwOWMyOGQwZjU0MTNmYzIwNjFkZDg2YWY1MzE3M2VhOWUyMCJ9fX0="}]}}}},Tags:["not_kill","crying_orb","mercuriusSummon","newDmg","borderOrb","noName"],CustomNameVisible:1b}

scoreboard players set @e[tag=borderOrb] health 1
scoreboard players set @e[tag=borderOrb] hits 15
function sbremake:world/dreamworld/mercurius/attacks/orbs/rotate_1
function sbremake:world/dreamworld/mercurius/attacks/orbs/damage