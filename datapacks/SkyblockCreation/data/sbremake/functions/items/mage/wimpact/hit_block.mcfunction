#Mark the ray as having found a block.

scoreboard players set #hit wimpactTemp 1

#Running custom commands since the block was found.

summon marker ~ ~-0.7 ~ {Tags:["wimpact1","spectator"],Invulnerable:1b,NoGravity:1b,data:{SBRemake:{UUID:"00ed0fa0-6ab8-49ed-ad8f-e1edf22cba5d"}},UUID:[I;15536032,1790462445,-1383079443,-231949731]}
tellraw @a [{"text": "There are blocks in the way!","color": "red"}]