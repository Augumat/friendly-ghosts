#>
# This function should be called once a player has already volunteered and when
#  all participants are ready to begin the game.
#>

# create temporary values for conditional
scoreboard objectives add __dummy dummy
scoreboard objectives add __succ dummy

# if the game has been initialized and there is a target chosen, start the game
#  otherwise, print usage
execute store success score __dummy __succ run tellraw @p[team=blind] ""
execute if score __dummy __succ matches 1 run function scrub:friendlyghosts/zz_dev/dev_s
execute if score __dummy __succ matches 0 run tellraw @s ["",{"text":"No one has volunteered to be blind yet!\nTry running "},{"text":"/function scrub:friendlyghosts/volunteer","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:friendlyghosts/volunteer"}},{"text":" to get started, or run "},{"text":"/function scrub:friendlyghosts/help","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function scrub:friendlyghosts/help"}},{"text":" for more detailed instructions."}]

# clean up
scoreboard objectives remove __succ
scoreboard objectives remove __dummy