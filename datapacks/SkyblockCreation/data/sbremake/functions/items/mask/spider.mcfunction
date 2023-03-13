execute if score @p spookyMute matches 1 run execute if entity @e[tag=spookyCart] run tellraw @p [{"text":"You selected Arthropod Mode","color":"red"}]
tag @p remove skeletonMode
tag @p remove explosionMode
tag @p remove zombieMode
tag @p add arthropodMode
item replace entity @p weapon.mainhand from block 0 0 0 container.4
clear @p minecraft:player_head{SkullOwner:{Id:[I;-1339275177,1329941719,-2024897808,-1501401745],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzVlMjQ4ZGEyZTEwOGYwOTgxM2E2Yjg0OGEwZmNlZjExMTMwMDk3ODE4MGVkYTQxZDNkMWE3YThlNGRiYTNjMyJ9fX0="}]}},display:{Name:'[{"text":"Arthropod Mode","italic":false,"color":"red"}]',Lore:['[{"text":"Click to select ","italic":false,"color":"gray"},{"text":"Arthropod Repellent!","color":"red"},{"text":"","color":"dark_purple"}]','[{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"All ","italic":false,"color":"gray"},{"text":"Arthropods ","color":"red"},{"text":"within "},{"text":"20 ","color":"green"},{"text":"blocks","color":"gray"}]','[{"text":"will automatically be ","italic":false,"color":"gray"},{"text":"pushed away","color":"green"},{"text":"!","color":"gray"}]','[{"text":"","italic":false,"color":"gray"}]','[{"text":"Works On:","italic":false,"color":"gray"}]','[{"text":" - ","italic":false,"color":"gray"},{"text":"Spiders","color":"red"},{"text":"","color":"dark_purple"}]','[{"text":" - ","italic":false,"color":"gray"},{"text":"Cave Spiders","color":"red"},{"text":"","color":"dark_purple"}]','[{"text":" - ","italic":false,"color":"gray"},{"text":"Silverfish","color":"red"},{"text":"","color":"dark_purple"}]','[{"text":" - ","italic":false,"color":"gray"},{"text":"Bees","color":"red"},{"text":"","color":"dark_purple"}]','[{"text":" - ","italic":false,"color":"gray"},{"text":"Endermites","color":"red"},{"text":"","color":"dark_purple"}]','[{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"Custom Item","italic":false,"color":"dark_gray"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"GUI ITEM","italic":false,"color":"red","bold":true}]']}}
tp @e[tag=spookyCart] ~ ~-100 ~
kill @e[tag=spookyCart]
scoreboard players set @p inSpookyGUI 0
execute at @p run playsound minecraft:entity.spider.hurt master @p ~ ~ ~