#>
# This function is called to reset the game and revert all scoreboard values to
#  their defaults.  If called during a match, will end the match prematurely.
#>

# create temporary values for conditional
scoreboard objectives add __dummy dummy
scoreboard objectives add __succ dummy

# if the game has been initialized, reset everything
execute store success score __dummy __succ if score gamestate init matches 1
execute if score __dummy __succ matches 1 run function scrub:friendlyghosts/zz_dev/dev_r

# report success and play a sound
playsound minecraft:block.anvil.land master @s ~ ~ ~ 2 0.5
tellraw @s {"text":"Reset complete!","color":"green"}

# clean up temporary values
scoreboard objectives remove __succ
scoreboard objectives remove __dummy