#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /zz_dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function volunteers the caller to be blind and every other player as a
#  ghost, then notifies them.  After this function has been called, the game
#  can begin in earnest.
#>

# separate the players into their respective teams
team join ghost @a
team join blind @s

# play a sound and notify the blind person and the ghosts of their roles
execute as @p[team=blind] run playsound minecraft:entity.arrow.shoot master @s ~ ~ ~ 1 0.8
tellraw @p[team=blind] ["",{"text":"You will be blind when the round starts. ","color":"gray"},{"selector":"@a[team=ghost]","color":"white"},{"text":" will help you as spectators!","color":"gray"}]
execute as @a[team=ghost] run playsound minecraft:entity.ghast.warn master @s ~ ~ ~ 1 0.5
tellraw @a[team=ghost] ["",{"text":"You will be a ghost when the round starts. Your job is to help ","color":"gray"},{"selector":"@p[team=blind]","color":"black"},{"text":" finish the game!","color":"gray"}]
