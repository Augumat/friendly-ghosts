# There are voices in my head...

A Minecraft data pack that implements a minigame where a blind player is guided by other players tethered to them in spectator mode.

## Installation

1. Download the latest version of the pack `friendly-ghosts-(version).zip` from the RELEASES tab on this page.
2. Create a new world for the match (the world folder needs to exist).
3. Place the zip file in the `datapacks` folder inside your world file.
    1. For steps 2-3 you can also add the datapack through the datapack manager when creating a singleplayer world, and use that world either on LAN or on your server by moving the world file to your server folder.
4. Fire up the game/server and begin!

## Usage

Just follow these two steps to start the match!

1. Run `/function scrub:friendlyghosts/volunteer` if you are the player who will be blinded.
2. Run `/function scrub:friendlyghosts/start` to start all the mechanisms.

A user with operator permissions should run these commands, but if for some reason you don't want to or can't give operator permissions to the person who wishes to volunteer as the runner, use the command `/execute as <name_here> run function scrub:friendlyghosts/volunteer` and replace `<name_here>` with the person you want.

You can also stop the session prematurely by running `/function scrub:friendlyghosts/reset` to revert to the game's state before the minigame.

Run the command `scrub:friendlyghosts/help` ingame for the same explanation given above, including nifty hover and click events for the listed commands that autofill them into your chat bar!
(The teal commands and green `[?]` boxes are the bits that interact with the mouse)
