### Category tmux

---

 - [Access Past Copy Buffer History](#access-past-copy-buffer-history)
 - [Adjusting Window Pane Size](#adjusting-window-pane-size)
 - [Break Current Pane Out To Separate Window](#break-current-pane-out-to-separate-window)
 - [Change Base Directory Of Existing Session](#change-base-directory-of-existing-session)
 - [Change The Default Prefix Key](#change-the-default-prefix-key)
 - [Create A Named tmux Session](#create-a-named-tmux-session)
 - [Create A New Session In A New Server](#create-a-new-session-in-a-new-server)
 - [Cycle Through Layouts](#cycle-through-layouts)
 - [Enabling Vi Mode](#enabling-vi-mode)
 - [Get Mouse Copy/Paste Working In Kitty](#get-mouse-copy/paste-working-in-kitty)
 - [Hiding The Status Bar](#hiding-the-status-bar)
 - [Jumping Between Sessions](#jumping-between-sessions)
 - [Kill All Your tmux Sessions](#kill-all-your-tmux-sessions)
 - [Kill Other Connections To A Session](#kill-other-connections-to-a-session)
 - [Kill The Current Session](#kill-the-current-session)
 - [List All Key Bindings](#list-all-key-bindings)
 - [List Sessions](#list-sessions)
 - [Open New Window With A Specific Directory](#open-new-window-with-a-specific-directory)
 - [Organizing Windows](#organizing-windows)
 - [Paging Up And Down](#paging-up-and-down)
 - [Pane Killer](#pane-killer)
 - [Reclaiming The Entire Window](#reclaiming-the-entire-window)
 - [Remove The Delay On The Escape Key](#remove-the-delay-on-the-escape-key)
 - [Rename The Current Session](#rename-the-current-session)
 - [Reset An Option Back To Its Default Value](#reset-an-option-back-to-its-default-value)
 - [Set Environment Variables When Creating Session](#set-environment-variables-when-creating-session)
 - [Set Session-Specific Environment Variables](#set-session-specific-environment-variables)
 - [Show The Current Value For An Option](#show-the-current-value-for-an-option)
 - [Swap Split Panes](#swap-split-panes)
 - [Switch To A Specific Session And Window](#switch-to-a-specific-session-and-window)
 - [tmux in your tmux](#tmux-in-your-tmux)
 - [Toggle Between Two Common Sessions](#toggle-between-two-common-sessions)

---

# Access Past Copy Buffer History

Each time you perform a copy (as in copy/paste) within tmux using its built-in
copy functionality (i.e. `set-buffer` and `save-buffer`), the text that you
copied to the buffer is recorded in the server's history.

_Note: you may have `Cmd-c` or the mouse configured to copy to a tmux buffer._

So, while `tmux paste-buffer` (or `Cmd-v` if you have that configured) will
only paste in the most recently copied value to a tmux buffer, you can still
access more of the history.

Run `tmux choose-buffer` (or `<prefix>:choose-buffer`) to open an interactive
prompt that lists the tmux buffer history in reverse chronological order (most
recent to oldest).

You can navigate up and down through these buffers until you find the one that
contains what you're looking for. Then hit `Enter` and the value will be pasted
to the current window and pane.

See `man tmux` and search for `choose-buffer` for more details.

# Adjusting Window Pane Size

In tmux, the size of window panes can be adjusted incrementally with the
`resize-pane` command. For instance, to resize a pane in any direction
(left, down, up, and right), use one of the following commands

```
resize-pane -L 10
resize-pane -D 10
resize-pane -U 10
resize-pane -R 10
```

This will adjust the pane by *10* units in the corresponding direction. Of
course, other values can be used for more significant size adjustments.

# Break Current Pane Out To Separate Window

You have a split pane open in your current window. Perhaps it is running a
local server or has a connection to a database. The pane is taking up too
much space in the current window, but it is important so you don't want to
just kill it. If that is the case, break it out into a separate window.

With that pane in focus, enter into command mode (`<prefix>:`) and then issue
the `break-pane` command.

Alternatively, you can trigger this with a keybinding: `<prefix>!`.

See `man tmux` for more details.

# Change Base Directory Of Existing Session

Each tmux session has a base directory. This is determined when you first
create the session. When you open a new window or pane, this will be used as
the base directory of your new shell session.

You can change the base directory of an existing tmux session.

First, detach from the session: `<prefix>d`

Then, re-attach using the `-c` flag:

```bash
$ tmux attach -t your-session-name -c /new/base/dir
```

[source](https://stackoverflow.com/a/36435535/535590)

# Change The Default Prefix Key

The _prefix_ key for tmux is a key that tells an active tmux session that the
following key should be interpreted as a tmux command instead of regular input
to the terminal.

By default, tmux has `Ctrl-b` bound to the prefix.

So, hitting `Ctrl-b` followed by `?` will open up the tmux help.

Typing `Ctrl-b` involves a bit of a finger stretch. It can be changed to
something more comfortable. My personal preference is `Ctrl-z`. Many
configurations I've seen use `Ctrl-a`.

To change this, open up your `~/.tmux.conf` file and add two lines.

```
unbind C-b
set -g prefix C-z
```

And then run `:source-file ~/.tmux.conf`.

This tells tmux to unbind `Ctrl-b` so that it no longer is interpreted as the
prefix, and then it binds `Ctrl-z` as the new prefix key.

# Create A Named tmux Session

When creating a new tmux session

```bash
$ tmux new
```

a default name of `0` will be given to the session.

If you'd like to give your session a name with a bit more meaning, use the
`-s` flag

```bash
$ tmux new -s burrito
```

[source](https://robots.thoughtbot.com/a-tmux-crash-course)

# Create A New Session In A New Server

Any tmux command will, by default, be invoked against the `default`
server. You can instruct tmux to perform commands against a different server
with the `-L` flag and the name of the server.

If you name a server that doesn't already exist, tmux will create and start
that server for you. So, if you want to start a new session in a new server,
just run a command like the following:

```bash
$ tmux -L pokemon_server new-session -s pokedex
```

If you are to detach from this session, you will need to specify the name of
the server in order to attach again:

```bash
$ tmux -L pokemon_server attach -t pokedex
```

See `man tmux` for more details.

# Cycle Through Layouts

Arranging a series of split windows in tmux can take some time. Once those
splits windows are arranged, it is difficult to set them up in a new way.
There is a way of cycling through layouts that might be able to help though.
Hit `<prefix><space>` over and over to cycle through the layouts until you
find the arrangement that you want.

[source](http://superuser.com/questions/493048/how-to-convert-2-horizontal-panes-to-vertical-panes-in-tmux)

# Enabling Vi Mode

If you'd like some vim-like bindings in tmux, you can turn on vi mode. To do
so, add the following line to your `.tmux.conf` file:

```
setw -g mode-keys vi
```

With this added and tmux re-sourced, you'll now have a variety of vi-like
bindings. For instance, when in tmux's copy mode, you can now use `v` to
begin making a visual selection and `y` to yank that selection into tmux's
copy buffer.

# Get Mouse Copy/Paste Working In Kitty

With tmux's mouse mode enabled (`set-option -g -q mouse on`), you can use the
mouse to make a drag selection of some text. You can then paste it within a
tmux session using `Cmd+v`.

If you are using tmux within the [Kitty terminal
emulator](https://sw.kovidgoyal.net/kitty/), you'll get more text pasted than
you bargained for. Kitty's clipboard _appends_ by default. So after several
selections have made there way into tmux's buffer history, a paste will result
in all of those buffers values being appended together and output to the
terminal.

To fix this, you need to change Kitty's clipboard to be `no-append`.

```
# ~/.config/kitty/kitty.conf
clipboard_control write-clipboard write-primary no-append
```

[source](https://github.com/kovidgoyal/kitty/issues/782#issuecomment-502927322)

# Hiding The Status Bar

The tmux status bar is a great place to show information about your tmux
session as well as things like the time and date. Sometimes you just want to
hide it though. This command will help.

```
:set -g status off
```

Hit enter and it is gone. If you want to show the status bar again, simply
turn it back on.

```
:set -g status on
```

[source](https://superuser.com/questions/265320/disable-the-status-bar-in-tmux)

# Jumping Between Sessions

If you are using tmux to manage multiple projects by putting each project in
a separate session, you may find yourself moving between sessions
frequently. Detaching and reattaching can and will get tedious. There are
better ways. tmux provides the `<prefix>)` and `<prefix>(` bindings as a way
of jumping to the next and previous session, respectively. That should
reduce some friction.

# Kill All Your tmux Sessions

If you have several tmux sessions running and you'd like to clean house, you
can kill all of those sessions with one command.

```bash
$ tmux kill-session -a
```

The `-a` flag says to target all sessions.

You can also run this as a tmux command.

# Kill Other Connections To A Session

One of the best features of tmux is the ability for multiple people to
connect to the same session in order to pair. This can, however, sometimes
result in a extra session hanging around if someone forgets to detach. This
is no problem though because you can view and kill other connections.

Hit

```
<prefix>D
```

to open up an interactive list of all connections to the current session.
Then navigate over the one you want to kill and hit `enter`. If you are
viewing the connections but don't want to kill one, you can hit `q` to back
out.

h/t Josh Davey

# Kill The Current Session

When you are done with the current tmux session and you no longer need it,
you can simply kill it. You can do so within the session with the following
command:

```
:kill-session
```

Hit `<prefix>:` in order to enter the command.

See `man tmux` for more details.

# List All Key Bindings

There are a couple ways to list all the tmux key bindings. If you are not
currently in a tmux session, you can still access the list from the terminal
with

```bash
$ tmux list-keys
```

If you are currently in a tmux session, then you can take advantage of the
tmux environment by either using

```
<prefix>:list-keys
```

or

```
<prefix>?
```

Any of these will bring up a list of all key bindings available to you
within a tmux session on your machine.

# List Sessions

Not sure if `tmux` is running or, if it is, which sessions are available?
You can list all the currently running sessions right from the command-line.

```bash
$ tmux ls
```

This command is shorthand for:

```bash
$ tmux list-sessions
```

# Open New Window With A Specific Directory

When you initially start a tmux session, the default directory is based off
of whatever the current working directory was. Any subsequent windows opened
within that tmux session will be opened with that as the base directory.

To open a window with a different default directory, use the `-c` flag with
the `new-window` command. For example, hit `<prefix>:` and then

```
:new-window -c ~/
```

to open a new window with your home directory.

[source](http://unix.stackexchange.com/questions/12032/create-new-window-with-current-directory-in-tmux)

# Organizing Windows

If you use a number of tmux windows as part of your daily workflow, you may find that they get to be a bit of a mess from time to time. There are gaps in the numbering and they aren't laid out in the order you'd prefer. The `movew` command makes it easy to rearrange these windows.

If you have a window indexed at 2 and you want it to be the 4th window, then you can:

```
:movew -s 2 -t 4
```

If you have a gap such that the 4th and 5th windows are numbered 4 and 7, then you can focus the 7 window and simply invoke:

```
:movew
```

And that window will be reinserted at the next available slot, in this case, window 5.

# Paging Up And Down

When in _copy mode_ (`<prefix>[`), you can move the cursor around like you
would in vim with the directional keys (`hjkl`). This works fine until you
want to move up or down through pages and pages of text, such as when
navigating to the top of a long stack trace. One way to get where you need
to be more quickly is by paging up and down.

Hit `CTRL-u` to page up and `CTRL-d` to page down.

# Pane Killer

The current pane can be _killed_ (closed) using the following key binding:

```
<prefix>x
```

You will be prompted to confirm with either `y` or `n`.

If there is only one pane in the current window, then the window will be
_killed_ along with the pane.

# Reclaiming The Entire Window

If you have attached to a tmux session whose dimensions are being
constrained by another connection, you may find an L-shaped portion of your
window filled with dots. tmux defers to the session with smaller dimensions.
The easiest way to reclaim the entire window for your session is to attach
to the session while forcing all other sessions to detach. The `-d` flag will
help with that.

```bash
$ tmux attach-session -d -t my-session
```

By detaching all other sessions, you are ensuring that your machine's
dimensions are the ones that tmux uses when drawing the window. This is a
great quick fix if you're working on your own, but probably not what you
want to do if you are in a pair programming situation.

[source](http://stackoverflow.com/questions/7814612/is-there-any-way-to-redraw-tmux-window-when-switching-smaller-monitor-to-bigger)

# Remove The Delay On The Escape Key

By default, tmux imposes a 500ms delay on presses of the escape key. This is in
case the escape key is used as part of a tmux key binding.

I don't use the escape key for any of my tmux key bindings, but I do use the
escape key quite in other contexts, like Vim.

The 500ms delay on the escape key being registered in contexts like Vim is
annoying at best. This delay can be removed by overriding the `escape-time`
option.

```
set -sg escape-time 0
```

Adding this line to your `~/.tmux.conf` file will set the delay to 0ms. The
`-s` and `-g` flags set the option for the _server_ and the _global server_
contexts respectively.

# Rename The Current Session

If you've created an unnamed tmux session or you no longer like the original
name, you can open a prompt to change it by hitting

```
<prefix>$
```

Replace the existing name with the desired name and hit enter.

h/t Dorian Karter

# Reset An Option Back To Its Default Value

Once you start changing the values of options, tmux can be opaque about what
the original default values were.

For instance, if you change the `escape-time` option with the following
command:

```bash
$ tmux set-option -g escape-time 0
```

It's now set to `0`, so without digging through the tmux man pages, how do you
figure out what the default was and restore it?

The `set-option` command takes the `-u` flag to _unset_ the option. This will
restore it to the default.

```bash
$ tmux set-option -u escape-time
```

And you can now see the original default value with `show-option`.

```bash
$ tmux show-option escape-time
500
```

Use `set-option -u` with any option to restore it to its default.

Find `set-option` in `man tmux` for more details.

# Set Environment Variables When Creating Session

In [Set Session-Specific Environment
Variables](set-session-specific-environment-variables.md), I showed how env
vars that are scoped to a tmux session can be set in an existing session.

It is also possible to set any number of environment variables when creating a
session. This is particularly handy if you are scripting the setup of various
tmux environments.

A base command to start a tmux session might look like this:

```bash
$ tmux new -s my-project
```

To set environment variables on that session, use one or more `-e` flags
followed by the name and value.

```bash
$ tmux new -s my-project -e EDITOR=code -e PG_VERSION=13.4
```

See `man tmux` for more details.

# Set Session-Specific Environment Variables

`tmux` allows you to manage separate environments for separate projects. For me
this usually boils down to arrangements of windows and tabs with different
servers running.

`tmux` can also provide session-specific environment variables. For anything
that you use environment variables for.

As an example, let's say I have one project that I always edit with VS Code.
And another that uses `vim`.

My default editor, as configured in my `~/.zshrc` file is `nvim`.

```bash
❯ echo $EDITOR
nvim
```

If I jump into the first project (`one`), I can set the `EDITOR` to `code` like
so.

```bash
❯ tmux setenv EDITOR code
```

It won't apply to the current pane, but if I open a new one.

```
❯ echo $EDITOR
code
```

I can then jump to the other project (`two`) to set that one to `vim`. This
time using the tmux command prompt.


```bash
<tmux-prefix>:
:setenv EDITOR vim
```

Again, if I open a new pane, the editor will be set.

```
❯ echo $EDITOR
vim
```

All the while, the value of `EDITOR` is preserved as `nvim` for everything
outside the context of those two tmux sessions.

# Show The Current Value For An Option

In the `~/.tmux.conf` file, you are able to define and override the values of
various options. Outside of explicitly setting an option, you may want to know
what its value is.

Perhaps it is unset, perhaps you don't remember, or maybe this particular
session or pane is different than the global config.

Either from the CLI, you can run the `tmux` command to check:

`$ tmux show-option -g history-limit`

Or as a command to tmux, using your prefix:

`:show-option -g history-limit`

The `-g` flag will tell you the option's value as set globally for tmux. `-w`
for window, `-p` for pane, or no flag for the current session.

See `man tmux` for more details.

# Swap Split Panes

Use `<prefix>}` (or `<prefix>{`) to swap two vertically or horizontally
split tmux panes.

# Switch To A Specific Session And Window

Hitting `ctrl-<prefix> w`, similar to `ctrl-<prefix> s`, will open up a pane
for switching sessions. However, this one will display each window as an option
below each session.

When just switching sessions, you are taken to the last active window. With
`ctrl-<prefix> w`, you can choose not just the session you want to switch to,
but a specific window within that session.

# tmux in your tmux

If you are running tmux locally and you shell into another machine to
access tmux remotely, you will suddenly find yourself in tmux inception.
You will have a tmux instance running within your local tmux instance. If
you have the same prefix key set for both, then you may be wondering how
you can send a tmux command to the *inner* tmux instance.

If you press your prefix twice (e.g. `<C-a> <C-a>`), then the second prefix
will be sent to the inner tmux instance which will then be listening for
the rest of your command. So, to open a new window within the inner tmux
instance, you can hit `<C-a> <C-a> c`.

# Toggle Between Two Common Sessions

With certain projects, such as projects that involve separate frontend and
backend codebases, I use a separate tmux session for each. This means that for
certain tasks and features I find myself flipping back and forth between them
constantly.

This can get tedious with an approach like `<prefix> s` where you then have to
find and select the other session from the list.

A more efficient alternative is `<prefix> L` -- this takes you to the last
session. So, if you are in the `backend` session and had previously been in the
`frontend` session, then hitting `<prefix> L` will immediately place you in
`frontend`. Hitting that exact same binding a second time will take you right
back to `backend`.

See `man tmux` for more details.

