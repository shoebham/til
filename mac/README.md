### Category mac

---

 - [Access All Screen And Video Capture Options](#access-all-screen-and-video-capture-options)
 - [Access System Information OS X](#access-system-information-os-x)
 - [Access Unsupported Screen Resolutions With RDM](#access-unsupported-screen-resolutions-with-rdm)
 - [Clean Up Old Homebrew Files](#clean-up-old-homebrew-files)
 - [Convert An HEIC Image File To JPG](#convert-an-heic-image-file-to-jpg)
 - [Default Screenshot Location](#default-screenshot-location)
 - [Disable Swipe Navigation For A Specific App](#disable-swipe-navigation-for-a-specific-app)
 - [Display A Message With Alfred](#display-a-message-with-alfred)
 - [Find The Process Using A Specific Port](#find-the-process-using-a-specific-port)
 - [Gesture For Viewing All Windows Of Current App](#gesture-for-viewing-all-windows-of-current-app)
 - [Insert A Non-Breaking Space Character](#insert-a-non-breaking-space-character)
 - [List All The Say Voices](#list-all-the-say-voices)
 - [Open Finder.app To Specific Directory](#open-finder.app-to-specific-directory)
 - [Quickly Type En Dashes And Em Dashes](#quickly-type-en-dashes-and-em-dashes)
 - [Require Additional JS Libraries In Postman](#require-additional-js-libraries-in-postman)
 - [Resize App Windows With AppleScript](#resize-app-windows-with-applescript)
 - [Resizing Both Corners Of A Window](#resizing-both-corners-of-a-window)
 - [Run A Hardware Check](#run-a-hardware-check)
 - [Run AppleScript Commands Inline In The Terminal](#run-applescript-commands-inline-in-the-terminal)
 - [Set A Window To Its Default Zoom Level](#set-a-window-to-its-default-zoom-level)
 - [Specify App When Opening From Command Line](#specify-app-when-opening-from-command-line)
 - [Use Default Screenshot Shortcuts With CleanShot X](#use-default-screenshot-shortcuts-with-cleanshot-x)
 - [View All Windows Of The Current App](#view-all-windows-of-the-current-app)

---

# Access All Screen And Video Capture Options

There are a number of hotkeys to help you quickly capture a screenshot on the
Mac. If you aren't sure which is which or what options are available, you can
hit `Cmd+Shift+5`. This will open up a panel with the five main options. These
include Capture Entire Screen, Capture Selected Window, and Capture Selected
Portion for screenshots as well as Record Entire Screen and Record Selected
Portion for videos.

# Access System Information OS X

On machines running OS X, there is an Apple icon in the upper left corner as
part of the menu bar. Clicking on this icon reveals a number of options. The
first reads _About This Mac_.

If you hold down the `option` key, however, that first option will instead
read _System information..._

Select that option to access the System Information panel which can tell you
details about your hardware, software, and network.

h/t Dillon Hafer

# Access Unsupported Screen Resolutions With RDM

If you visit the _Display Settings_ for your Mac, you'll find that you only
have a handful of screen resolution options. For standard use, you'll get by
with these. If you need a specific, unsupported resolution you'll need help
from a 3rd party tool. There are many options out there.
[RDM](https://github.com/avibrazil/RDM) is a free and open-source option.

Once you have it installed and have given it _Accessibility_ permissions,
open the menu from your top toolbar and select the resolution you are
looking for.

I use RDM to adjust my screen resolution to 1280x720 for optimal
screencasting.

# Clean Up Old Homebrew Files

If you've been using [Homebrew](https://github.com/Homebrew/homebrew) for a
while, you may have built up some cruft in the form old and outdated files.
These will not be cleaned up automatically. You have do tell Homebrew to do
so. This can be done with the following command.

```bash
$ brew cleanup
```

This command will report what files it cleans up as well as how much disk
space it was able to clear.

See `man brew` for more details.

h/t Dorian Karter

# Convert An HEIC Image File To JPG

I took a photo with my iPhone and then airdropped it to my Mac. This opened it
up in Preview. From there I could see that the extension on the file was HEIC.
I'm not familiar with that filetype and what I want is a JPG.

The Preview app (which is already open in this scenario) can handle this
conversion.

Go to _File_ > _Export..._

Change the _format_ from `HEIC` to `JPEG`.

Feel free to update the name and save location at this point as well.

Then hit _Save_ and Preview will perform the conversion.

[source](https://osxdaily.com/2019/11/22/convert-heic-to-jpg-mac-preview/)

# Default Screenshot Location

By default, Mac saves all screenshots to the desktop. If you'd like
screenshots to be dumped somewhere else, you have to configure it manually
from the command line. For instance, if you'd like your screenshots to be
saved in the `~/screenshots` directory, then enter the following commands:

```bash
$ mkdir ~/screenshots
$ defaults write com.apple.screencapture location ~/screenshots
$ killall SystemUIServer
```

[source](http://osxdaily.com/2011/01/26/change-the-screenshot-save-file-location-in-mac-os-x/)

# Disable Swipe Navigation For A Specific App

Mac's touch pad has a bunch of handy swipe gestures, including swiping two
fingers to the left or the right to navigate backward or forward. This
particular gesture can be globally enabled and disabled. I find it useful
for most apps and a pain in a few apps, such as Google Chrome.

From the terminal we can disable it for a specific app (like Google Chrome):

```bash
$ defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
```

Restart the target application, in my case Chrome. The left and right swipe
navigation will no longer be triggered.

[source](https://apple.stackexchange.com/questions/21236/how-do-i-disable-chromes-two-finger-back-forward-navigation)

# Display A Message With Alfred

Want to display some text in a large format on your screen for someone else
to read? The [Alfred app](https://www.alfredapp.com/) can help.

Activate Alfred and type in some text. Then hit `Cmd+L`.

The shorter the snippet of the text, the larger it will appear.

# Find The Process Using A Specific Port

The `netstat` utility is often recommended for finding the PID (process ID)
bound to a specific port. Unfortunately, Mac's version of netstat does not
support the `-p` (process) flag. Instead, you'll want to use the `lsof`
utility.

```bash
$ sudo lsof -i tcp:4567
```

Running this will produce a nicely formatted response that tells you several
pieces of information about the process bound to `:4567` including the PID.

[source](https://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac)

# Gesture For Viewing All Windows Of Current App

When working on a web application, I often end up with a couple Chrome
windows open and sometimes even a couple terminal windows open. I generally
use the `Cmd+~` key binding to toggle through them. This can occasionally
get confusing though. To get the fuller picture, I can get a birds-eye view of all windows for
the current app using a track pad gesture.

Swiping down with three fingers on the track pad will provide a zoomed out
view of all windows. Click on the window you care about to view that or
swipe back up with three fingers to dismiss it.

[source](https://twitter.com/HipsterSmoothie/status/1084565618009862145)

# Insert A Non-Breaking Space Character

On Mac, you can insert a non-breaking space character by hitting
`option-space`.

I'm not sure when people use non-breaking spaces, but this is a handy
shortcut for those situations.

[source](https://twitter.com/jnadeau/status/725436138601615360)

# List All The Say Voices

The `say` command can be a fun party trick.

```bash
$ say Get ready for the bass to drop
```

Your friends will be even more impressed when you use some of the alternate
voices.

```bash
$ say -v Daniel "Would you like a cup of tea?"
```

To see all the alternate voices available, type the following

```bash
$ say -v '?'
```

[source](http://stackoverflow.com/questions/1489800/getting-list-of-mac-text-to-speech-voices-programmatically)

# Open Finder.app To Specific Directory

The Mac OSX built-in GUI for navigating directories and files is _Finder.app_.
I use it just about anytime I need to drag a file on my machine into Slack,
Discord, Google Drive, or wherever else has a file drop zone.

Sometimes certain directories can be hard to navigate to because they are
deeply nested or because Mac hides them by default. The `~/Library` directory
is a great example of the latter.

I can use the `open` command from the terminal to open a Finder window right in
that directory.

```bash
$ cd ~/Library
$ open .
```

I first navigated there and then I ran `open .` which means open the current
directory. For directories, `open` defaults to using Finder.app.

I could have also run `open` with the target directory name instead of
navigating there first.

```bash
$ open ~/Library
```

See `man open` for more details.

# Quickly Type En Dashes And Em Dashes

To type a hyphen, you hit the key right next to the zero: `-`. But what about
if you need the similar looking en dash and em dash?

Some programs have text areas that will automatically convert two consecutive
dashes into an em dash.

There is a more reliable method that can get you both: these two keybindings
which are a variation of the `-` key itself.

* `Option -` will produce an en dash (–), named that because it is typically
  the width of the n character.

* `Option Shift -` will produce an em dash (—), named that because it is
  typically the width of the m character.

The en dash seems to be the less familiar of the two. For more details on when
to use that, [check out this excerpt from Dreyer's
English](https://twitter.com/jbrancha/status/1344345683294380035).

h/t [Shawn Wang (@swyx)](https://twitter.com/swyx/status/1344127570753646593?s=20)

# Require Additional JS Libraries In Postman

When writing pre-request scripts and test scripts as part of a
[Postman](https://www.getpostman.com/) request, you aren't limited to
vanilla JavaScript. There are a handful of libraries that can be required
where needed.

This short list of available libraries includes `cherrio`, `lodash`, and
`moment`.

To pull one of these into a particular script, use the standard `require`
feature:

```javascript
var moment = require('moment');

var now = moment();
```

For a full list of what is available, check out [Postman's Sandbox API
Reference](https://www.getpostman.com/docs/postman/scripts/postman_sandbox_api_reference).

# Resize App Windows With AppleScript

I showed in a [previous
TIL](run-applescript-commands-inline-in-the-terminal.md) how we can run
AppleScript commands inline from the terminal. Here is an inline command
for positioning and resizing your iTerm2 window.

```bash
osascript -e 'tell application "iTerm2"
  set the bounds of the first window to {50, 50, 1280, 720}
end tell'
```

The first two values tell the command the `x` and `y` coordinates of where
to position the upper left corner of the window relative to the upper left
corner of your screen. The next two values are the `width` and `height` that
the window should be resized to.

[source](https://apple.stackexchange.com/questions/98064/set-size-of-window-to-exact-pixels-and-place-via-x-y-coordinates)

# Resizing Both Corners Of A Window

Hold the `option` key while resizing a corner of a window and it will
simultaneously and equivalently resize the opposite corner.

# Run A Hardware Check

If your Mac is behaving in an odd way, there may be an issue with some piece
of the hardware -- such as the RAM.

You can perform a hardware check in order to chase down a diagnosis.

- Shutdown your machine
- Boot your machine
- While it is booting, hold down the `d` key

At this point, the machine should have booted into a special hardware check
mode. Select your preferred language, the hardware check will be performed,
and any issues will be reported.

h/t Dillon Hafer

# Run AppleScript Commands Inline In The Terminal

[AppleScript](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html)
is often invoked as a series of commands from a file. It is also possible to
execute individual commands inline in the terminal. Use the `-e` flag to
specify the command.

For example, if you'd like to mute your Mac:

```bash
$ osascript -e 'set volume 0'
```

Run that and your Mac's volume will now be at zero.

[source](http://osxdaily.com/2016/08/19/run-applescript-command-line-macos-osascript/)

# Set A Window To Its Default Zoom Level

Often when showing my screen to someone else or connecting to a project, I
have to adjust the zoom level of my current window by hitting `Cmd +` a
bunch of times. Once I am done I usually do some guess work to get the
screen size back to what I am used to, hitting `Cmd -` a couple times.

There is an easier way.

Hitting `Cmd 0` will return the window back to its default zoom level.

h/t Jake Worth

# Specify App When Opening From Command Line

When you `open` files from the command line

```bash
$ open README.md
```

the default app for that filetype will be used. For me, `README.md` will be
opened in VS Code.

If you have a different app in mind, you can specify it using the `-a` flag:

```bash
$ open README.md -a Notes
```

This will open `README.md` in Mac's Notes app.

See `man open` for more details.

# Use Default Screenshot Shortcuts With CleanShot X

_[Watch the screencast](https://www.youtube.com/watch?v=yoMWfe1F9h4) that
accompanies this TIL to see how to do this visually._

On macOS there are a set of keyboard shortcuts for taking screenshots. The one
that I use most often is `Cmd-Shift-4`. It turns the cursor into cross hairs so
that I can make a drag selection of part of the screen to be captured as a
screenshot.

I've recently transitioned to using CleanShot X for taking screenshots. It
offers some improvements over the built-in screenshot tool, like annotations
and sticking recently screenshots in the corner of the window. As part of this
transition, I wanted `Cmd-Shift-4` to activate CleanShot X's _Capture Area_
feature instead of the built-in one.

To do this, first open up _System Preferences > Keyboard > Shortcuts_. Then go
to the _Screenshots_ section and de-select any shortcuts that you want to
remap. For `Cmd-Shift-4`, that is "Save picture of selected area as a file".

Then I open _Preferences > Shortcuts_ for CleanShot X and map _Capture Area_ to
`Cmd-Shift-4`.

Hitting `Cmd-Shift-4` will now activate CleanShot X's Capture Area instead of
the one for the built-in screenshot app.

# View All Windows Of The Current App

In [Gesture For Viewing All Windows Of Current
App](gesture-for-viewing-all-windows-of-current-app.md), I showed off a
track pad gesture that allows you to view all window instances of the app
you are currently focused on.

There is an analog keyboard shortcut that allows you to do the same thing --
without dragging your hands away from the keys.

Tap `Ctrl+↓` to do the same.

