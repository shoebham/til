### Category vscode

---

 - [Add The VSCode CLI To Your Path](#add-the-vscode-cli-to-your-path)
 - [Advance Through Search Results](#advance-through-search-results)
 - [Enable Breadcrumbs For Version 1.26 Release](#enable-breadcrumbs-for-version-1.26-release)
 - [Open An Integrated Terminal Window](#open-an-integrated-terminal-window)
 - [Toggle Between Terminals](#toggle-between-terminals)

---

# Add The VSCode CLI To Your Path

Visual Studio Code has a command line tool that can do a bunch of things.
Perhaps the most common is opening up the current directory from the
command line.

First, you need to add `code` to your path. This can be done from within
Code itself.

Hit `Cmd+Shift+p` to pop open the command palette. Then start typing `Shell
Command ...` until the `Shell Command: Install "code" command in shell PATH`
option appears. Select this and Code will add `code` to your path.

Try `code .` to open the current directory or run `code --help` for more
details on what's available.

# Advance Through Search Results

Doing a project-wide search can turn up a bunch of results. If you'd like to
look over them one by one, there are keybindings to help you out.

Hit `F4` to move forward one by one through the search results.

To move backward through the results, hit `Shift+F4`.

# Enable Breadcrumbs For Version 1.26 Release

The latest release of Code ([Version
1.26](https://code.visualstudio.com/updates/v1_26)) brings about a lot of
exciting new features -- including file breadcrumbs at the top of each file
editor view.

![Breadcrumbs feature in action](https://i.imgur.com/wubUn6c.png)

By default this feature is not enabled. You can enable it from User Settings
(`Cmd+Shift+P`, 'User Settings'). From the User Settings view, you can
search for `breadcrumbs` and you'll see the following item:

```json
  "breadcrumbs.enabled": false,
```

Use the pencil to override it to `true` and you'll have that trail of
breadcrumbs waiting for you.

# Open An Integrated Terminal Window

Visual Studio's Code editor offers an integrated terminal that can be used
for any of your bash needs -- tests, various git commands, etc.

You can toggle the integrated terminal window open and closed with

```
Ctrl+`
```

The shell session will be opened to the working directory of your current
project.

# Toggle Between Terminals

VSCode allows you to have multiple terminal tabs, but you have to manually
switch between them with a drop down. For me, that is a lot of mouse action.
I'd prefer to have a keyboard shortcut that allows me to switch between
them. Fortunately, there are commands for going to the next and previous
terminal which can be attached to keybindings.

Try adding the following two entries to your `keybindings.json` file:

```json
[
  { "key": "cmd+shift+k", "command": "workbench.action.terminal.focusNext" },
  { "key": "cmd+shift+j", "command": "workbench.action.terminal.focusPrevious" },
]
```

Save the file and then start toggling between your different VSCode
terminals.

[source](https://github.com/Microsoft/vscode/issues/37937)

