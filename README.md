# Ladder

An app for tracking data for showdown ladder nights

## Getting started

This app should work on any platform, although if you are running on the web, you will need a secure connection in order for everything to work correctly.

- Latest release: [https://github.com/chrisnorman7/ladder/releases/latest]
- Web version: [https://backstreets.site/ladder/]

## Building

First, you will need to install [Flutter](https://flutter.dev/).

Next, clone the GitHub repository: `git clone https://github.com/chrisnorman7/ladder`.

If you're running on Windows, you can use the `test-run.bat` batch script.

## Using the app

### Notes

#### Modifier keys

Shortcuts are written Windows-style: `CTRL+N`. If you are on a Mac, you can use `CMD` in place of `CTRL`, and `OPTION` in place of `ALT`. From here on out, only the Windows version will be written. You can always substitute CTRL for CMD and ALT for OPTION. If this does not work as expected, please [create an issue](https://github.com/chrisnorman7/ladder/issues/new).

#### Conventions

- In any screen where something can be created, there will be a floating action button near the bottom right hand corner of the screen. You can either use that, or press `CTRL + N`.
- In any tabbed interface (tabs appear at the bottom of the screen), you can use CTRL (or CMD) with the numbers 1 to 0 to navigate through the pages 1 to 10. Alternatively, you can use `CTRL (or CMD) + TAB` to move through pages one by one. Adding shift moves you backwards.
- Next to many items in the list views which are used (perhaps too) heavily throughout the app, there is a popup menu button. These menus include the shortcut keys you can use to perform the menu actions without using the menu. Examples of this are when deleting things (the `delete` key), and renaming things (`CTRL+R`). The only exception to this is the delete key, which doesn't seem to work on Mac OS.

#### Font size

In almost all screens, you can press `CTRL+=` to increase the font size, and `CTRL+-` to decrease it. This should really work all over. If you find any exceptions, please [submit an issue](https://github.com/chrisnorman7/ladder/issues/new).

### Creating a team

After opening the app, you will be presented with the team screen. This is where you can create a screen. Either click the "New team" button in the bottom right hand corner of the screen, or press `CTRL+N` (`CMD+N` on Mac OS).

### Creating players

Once you have a team, you can start creating players. Go into the Players tab (`CTRL+2`) to do this. Again, you can press `CTRL+N`, or click the "New player" button.

Teams can be renamed (`CTRL+R`), or have their email address changed (`CTRL+E`). Currently, the email address does nothing, but eventually email notifications are planned.

### Creating points

Somewhat confusingly, the things which can be awarded in the app are also called points. A point has a name which is visible in the app, and a value of points. This value can be anything you like, with some rules:

- Any point with a value of 0 will not be included in the serve order. This allows you to create things like timeouts, medical timeouts, toilet breaks, or anything else you like.
- Any point with a value less than 0 is counted as a foul, and the points are multiplied by -1 and added to the opponent's score. This means that a foul of -1 will add 1 point to the opponent of the person who has been awarded the foul.
- Any point with a value of greater than 0 will be added to the player's own score. As such, a point called "Goal" and allocated 2 points is, will act like the standard point in showdown.

The program creates some sensible defaults. If you think any others should be added, please [submit an issue](https://github.com/chrisnorman7/ladder/issues/new).

It is worth noting that the point value can only be altered with `ALT` (or `OPTION`) and the arrow keys.

### Creating ladder nights

Finally, you can create ladder nights. Although the word "ladder" is used extensively throughout the app, there is no reason you couldn't use this app to run a small tournament, or even use multiple machines and run different tournaments in different rooms. Eventually, the whole thing should work over the internet, but for now, the software is best suited bo small events.

You can create a ladder night (or tournament evening or whatever you want to call it) in the expected way. These can be moved around with alt and the arrow keys. Up and down arrows move by day, and left and right move by hour.

*Please note*: If two ladder nights trade places, then the focus will switch and you might find yourself moving the wrong ladder night. Always check your focus. This is something which can be worked around, but would take some work. If you are particularly bothered by this, please [submit an issue](https://github.com/chrisnorman7/ladder/issues/new).

### Marking attendance

When you go into a ladder night, you can tell the system that players won't be attending. This is in the second page of the ladder's tabs. Simply click the name of any player to have them attend or be absent.

Absent players cannot make challenges, and challenging players won't get them as options in the second list which comes up when creating a game.

### Creating games

In the first tab of the adder night screen, your games show up. This list is blank by default. The first time you create a game, it will helpfully be put at the same time as your ladder night starts. Currently, you can only move games by half an hour at a time. This limit is set in the database which the app creates. Eventually, it will be configurable, but not yet.

In the menu at the top right, there is an option to randomly assign games (`CTRL+SHIFT+R`). You can also copy the schedule to your clipboard with `CTRL+SHIFT+C`.

It is worth noting that you cannot move a game to any time before your ladder night starts. If you can somehow do this without using raw SQL, please [let me know](https://github.com/chrisnorman7/ladder/issues/new).

#### Deleting games

Games can be deleted only if they have no sets.

#### Locking games

When a game is complete, it should be locked to prevent further edits, and to award the players involved the points they earned during the game.

Games *cannot* be unlocked once they have been locked.

### Creating sets

Games can contain as many sets as you like. When you go into a created game, you will notice a few things:

- Two tiles you can click on to set the coaches for each player.
- A tick box which indicates whether the challenger won the toss or not.
- The players names repeated. Click these last two to decide who serves first in the first set. Every set thereafter will flip the server.

If you use the "Create set" button in this screen, the set will be created with the challenger as the first server.

### Working with sets

When in the set editor, by default you will see two tiles: The first showing the initial server, their score in brackets, and the number 1. This is their current serve. The receiver will show their name, their points in brackets, and the word "Receiving".

These values will change when you award points.

To delete the most recently-awarded point, either focus that point and press `DELETE`, use the menu next to the point, or press `SHIFT+BACKSPACE`.

If you accidentally award a point to the wrong player, you can quickly change it in the menu for that point.

#### Blind bonus

Using the keyboard, with a screen reader enabled, you gain the following benefits:

- Press `CTRL+B` to announce a shortened version of the referee's script. The serve number, who the server is, and the points for the server and the receiver respectively.
- Use `CTRL+1-0` to announce out the points from 1 to 10.
- Use `CTRL+-` to announce the 11th point.
- Use `CTRL+=` to announce the 12th point.
- Use `CTRL+BACKSPACE` to read the 13th point.
- Use `CTRL+[` to announce the score of the initial server.
- Use `CTRL+]` to announce the score of the initial receiver.
- While holding either `[` or `]`, press a number from 1-0, or `-`, `=`, or `BACKSPACE` for 11-13. This will award the point which is spoken to the player which is spoken. If you wish to cancel this behaviour, press escape while the bracket is still held down.

For a reminder on the shortcuts which aren't displayed in the point menus, press `SHIFT+/`.

## Conclusion

This document should give you all you need to get started with your own ladder night. Although the data are all recorded, there currently isn't much in the way of report generation. If you have any ideas in this regard, please [let me know](https://github.com/chrisnorman7/ladder/issues/new).

Currently, the following reports are available:

- From the main team screen, the fourth tab shows the luckiest players. You can see all the players on the team, ordered by the number of times they have won the toss.
- From the players list, you can click on each player to see either a list of the games they have played, or the points they have been awarded, order by frequency.
