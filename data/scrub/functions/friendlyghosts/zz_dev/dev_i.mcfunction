#>
# !!! IMPORTANT !!!
# THIS IS A COMPONENT FUNCTION AND SHOULD ONLY BE CALLED INTERNALLY BY OTHER
#  FUNCTIONS IN THIS DATAPACK!  DO NOT CALL FUNCTIONS IN /zz_dev/ UNLESS YOU KNOW
#  WHAT THEY DO!
#>

#>
# Initializes the engine to its beginning state by creating scoreboard
#  objectives and setting gamerules.  This should automatically be called by
#  /volunteer when necessary. (the conditional is a pre-emptive choice to
#  allow for future expansion)
#>

# set gamerules
gamerule commandBlockOutput false

# create teams
team add blind
team modify blind color black
team add ghost
team modify ghost color white

# create scoreboard objective
scoreboard objectives add outOfBounds dummy

# set up a constant for later use
scoreboard objectives add zero dummy
scoreboard players set gamestate zero 0

# mark the game as initialized
scoreboard objectives add init dummy
scoreboard players set gamestate init 1