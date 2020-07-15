#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /zz_dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# This function is called to reset the game and revert all scoreboard values to
#  their defaults.
#>

# reset gamerules (to server defaults)
gamerule commandBlockOutput true

# un-blind the blind
effect clear @a[team=blind] minecraft:blindness

# remove teams
team remove blind
team remove ghost

# remove scoreboard objectives
scoreboard objectives remove outOfBounds

# remove the constant
scoreboard objectives remove zero

# remove the "initialized" mark
scoreboard objectives remove init

# remove the position updaters
fill 0 255 0 0 196 0 minecraft:air