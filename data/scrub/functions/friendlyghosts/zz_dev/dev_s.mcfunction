#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function should be called once a player has already volunteered and when
#  all participants are ready to begin the run.
#>

# play the startup sound
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 0.5

# update gamemodes
gamemode survival @p[team=blind]
gamemode spectator @a[team=ghost]

# set up the updater blocks
# blind the blind
setblock 0 255 0 minecraft:repeating_command_block[conditional=false,facing=down]{auto:1,Command:"effect give @p[team=blind] minecraft:blindness 10 0 true"}
# check if ghosts are out of bounds
setblock 0 254 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"scoreboard players set @a[team=ghost] outOfBounds 0"}
setblock 0 253 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @p[team=blind] run scoreboard players set @a[team=ghost,distance=16..32] outOfBounds 1"}
# grab relative position for ghosts
setblock 0 252 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute store result score @s relX run data get entity @p[team=blind] Pos[0]"}
setblock 0 251 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute store result score @s relY run data get entity @p[team=blind] Pos[1]"}
setblock 0 250 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute store result score @s relZ run data get entity @p[team=blind] Pos[2]"}
setblock 0 249 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute store result score @s posX run data get entity @s Pos[0]"}
setblock 0 248 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute store result score @s posY run data get entity @s Pos[1]"}
setblock 0 247 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute store result score @s posZ run data get entity @s Pos[2]"}
# do relative position math for ghosts
setblock 0 246 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute run scoreboard players operation @s relX -= @s posX"}
setblock 0 245 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute run scoreboard players operation @s relY -= @s posY"}
setblock 0 244 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute run scoreboard players operation @s relZ -= @s posZ"}
# teleport ghosts that are out of bounds back towards the blind player
setblock 0 243 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute if score @s relX > gamestate zero positioned as @s run tp @s ~-1 ~ ~"}
setblock 0 242 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute if score @s relX < gamestate zero positioned as @s run tp @s ~1 ~ ~"}
setblock 0 241 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute if score @s relY > gamestate zero positioned as @s run tp @s ~ ~-1 ~"}
setblock 0 240 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute if score @s relY < gamestate zero positioned as @s run tp @s ~ ~1 ~"}
setblock 0 239 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute if score @s relZ > gamestate zero positioned as @s run tp @s ~ ~ ~-1"}
setblock 0 238 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @a[team=ghost] run execute if score @s relZ < gamestate zero positioned as @s run tp @s ~ ~ ~1"}
# handle local teleportation (like enderpearls)
setblock 0 237 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"tp @a[team=ghost,distance=32..] @p[team=blind]"}
# handle dimension changes
setblock 0 236 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @p[team=blind,predicate=scrub:player_in_overworld] run execute as @a[team=ghost,predicate=!scrub:player_in_overworld] run execute run tp @s @p[team=blind]"}
setblock 0 235 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @p[team=blind,predicate=scrub:player_in_nether] run execute as @a[team=ghost,predicate=!scrub:player_in_nether] run execute run tp @s @p[team=blind]"}
setblock 0 234 0 minecraft:chain_command_block[conditional=false,facing=down]{auto:1,Command:"execute as @p[team=blind,predicate=scrub:player_in_end] run execute as @a[team=ghost,predicate=!scrub:player_in_end] run execute run tp @s @p[team=blind]"}
