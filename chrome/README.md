### Category chrome

---

 - [Access A Value Logged To The Console](#access-a-value-logged-to-the-console)
 - [Chrome Supports Many Unix Keyboard Shortcuts](#chrome-supports-many-unix-keyboard-shortcuts)
 - [Copy Some Data From The Console](#copy-some-data-from-the-console)
 - [Duplicate The Current Tab](#duplicate-the-current-tab)
 - [Easier Access To Network Throttling Controls](#easier-access-to-network-throttling-controls)
 - [Keybinding To Focus The Address Bar](#keybinding-to-focus-the-address-bar)
 - [Navigate The Browser History With Vimium](#navigate-the-browser-history-with-vimium)
 - [Pretty Print Tabular Data](#pretty-print-tabular-data)
 - [Reference The Selected Node](#reference-the-selected-node)
 - [Selecting DOM Elements Faster Than Ever](#selecting-dom-elements-faster-than-ever)
 - [Simulating Various Connection Speeds](#simulating-various-connection-speeds)
 - [Toggle Device Mode](#toggle-device-mode)
 - [Toggle Open The Console Drawer](#toggle-open-the-console-drawer)
 - [View Network Traffic For New Tabs](#view-network-traffic-for-new-tabs)

---

# Access A Value Logged To The Console

Did your app just log an object to the dev tools console and you'd like to
interact with that object? It's not straightforward, but you can do it.

Assuming you already have dev tools opened to the _console_ tab, right click
on the value that has been logged to the console. Select the _Store as
Global Variable_ option. This will re-log the value assigning it to the
`temp1` variable.

You can now reference that object as `temp1` accessing its values and
calling functions.

You can even do this with multiple logged values, each subsequent one will
be assigned incrementing variable names: `temp2`, `temp3`, etc.

[source](https://stackoverflow.com/questions/15895579/access-last-logged-value-in-chrome-console)

# Chrome Supports Many Unix Keyboard Shortcuts

In a Unix environment, you can use keyboard shortcuts to do a variety of things
more efficiently. For instance, hitting `ctrl-a` moves the cursor to the
beginning of the line. Conversely, `ctrl-e` moves the cursor to the end of the
line. Another fun one is `ctrl-u` which erases from the cursor to the beginning
of the line.

Learning these doesn't only have value when you are logged into some remote
server. There are many apps that support a variety of these shortcuts. Chrome
is one of them.

![examples of unix shortcuts in chrome text area](https://i.imgur.com/7MfNe6c.gif)

# Copy Some Data From The Console

Sometimes you have some data that you are playing around with in the
console, something you logged from an API response. You then want to share
it, so you try to copy the whole thing into your system copy buffer. There
are a couple hacky ways of doing this, but Chrome supports a really smooth
way.

Use the `copy` function.

```javascript
characters
> (8) [{…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}]
copy(characters[1])
```

My system copy buffer now contains the entire object that makes up the
second entry in that list. I can then paste it into Slack or wherever.

[source](https://twitter.com/addyosmani/status/1092686766375616517)

# Duplicate The Current Tab

Sometimes when viewing a page, you realize you want to keep that page open
but also go back to the previous page to view something else. An easy way of
achieving this is to duplicate the current tab and then go back.

To duplicate the current tab hit `Cmd+Enter` while the focus is on the URL
bar.

If the URL bar is not in focus, then first hit `Cmd+L` to focus followed by
`Cmd+Enter`.

# Easier Access To Network Throttling Controls

In [Simulating Various Network Connection
Speeds](https://github.com/jbranchaud/til/blob/master/chrome/simulating-various-connection-speeds.md),
I showed how to change between various simulated connection speeds from the
_Network_ tab in Chrome devtools. Unfortunately, the Connection Speed
dropdown is crowded out by a number of other controls in the _Network_ tab.
As a result, unless that tab is expanded pretty wide, you won't be able to
get at it. I've found myself sliding the devtools wider and narrower over
and over while testing things with throttling.

There is another, easier place to access throttling.

![](https://i.imgur.com/fHN8F28.gif)

The console drawer gives us access to a number of additional tabs of
controls. Add the _Network connections_ tab for easier access.

# Keybinding To Focus The Address Bar

The address bar (URL bar) in Chrome is versatile. You can enter both URLs and
search terms into it. If I want to enter a new search term, I generally have to
reach for my mouse, double click in the address bar, and then type in that
term.

Chrome has a keybinding that sends focus to the address bar, which cuts some of
those steps.

Hit `Cmd-L`.

You'll see that the address bar gets focus with the entire address highlighted.
You can begin typing your new search term immediately.

[source](https://etc.usf.edu/techease/4all/input-devices/google-chrome-keyboard-shortcuts/)

# Navigate The Browser History With Vimium

The [Vimium](https://vimium.github.io/) Chrome extension is great for moving
around the current page you are on. It can also be used to navigate back and
forth through your browser history.

You can go back to the previous page with `H` (`Shift-h`).

You can go forward to a page you went back from with `L` (`Shift-l`).

# Pretty Print Tabular Data

Looking at a bunch of data in the Chrome dev tools console isn't great. It
can be a bit difficult to read because of the way it is displayed.
Fortunately, the Chrome dev tools come with a handy way of displaying
tabular data, `console.table()`. If you give `console.table` an array of
objects or array of arrays, it will format it in a table like so:

![](http://i.imgur.com/LPgBpRB.png)

```js
console.table([{one: 1, two: 2, three: 3}])
```

# Reference The Selected Node

In the Chrome dev tools, if you've selected (highlighted) a node in the DOM,
you can reference that node from the console with `$0`. This is handy if you
are debugging or exploring certain parts of a page and need to run commands
against that node. For instance, if you were to select the `<html>` node in
the DOM, you could then programmatically check the `lang` attribute from the
console like so:

```
> $0.lang
// "en-US"
```

If there is `jQuery` on the page and you've selected the node that contains
all of the page's content, you can do something like the following:

```
> $($0).html('<h1>Hello, World!</h1>')
```

# Selecting DOM Elements Faster Than Ever

Selecting and inspecting DOM elements: you've done it many times before.
Whether you right click the element and select _Inspect_ (which isn't always
all that accurate) or you use the DevTools' inspect tool with
highlight-assist, it takes a couple clicks to get there.

There is a faster way.

Hit `Cmd-Shift-C`.

Chrome DevTools will be expanded open if it isn't already and your mouse
pointer will be put in inspect mode with the highlight-assist. Find your DOM
element, give it a click, and start inspecting!

# Simulating Various Connection Speeds

I spend everyday building web apps from a machine that has a wired
connection to the internet. Though I spend a lot of time loading various
pages and experiencing the app like a user might, I end up having a pretty
narrow perspective. What will this app be like for people on various
qualities of mobile connections?

Chrome has a feature built in to its devtools that makes it easy to throttle
your connection to simulate various speeds. Open up devtools with
`Cmd+Opt+J`, navigate to the _Network_ tab, and then open the throttling
drop down.

![](http://i.imgur.com/EI3H9Oe.png)

From here we can select the connection speed we want to simulate. If we then
reload the page, we will not only experience the page load at that speed, we
will also see the numbers in that _Network_ tab.

# Toggle Device Mode

Working on some styles? Want to make sure those minor tweaks look good on
both desktop and mobile? Your probably moving back and forth between the
desktop mode and one of the smaller device modes.

There is a keybinding for this -- `Cmd-Shift-M`

The chrome devtools panel will need to be open and in focus for this to
work.

# Toggle Open The Console Drawer

With Chrome devtools open and in focus, hit `<Esc>`. The console drawer will
be toggled open. Hit `<Esc>` again and it will be toggle closed.

# View Network Traffic For New Tabs

Generally when you open a new tab and pop open the Network panel in the chrome
devtools, you won't immediately see any traffic. This is because the initial
network requests to load the site happened before you accessed the Network
panel.

If you'd like to view the Network traffic immediately without having to refresh
the new tab, you'll have to make the devtools panel open automatically with new
tabs.

1. Click the _triple dot_ icon from the top of the devtools panel
2. Click 'Settings'
3. Find the 'DevTools' section
4. Check the box for 'Auto-open DevTools for popups'

Now, whenever you open a new tab, Chrome devtools will be open and the initial
network traffic will be recorded.

[source](https://stackoverflow.com/questions/16210468/chrome-dev-tools-how-to-trace-network-for-a-link-that-opens-a-new-tab)

