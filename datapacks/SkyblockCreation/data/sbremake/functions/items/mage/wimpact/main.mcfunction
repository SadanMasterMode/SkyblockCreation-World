execute anchored eyes positioned ^ ^ ^ anchored feet if block ^ ^ ^1 #sbremake:items/air run function sbremake:items/mage/wimpact/start_ray
execute anchored eyes positioned ^ ^ ^ anchored feet unless block ^ ^ ^1 #sbremake:items/air anchored feet run tellraw @s [{"text": "There are blocks in the way!","color": "red"}]
execute anchored eyes positioned ^ ^ ^ anchored feet unless block ^ ^ ^1 #sbremake:items/air anchored feet run summon marker ~ ~-0.7 ~ {Tags:["wimpact1","spectator"],Invulnerable:1b,NoGravity:1b,data:{SBRemake:{UUID:"00ed0fa0-6ab8-49ed-ad8f-e1edf22cba5d"}},UUID:[I;15536032,1790462445,-1383079443,-231949731]}