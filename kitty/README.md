### Category kitty

---

 - [Set The Title Of A Window](#set-the-title-of-a-window)
 - [Use The Built-In Emoji Picker](#use-the-built-in-emoji-picker)

---

# Set The Title Of A Window

Kitty, I believe by default, will set the title of the current window to a
previous run command.

For instance, I often start out my terminal session by running a `tmux` command
to create or join a tmux session. After this, the title of the window ends up
sticking as something like `tmux new -s my-project`.

Because I switch between various projects, I'd prefer the window title be
something more generic. The window title can be manually set. To do this, open
a 'New OS Window'—either from the menu or by hitting `Cmd-N`.

Then run a `set-window-title` command with `kitty`.

```bash
$ kitty @ set-window-title --match id:1 code
```

The `--match id:1` tells `kitty` what window to target with this command.
Because I only ever keep one window open, the `id` of that window is always
`1`. If you're not sure which window `id` to target, you can list the windows
and find the one you are looking for.

```bash
$ kitty ls
```

[source](https://sw.kovidgoyal.net/kitty/remote-control.html#kitty-set-window-title)

# Use The Built-In Emoji Picker

Kitty has a built-in emoji picker which you can use to search for and select an
emoji character to be placed in your current terminal context. This is handy
because Mac OSX's built-in emoji picker (Ctrl-Cmd-Space) doesn't work in Kitty.

To open up Kitty's emoji picker, hit `Ctrl-Shift-u` (or prefix `u` with
whatever your Kitty metakey is). You'll see a full screen menu with 4 different
tabs. If you move to the _Emoji (F2)_ tab (`Ctrl-]` and `Ctrl-[` to navigate),
you'll be able to search for an emoji based on its metadata name.

For instance, if I type `check`, I'll see a bunch of unicode characters that
match that term including `3  ✅ White heavy check mark`. By hitting tab until
I reach that result, I can hit `Enter` to send that emoji to the terminal
context.

[source](https://sw.kovidgoyal.net/kitty/kittens/unicode-input.html)

