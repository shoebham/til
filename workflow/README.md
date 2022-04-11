### Category workflow

---

 - [Change Window Name In iTerm](#change-window-name-in-iterm)
 - [Convert An ePub Document To PDF On Mac](#convert-an-epub-document-to-pdf-on-mac)
 - [Create A Public URL For A Local Server](#create-a-public-url-for-a-local-server)
 - [Enable Dev Tools For Safari](#enable-dev-tools-for-safari)
 - [Forward Stripe Events To Local Server](#forward-stripe-events-to-local-server)
 - [Get Your Public IP Address](#get-your-public-ip-address)
 - [Import A Github Project Into CodeSandbox](#import-a-github-project-into-codesandbox)
 - [Interactively Kill A Process With fkill](#interactively-kill-a-process-with-fkill)
 - [Open Slack's Keyboard Shortcuts Reference Panel](#open-slack's-keyboard-shortcuts-reference-panel)
 - [Prune The Excess From node_modules](#prune-the-excess-from-node_modules)
 - [Rotate An Image To Be Oriented Upright](#rotate-an-image-to-be-oriented-upright)
 - [Set Recurring Reminders In Slack](#set-recurring-reminders-in-slack)
 - [Toggle Between Stories In Storybook](#toggle-between-stories-in-storybook)
 - [Update asdf Plugins With Latest Package Versions](#update-asdf-plugins-with-latest-package-versions)
 - [View The PR For The Current GitHub Branch](#view-the-pr-for-the-current-github-branch)

---

# Change Window Name In iTerm

By default, the name that appears in the top bar of the
[iTerm2](https://www.iterm2.com/) window is the session name plus the job that
is running. This can be changed to some static value of your choosing.

To change this, hit `Cmd+i` and change the field labeled "Window Title".

[source](https://superuser.com/questions/419775/with-bash-iterm2-how-to-name-tabs)

# Convert An ePub Document To PDF On Mac

If you have an ePub document and you'd like it in PDF format, you can
convert it using the `ebook-convert` binary from `Calibre`.

First, install `Calibre`:

```bash
$ brew cask install calibre
```

Then convert your ePub using `ebook-convert`:

```bash
$ ebook-convert book.epub book.pdf
```

You'll see a bunch of output as it processes the document. When it
completes, you'll have a nice pdf waiting for you.

[source](https://gist.github.com/AaronO/9962667)

# Create A Public URL For A Local Server

At times while developing an app locally, you need to expose the local server
to the public internet. This can be useful and necessary when working on a
3rd-party integration or when you want to show what you have running locally to
someone else.

In addition to tools like [ngrok](https://ngrok.com/), I've found the
[`localtunnel`](https://github.com/localtunnel/localtunnel) npm package to be
an effective way to quickly expose a localhost port.

```
$ npx localtunnel --port 3000 --subdomain some-custom-subdomain
your url is: https://some-custom-subdomain.loca.lt
```

This will create a `loca.lt` URL with the given subdomain that tunnels
requests to `localhost:3000`. If the `--subdomain` flag is not specified or
what you've specified isn't available, `localtunnel` will generate a random
subdomain.

For the subdomain, I recommend using something sufficiently unique like
`josh-branchaud-04092021`. Using the date has the added benefit of
contextualizing when I generated the URL.

In my experience, these are not long-lived domains. Sometimes the connection
gets interrupted and you'll have to restart it. Often when restarting, the
specified subdomain will then be flagged as unavailable, so you have to tweak
it a little.

Because it is using `npx`, there is nothing to install as long as you already
have `node` itself installed.

# Enable Dev Tools For Safari

By default Safari's developer tools are hidden. To enable them, you need to go
into the _Advanced_ section of _Preferences_ and check the box at the bottom of
the screen that reads "Show Develop menu in menu bar."

![Advanced Safari Preferences Pane](https://i.imgur.com/TFhUXoA.png)

This will give you access to all sorts of menu items like "Show web inspector"
and "Disable JavaScript".

[source](https://support.apple.com/guide/safari/use-the-developer-tools-in-the-develop-menu-sfri20948/mac)

# Forward Stripe Events To Local Server

Stripe offers a robust test mode for developing and testing your app with a
payments sandbox.

The [Stripe CLI](https://stripe.com/docs/stripe-cli/webhooks#forward-events)
has a `listen` command that can be used to foward any and all Stripe events
from the test account to a locally running server.

Assuming you've installed the `stripe` CLI, you can run a command like the
following to forward all events to your local server.

```bash
$ stripe listen --forward-to localhost:5000/hooks
```

While this is running you'll see incoming events and your servers outgoing
responses.

If you'd like to filter down to receive specific events, you can use the
[`--events`
flag](https://stripe.com/docs/stripe-cli/webhooks#supported-events).

# Get Your Public IP Address

If you're trying to figure out what your current public IP address is, there is
a server you can ask. It is a server running at `https://ifconfig.me`.

You can visit that URL in your browser to find your IP address and some other
User Agent/Request details. The site also mentions several `cURL` commands you
can run to get these details in your terminal.

```bash
$ curl ifconfig.me
```

That will respond with just your public IP address. It is equivalent to curling
`ifconfig.me/ip`.

There are other options as well, such as curling for a JSON response of all the
data attributes.

```bash
$ curl ifconfig.me/all.json
```

See [ifconfig.me](https://ifconfig.me) for more details.

[source](https://www.mfitzp.com/article/use-ifconfigme-to-return-your-ip-and-host/)

# Import A Github Project Into CodeSandbox

A really fancy feature that [CodeSandbox](https://codesandbox.io/) offers is
the ability to import a Github project. If you go to the [Create
Sandbox](https://codesandbox.io/s/) page, you'll see some options including
_Import from Github_. From there, paste in the URL to a public github
repository and a matter of seconds your entire project will be synced into
a new CodeSandbox project.

I recently did this with a [create-react-app
project](https://codesandbox.io/s/github/jbranchaud/redux-little-router-example)
and CodeSandbox even knew how to recognize that it was a CRA app so that it
could run and display it in the web view.

# Interactively Kill A Process With fkill

The cross-platform [`fkill`](https://github.com/sindresorhus/fkill-cli) tool
is a modern, friendly CLI for fabulously killing processes. It provides an
interactive interface for searching for the name or pid of a process that
needs killing.

Install it with yarn (or npm):

```bash
$ yarn global add fkill-cli
```

Then run it with no arguments to trigger the interactive mode.

![use fkill interactively](https://raw.githubusercontent.com/sindresorhus/fkill-cli/master/screenshot.gif)

gif credit: [`fkill-cli` repo](https://github.com/sindresorhus/fkill-cli)

# Open Slack's Keyboard Shortcuts Reference Panel

Slack has a ton of keyboard shortcuts, but you might only be familiar with
some of the more obvious ones. When I started using Slack, I quickly
discovered that `Cmd+}` and `Cmd+{` allow you to navigate forward and
backward through your different Slack workspaces.

But there is a whole world of Slack keyboard shortcuts that I didn't know
about. By hitting `Cmd+/` a Keyboard Shortcuts reference panel will be
toggled open. This lists all of the keyboard shortcuts you didn't know you
needed.

# Prune The Excess From node_modules

The `node_modules` directory, which is part of every JavaScript project, is
infamously heavy. It is a massive directory of all your project's dependencies
and those dependencies' dependencies.

The size of `node_modules` can become a problem on CI build servers with
limited disk space. You can significantly reduce the size of `node_modules` by
pruning away all the excess files that aren't needed during builds like
markdown files, typescript source files, etc.

Include the [`node-prune`](https://github.com/tj/node-prune) binary as part of
your build pipeline to handle this.

```bash
$ node-prune /path/to/node_modules
```

In one instance, I saw a reduction from 400MB to 11MB in the `node_modules`
directory size.

# Rotate An Image To Be Oriented Upright

Many programs that display JPEG images will read the EXIF data for
'Orientation' headers so that they can correctly display the image. Not all of
them though. For instance, when a browser renders an `<img>` tag for such a
JPEG image, it won't account for the 'Orientation' header and you might end up
with a sideways image.

You can normalize the orientation with the
[`jhead`](https://www.sentex.ca/~mwandel/jhead/usage.html) utility which uses
[`jpegtran`](https://linux.die.net/man/1/jpegtran) under the hood. This is done
with the `-autorot` flag.

```bash
$ jhead -autorot my_image.jpeg
```

> Using the 'Orientation' tag of the Exif header, rotate the image so that it
> is upright. The program 'jpegtran' is used to perform the rotation. After
> rotation, the orientation tag of the Exif header is set to '1' (normal
> orientation). The Exif thumbnail is also rotated.

> This feature is especially useful with newer digital cameras [and
> smartphones], which set the orientation field in the Exif header
> automatically using a built in orientation sensor in the camera.

The image will now be upright in all programs.

# Set Recurring Reminders In Slack

I usually just talk to my coworkers in Slack. There are also ways of talking
to slackbot. For instance, you can ask slackbot to remind you of things.
Here is the structure of that kind of request:

```
/remind [who] [what] [when]
```

I can use this to set a recurring reminder for myself.

```
/remind @jbranchaud Drink a beer at 5pm on Fridays
```

Slackbot assures me that my reminder has been noted.

![slackbot reminder](https://i.imgur.com/qVAWohn.png)

[source](https://get.slack.help/hc/en-us/articles/208423427-Set-a-reminder)

# Toggle Between Stories In Storybook

[Storybook](https://storybook.js.org/) is a great tool for UI development,
especially in the React world. Storybook has a sidebar built in for
navigating between all your stories, with a mouse. You can also navigate
between them with just your keyboard.

Use `Cmd-Shift-←` and `Cmd-Shift-→` to move backward and forward through
your stories.

This even works when the navigation sidebar is hidden.

# Update asdf Plugins With Latest Package Versions

If you've been using [`asdf`](https://github.com/asdf-vm/asdf) for a while,
then the various plugins you are using may be a bit out of date. That means
that they won't have information about the latest versions of their respective
technologies.

You can update all of them at once with the `--all` flag:

```bash
$ asdf plugin update --all
```

This will grab all the latest package version information for each `asdf`
plugin you have installed.

See `asdf help` for more details.

# View The PR For The Current GitHub Branch

As you're working on a feature branch, you may push up an early PR to get your
work-in-progress out in public. You can then continue to work locally and push
up changes.

If at any point in this process you want to view the PR, you can open a browser
tab, visit GitHub, and navigate a few pages to the specific PR. There is a
faster using GitHub's CLI -- [`gh`](https://cli.github.com/).

You can view the main details of the PR for the current branch right in your
terminal with:

```bash
$ gh pr view
```

You can also open up the PR for the current branch in your browser by adding in
the `--web` flag.

```bash
$ gh pr view --web
```

See `gh pr --help` for more details.

