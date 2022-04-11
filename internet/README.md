### Category internet

---

 - [Add Emoji To GitHub Repository Description](#add-emoji-to-github-repository-description)
 - [Enable Keyboard Shortcuts In Gmail](#enable-keyboard-shortcuts-in-gmail)
 - [Exclude Whitespace Changes From GitHub Diffs](#exclude-whitespace-changes-from-github-diffs)
 - [Figure Out Your Public IP Address](#figure-out-your-public-ip-address)
 - [Focus The URL Bar](#focus-the-url-bar)
 - [Get Random Images From Unsplash](#get-random-images-from-unsplash)
 - [Search Tweets By Author](#search-tweets-by-author)
 - [Show All Pivotal Stories With Blockers](#show-all-pivotal-stories-with-blockers)

---

# Add Emoji To GitHub Repository Description

GitHub restricts the set of unicode characters that can appear in the
description field of a repository to anything up to `0xffff`. Most emoji
have unicode values above this. This means you will have limited success
adding emoji via your system's emoji keyboard.

Fortunately, GitHub allows you to add any recognized emoji to a repository
description with its specialized emoji syntax (e.g. `:memo:`). You may have
used this syntax in other parts of GitHub such as the issue tracker.

If you add an emoji like this:

![](http://i.imgur.com/Tty7Cl2.png)

it will show up like so:

![](http://i.imgur.com/yxRwmkW.png)

Check out this [Emoji Cheat Sheet](http://www.emoji-cheat-sheet.com/) for
the names of all recognized emojis.

# Enable Keyboard Shortcuts In Gmail

In these modern times of asynchronous communication and paperless receipts,
a person's email inbox can get mighty full. Keeping that influx of emails at
bay is a challenge. If you'd like to start unburying yourself and get on the
path to inbox zero -- Gmail's keyboard shortcuts can help.

Keyboard shortcuts are not enabled by default, so you'll need to turn them
on in settings. Click the _gear_ icon, select _Settings_ and then scroll
down under the _General_ tab until you find the _Keyboard shortcuts_
section. Select the _Keyboard shortcuts on_ radio button and then _Save
changes_.

You'll now have access to a variety of shortcuts, such as using the `j` and
`k` keys to move up and down the list of emails in your inbox. [Find the one
you want and hit `o` to open it
up](https://til.hashrocket.com/posts/41grpsmqzu-gmail-o-).

Keep exploring -- there is a whole world of keyboard shortcuts out there.

h/t Jake Worth

# Exclude Whitespace Changes From GitHub Diffs

If you run a tidy ship and use plugins like
[vim-spacejam](https://github.com/rondale-sc/vim-spacejam), then whitespace
changes cluttering up your git diffs probably isn't much of an issue.

However, if you are working with other people or messier code bases, then
you may not be so lucky. If there are a bunch of whitespace changes in a
commit, then that is going to make the diff view of a commit on GitHub
annoying, and perhaps hard, to read.

You can cut to the chase by excluding whitespace changes from GitHub's diff
view by adding `w=1` to the diff URL.

Check out [this view of the
diff](https://github.com/jbranchaud/dotfiles/commit/fad58dfda91e61972b3c28e7e967bb631140e71e)
and then [this view of the diff that excludes
whitespace](https://github.com/jbranchaud/dotfiles/commit/fad58dfda91e61972b3c28e7e967bb631140e71e?w=1).

[source](https://twitter.com/ablwr/status/789141645098938368)

# Figure Out Your Public IP Address

Want to know what your public IP address is?

Visit [ifconfig.io](http://ifconfig.io/) to get a bunch of information about
your connection including your public IP address.

# Focus The URL Bar

There are a lot of things you can do in the browser without having to reach
for the mouse. Bringing the URL bar into focus is one of those things.

Hit `Cmd+L` in any modern browser (I've tried Chrome, Firefox, and Safari)
and the URL bar will be brought into focus. From there, you can quickly
change the URL of the current tab and your fingers never left the keyboard.

h/t Jake Worth

# Get Random Images From Unsplash

_The below doesn't work on GitHub. It seems that GitHub caches and serves
its own version of the image. This will work anywhere where you aren't
caching images._

Here is an image from [unsplash.com](https://unsplash.com).

![random images](http://source.unsplash.com/random/1200x600)

I don't know what image I am showing you though. That's because the URL
being sourced for the above image is
`http://source.unsplash.com/random/1200x600`. This tells unsplash to
randomly serve us a `1200x600` image. Try refreshing the page and you'll see
that it is different each time. Cool!

This is a bit of a novelty, but could be useful on occasion. The
[Gatsby](https://www.gatsbyjs.org/) docs use it to great effect in a
tutorial so as to not get caught up with the details of serving a specific
image.

# Search Tweets By Author

Twitter has some advanced search features that allow you to do more than
just search by keyword. The `from:<author>` syntax is the way that you can
restrict your search results to a specific twitter user.

![twitter from search](http://i.imgur.com/yWi9JB7.png)

By using `"pair programming" from:hashrocket`, I am able to find all of the
tweets by `@hashrocket` that use the exact phrase `pair programming`.

# Show All Pivotal Stories With Blockers

Within the past year [Pivotal Tracker](https://www.pivotaltracker.com) added
a feature that allows you to mark stories with _blockers_. These are visual
indicators with a description that are used to show a particular story is
blocked, that is, it cannot be completed until something else is taken care
of.

In order to maintain the health of the project, it is good to triage these
blocked stories from time to time. The best way to identify all of the
blocked stories is to filter them into their own column.

Enter `is:blocked` into the search bar to show all of the blocked stories.

