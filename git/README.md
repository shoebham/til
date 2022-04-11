### Category git

---

 - [Accessing A Lost Commit](#accessing-a-lost-commit)
 - [Amend Author Of Previous Commit](#amend-author-of-previous-commit)
 - [Auto-Squash Those Fixup Commits](#auto-squash-those-fixup-commits)
 - [Caching Credentials](#caching-credentials)
 - [Change The Start Point Of A Branch](#change-the-start-point-of-a-branch)
 - [Checking Commit Ancestry](#checking-commit-ancestry)
 - [Checkout Old Version Of A File](#checkout-old-version-of-a-file)
 - [Checkout Previous Branch](#checkout-previous-branch)
 - [Cherry Pick A Range Of Commits](#cherry-pick-a-range-of-commits)
 - [Clean Out All Local Branches](#clean-out-all-local-branches)
 - [Clean Out Working Copy With Patched Restore](#clean-out-working-copy-with-patched-restore)
 - [Clean Up Old Remote Tracking References](#clean-up-old-remote-tracking-references)
 - [Clone A Repo Just For The Files, Without History](#clone-a-repo-just-for-the-files,-without-history)
 - [Clone A Repo Locally From .git](#clone-a-repo-locally-from-.git)
 - [Configure Global gitignore File](#configure-global-gitignore-file)
 - [Configuring The Pager](#configuring-the-pager)
 - [Copy A File From Another Branch](#copy-a-file-from-another-branch)
 - [Create A New Branch With Git Switch](#create-a-new-branch-with-git-switch)
 - [Delete All Untracked Files](#delete-all-untracked-files)
 - [Determine The Hash Id For A Blob](#determine-the-hash-id-for-a-blob)
 - [Diffing With Patience](#diffing-with-patience)
 - [Dropping Commits With Git Rebase](#dropping-commits-with-git-rebase)
 - [Dry Runs in Git](#dry-runs-in-git)
 - [Exclude A File From A Diff Output](#exclude-a-file-from-a-diff-output)
 - [Excluding Files Locally](#excluding-files-locally)
 - [Find The Date That A File Was Added To The Repo](#find-the-date-that-a-file-was-added-to-the-repo)
 - [Find The Initial Commit](#find-the-initial-commit)
 - [Get The Name Of The Current Branch](#get-the-name-of-the-current-branch)
 - [Get The Short Version Of The Latest Commit](#get-the-short-version-of-the-latest-commit)
 - [Grab A Single File From A Stash](#grab-a-single-file-from-a-stash)
 - [Grep For A Pattern On Another Branch](#grep-for-a-pattern-on-another-branch)
 - [Grep Over Commit Messages](#grep-over-commit-messages)
 - [Ignore Changes To A Tracked File](#ignore-changes-to-a-tracked-file)
 - [Ignore Files Specific To Your Workflow](#ignore-files-specific-to-your-workflow)
 - [Include A Message With Your Stashed Changes](#include-a-message-with-your-stashed-changes)
 - [Include Or Exclude Remaining Patch Changes](#include-or-exclude-remaining-patch-changes)
 - [Include Some Stats In Your Git Log](#include-some-stats-in-your-git-log)
 - [Intent To Add](#intent-to-add)
 - [Interactively Unstage Changes](#interactively-unstage-changes)
 - [Last Commit A File Appeared In](#last-commit-a-file-appeared-in)
 - [List All Files Changed Between Two Branches](#list-all-files-changed-between-two-branches)
 - [List Branches That Contain A Commit](#list-branches-that-contain-a-commit)
 - [List Commits On A Branch](#list-commits-on-a-branch)
 - [List Different Commits Between Two Branches](#list-different-commits-between-two-branches)
 - [List Filenames Without The Diffs](#list-filenames-without-the-diffs)
 - [List Just The Files Involved In A Commit](#list-just-the-files-involved-in-a-commit)
 - [List Most Git Commands](#list-most-git-commands)
 - [List Untracked Files](#list-untracked-files)
 - [List Untracked Files For Scripting](#list-untracked-files-for-scripting)
 - [Move The Latest Commit To A New Branch](#move-the-latest-commit-to-a-new-branch)
 - [Pick Specific Changes To Stash](#pick-specific-changes-to-stash)
 - [Pulling In Changes During An Interactive Rebase](#pulling-in-changes-during-an-interactive-rebase)
 - [Push To A Branch On Another Remote](#push-to-a-branch-on-another-remote)
 - [Quicker Commit Fixes With The Fixup Flag](#quicker-commit-fixes-with-the-fixup-flag)
 - [Rebase Commits With An Arbitrary Command](#rebase-commits-with-an-arbitrary-command)
 - [Reference A Commit Via Commit Message Pattern Matching](#reference-a-commit-via-commit-message-pattern-matching)
 - [Rename A Remote](#rename-a-remote)
 - [Renaming A Branch](#renaming-a-branch)
 - [Resetting A Reset](#resetting-a-reset)
 - [Resolve A Merge Conflict From Stash Pop](#resolve-a-merge-conflict-from-stash-pop)
 - [Run A Git Command From Outside The Repo](#run-a-git-command-from-outside-the-repo)
 - [Set A Custom Pager For A Specific Command](#set-a-custom-pager-for-a-specific-command)
 - [Show All Commits For A File Beyond Renaming](#show-all-commits-for-a-file-beyond-renaming)
 - [Show Changes For Files That Match A Pattern](#show-changes-for-files-that-match-a-pattern)
 - [Show Changes In The Compose Commit Message View](#show-changes-in-the-compose-commit-message-view)
 - [Show File Diffs When Viewing Git Log](#show-file-diffs-when-viewing-git-log)
 - [Show List Of Most Recently Committed Branches](#show-list-of-most-recently-committed-branches)
 - [Show Only Commits That Touch Specific Lines](#show-only-commits-that-touch-specific-lines)
 - [Show The diffstat Summary Of A Commit](#show-the-diffstat-summary-of-a-commit)
 - [Show The Good And The Bad With Git Bisect](#show-the-good-and-the-bad-with-git-bisect)
 - [Show What Is In A Stash](#show-what-is-in-a-stash)
 - [Single Key Presses in Interactive Mode](#single-key-presses-in-interactive-mode)
 - [Skip A Bad Commit When Bisecting](#skip-a-bad-commit-when-bisecting)
 - [Skip Pre-Commit Hooks](#skip-pre-commit-hooks)
 - [Staging Changes Within Vim](#staging-changes-within-vim)
 - [Staging Stashes Interactively](#staging-stashes-interactively)
 - [Stash A Single Untracked File](#stash-a-single-untracked-file)
 - [Stash Everything](#stash-everything)
 - [Stashing Only Unstaged Changes](#stashing-only-unstaged-changes)
 - [Stashing Untracked Files](#stashing-untracked-files)
 - [Switch To A Recent Branch With FZF](#switch-to-a-recent-branch-with-fzf)
 - [Turn Off The Output Pager For One Command](#turn-off-the-output-pager-for-one-command)
 - [Two Kinds Of Dotted Range Notation](#two-kinds-of-dotted-range-notation)
 - [Unstage Changes With Git Restore](#unstage-changes-with-git-restore)
 - [Untrack A Directory Of Files Without Deleting](#untrack-a-directory-of-files-without-deleting)
 - [Untrack A File Without Deleting It](#untrack-a-file-without-deleting-it)
 - [Update The URL Of A Remote](#update-the-url-of-a-remote)
 - [Using Commands With A Relative Date Format](#using-commands-with-a-relative-date-format)
 - [Verbose Commit Message](#verbose-commit-message)
 - [Viewing A File On Another Branch](#viewing-a-file-on-another-branch)
 - [What Changed?](#what-changed?)
 - [What Is The Current Branch?](#what-is-the-current-branch?)
 - [Whitespace Warnings](#whitespace-warnings)

---

# Accessing A Lost Commit

If you have lost track of a recent commit (perhaps you did a reset), you
can generally still get it back. Run `git reflog` and look through the
output to see if you can find that commit. Note the sha value associated
with that commit. Let's say it is `39e85b2`. You can peruse the
details of that commit with `git show 39e85b2`.

From there, the utility belt that is git is at your disposal. For
example, you can `cherry-pick` the commit or do a `rebase`.

# Amend Author Of Previous Commit

The author of the previous commit can be amended with the following command

```bash
$ git commit --amend --author "Don Draper <ddraper@sterlingcooper.com>" 
```

[source](http://stackoverflow.com/questions/750172/change-the-author-of-a-commit-in-git)

# Auto-Squash Those Fixup Commits

As a fan of [atomic commits](https://dev.to/jbranchaud/atomic-commits-4hk2), I
sometimes find myself with some changes that are ready to stage that belong on
an earlier commit. If it is the immediately previous, I'll do an `--amend`. For
anything further back than that, I've come to love the use of `git commit
--fixup <SHA>`.

Once one or more _fixup_ commits are on the current branch, they'll need to be
_squashed_ into the commits for which they've been targeted. This calls for a
`git rebase`.

Git knows how to squash fixup commits into the correct place, but you have to
tell it to do so automatically. You can do that one of two ways.

You can either include the `--autosquash` flag each time you rebase:

```bash
$ git rebase -i --autosquash
```

Or you can tell Git to always autosquash in your `~/.gitconfig`:

```
[rebase]
	autoSquash = true
```

See the section on `--autosquash` in `man git-rebase` for more details.

# Caching Credentials

When public key authentication isn't an option, you may find yourself typing
your password over and over when pushing to and pulling from a remote git
repository. This can get tedious. You can get around it by configuring git
to cache your credentials. Add the following lines to the `.git/config` file
of the particular project.

```
[credential]
    helper = cache --timeout=300
```

This will tell git to cache your credentials for 5 minutes. Use a much
larger number of seconds (e.g. 604800) to cache for longer.

Alternatively, you can execute the command from the command line like so:

```bash
$ git config credential.helper 'cache --timeout=300'
```

[source](http://git-scm.com/docs/git-credential-cache)

# Change The Start Point Of A Branch

More than a few times I have checked out a new branch against, say, `develop`
when I instead meant to base it off `qa`. I've tried what felt like the obvious
solution.

```bash
❯ git checkout qa
❯ git checkout -b new-branch
fatal: A branch named 'new-branch' already exists.
```

Git won't allow this. The fix I tend to go with is to delete the branch, move
to my intended starting point, and check it out anew.

Here is another approach. The `git checkout` command offers the `-B` flag which
will save me a step.

```bash
❯ git checkout -B new-branch
Switched to and reset branch 'new-branch'
```

Use this with caution. Any commits that have been applied to the subject branch
will be reset (read: wiped out) in the process.

See `man git-checkout` for more details.

# Checking Commit Ancestry

I have two commit shas and I want to know if the first is an ancestor of the
second. Put another way, is this first commit somewhere in the history of
this other commit.

Git's `merge-base` command combined with the `--is-ancestor` flag makes
answering this question easy. Furthermore, because it is a plumbing command,
it can be used in a script or sequence of commands as a switch based on the
answer.

Here is an example of this command in action:

```bash
$ git merge-base --is-ancestor head~ head && echo 'yes, it is'
yes, it is
$ git merge-base --is-ancestor head~ head~~ && echo 'yes, it is'
```

In the first command, `head~` is clearly an ancestor of `head`, so the
`echo` command is triggered. In the second, `head~` is not an ancestor of
`head~~` so the return status of 1 short-circuits the rest of the command.
Hence, no `echo`.

See `man git-merge-base` for more details.

[source](http://stackoverflow.com/questions/18345157/how-can-i-tell-if-one-commit-is-an-ancestor-of-another-commit-or-vice-versa)

# Checkout Old Version Of A File

When you want to return to a past version of a file, you can reset to a past
commit. When you don't want to abandon a bunch of other changes, this isn't
going to cut it. Another option is to just checkout the particular file as
it was at the time of a past commit.

If the sha of that past commit is `72f2675` and the file's name is
`some_file.rb`, then just use checkout like so:

```
$ git checkout 72f2675 some_file.rb
```

# Checkout Previous Branch

Git makes it easy to checkout the last branch you were on.

```bash
$ git checkout -
```

This is shorthand for `git checkout @{-1}` which is a way of referring to
the previous (or last) branch you were on. You can use this trick to easily
bounce back and forth between `master` and a feature branch.

[source](http://stackoverflow.com/questions/7206801/is-there-any-way-to-git-checkout-previous-branch)

# Cherry Pick A Range Of Commits

Git's `cherry-pick` command allows you to specify a range of commits to be
cherry picked onto the current branch. This can be done with the `A..B`
style syntax -- where `A` is the older end of the range.

Consider a scenario with the following chain of commits: `A - B - C - D`.

```bash
$ git cherry-pick B..D
```

This will cherry pick commits `C` and `D` onto `HEAD`. This is because the
lower-bound is exclusive. If you'd like to include `B` as well. Try the
following:

```bash
$ git cherry-pick B^..D
```

See `man git-cherry-pick` for more details.

# Clean Out All Local Branches

Sometimes a project can get to a point where there are so many local
branches that deleting them one by one is too tedious. This one-liner can
help:

```
$ git branch --merged master | grep -v master | xargs git branch -d
```

This won't delete branches that are unmerged which saves you from doing
something stupid, but can be annoying if you know what you are doing. If you
are sure you want to wipe everything, just use `-D` like so:

```
$ git branch --merged master | grep -v master | xargs git branch -D
```

[source](https://twitter.com/steveklabnik/status/583055065868447744)

# Clean Out Working Copy With Patched Restore

I sometimes let the working copy of my projects get a little messy. The working
copy is all the changes I've made to tracked files that haven't been staged or
commited.

After working for a bit, especially on something more exploratory, I end up
with comments, log statements, and debugging calls scattered across a bunch of
files.

If these exploratory changes are mixed in with a bunch of actual changes, it
can create a lot noise. I can clean up that noise by restoring the files. I can
be surgical about it with the `--patch` flag.

```bash
$ git restore --patch
```

This will prompt me for each changeset.

- `y` -- yes, restore that change
- `n` -- no, leave it there
- `q` -- bail out of the restore

There are other _patch_ options, but these are the ones I use the most. To see
what the rest of the options are, go to `man git-add` and find `patch` in the
`INTERACTIVE MODE` section.

# Clean Up Old Remote Tracking References

After working on a Git-versioned project for a while, you may find that
there are a bunch of references to remote branches in your local repository.
You know those branches definitely don't exist on the remote server and
you've removed the local branches, but
you still have references to them lying around. You can reconcile this
discrepancy with one command:

```bash
$ git fetch origin --prune
```

This will prune all those non-existent remote tracking references which is
sure to clean up your git log (`git log --graph`).

[source](http://stackoverflow.com/a/3184742/535590)

# Clone A Repo Just For The Files, Without History

Though the history of a Git repository is a huge part of its value, sometimes
you just want a copy of the files for the current state of the main branch.

Using the `--depth` flag with `git-clone` allows you to clone a repo without
its history. You can do that with a depth of `1` which will clone the top of
the tree and exclude all the past history.

```bash
$ git clone --depth 1 git@github.com:jbranchaud/til.git
```

If you do a `git log` after this, you'll see there is only one commit in the
history. Depending on the size and history of the repo, you may notice that the
clone is quicker than one that includes the full history.

See `man git-clone` for more details.

# Clone A Repo Locally From .git

If you want to get a clean copy of a repository that you have locally, there
is no need to go over the wire cloning it from the remote. You can clone
from a local copy.

```bash
$ git clone my-repo/.git path/to/fresh-copy
```

See `man git-clone` for more details.

# Configure Global gitignore File

There are some files that you know you'll never want tracked by git. You don't
even want them showing up as an option. For these files, it can be nice to
specify them in a global `.gitignore` file. Then you don't need to specify them
for each project.

This can be configured in `~/.gitconfig` under the `core` settings as
`excludesFile`.

```
[core]
	excludesFile = ~/.gitignore
```

Then, create `~/.gitignore` (that's as good a place as any to put it).

```
# global .gitignore
.DS_Store
wip_notes.md
```

You'll now notice that for any git project, the files you listed won't be
showing up in the untracked list.

You can also add this to your `~/.gitconfig` with this one-line command.

```bash
$ git config --global core.excludesfile ~/.gitignore
```

See `man git-config` and search `core.excludesFile` for more details.

# Configuring The Pager

When you run Git commands that produce a bunch of output, Git will use a
pager to present the content starting at the beginning, rather than spitting
it all out to the screen at once. This will almost always come in handy for
commands like `git-diff` and `git-log`.

By default, Git uses `less` as its pager.

You can also choose to configure it to something else by updating your git
config file or by running the following command:

```bash
$ git config --global core.pager 'more'
```

If you'd like to turn the pager off altogether, set it to a blank string.

```bash
$ git config --global core.pager ''
```

[source](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)

# Copy A File From Another Branch

After doing some work on a large feature branch, I wanted to split out some of
the work into a separate smaller branch to create an initial PR. There were
several files on the feature branch that I knew needed to be part of this
smaller branch.

To bootstrap this smaller branch, I need to check it out from main and then
copy over the needed files.

First, let's create a fresh branch:

```bash
$ git branch --show-current
large-feature-branch

$ git checkout main
$ git checkout -b new-smaller-branch
```

Now I can start pulling over the files I care about:

```bash
$ git checkout large-feature-branch some/file/ICareAbout.js
```

This form of `git-checkout` looks on the specified branch for the specified
file and copies that over to the index.

Note: this will copy over any local, working tree changes that you've made to
the named file.

# Create A New Branch With Git Switch

As of [Git 2.23](https://www.infoq.com/news/2019/08/git-2-23-switch-restore/),
there is a new command in town for change and creating branches --
`git-switch`.

As a git user, you may be used to using `git checkout -b my_branch` to create
and switch to a new branch called `my_branch`. The `git-checkout` command can
do that and a lot more. In order to reduce some confusion and create a more
explicit command for this kind of action. That's what brought about
`git-switch`.

Create and change to a new branch with `git-switch` and the `-c` flag:

```bash
$ git switch -c my_new_branch
```

The `-c` flag is short for `--create` and the docs describe it as "a convenient
shortcut for:"

```bash
$ git branch <new-branch>
$ git switch <new-branch>
```

See `man git-switch` for more details.

# Delete All Untracked Files

Git provides a command explicitly intended for cleaning up (read: removing)
untracked files from a local copy of a repository.

> git-clean - Remove untracked files from the working tree

Git does want you to be explicit though and requires you to use the `-f`
flag to force it (unless otherwise configured).

Git also gives you fine-grained control with this command by defaulting to
only deleting untracked files in the current directory. If you want
directories of untracked files to be removed as well, you'll need the `-d`
flag.

So if you have a local repository full of untracked files you'd like to get
rid of, just:

```bash
$ git clean -f -d
```

or just:

```bash
$ git clean -fd
```

[source](http://stackoverflow.com/questions/61212/remove-local-untracked-files-from-my-current-git-branch)

# Determine The Hash Id For A Blob

Git's `hash-object` command can be used to determine what hash id will be
used by git when creating a blob in its internal file system.

```bash
$ echo 'Hello, world!' > hola
$ git hash-object hola
af5626b4a114abcb82d63db7c8082c3c4756e51b
```

When a commit happens, git will generate this digest (hash id) based on the
contents of the file. The name and location of the file don't matter, just
the contents. This is the magic of git. Anytime git needs to store a blob,
it can quickly match against the hash id in order to avoid storing duplicate
blobs.

Try it on your own machine, you don't even need to initialize a git
repository to use `git hash-object`.

[source](http://ftp.newartisans.com/pub/git.from.bottom.up.pdf)

# Diffing With Patience

The default diff algorithm used by Git is pretty good, but it can get
mislead by larger, complex changesets. The result is a noisier, misaligned
diff output.

If you'd like a diff that is generally a bit cleaner and can afford a little
slow down (you probably can), you can instead use the `patience` algorithm
which is described as such:

> Patience Diff, instead, focuses its energy on the low-frequency
> high-content lines which serve as markers or signatures of important
> content in the text. It is still an LCS-based diff at its core, but with
> an important difference, as it only considers the longest common
> subsequence of the signature lines:

> Find all lines which occur exactly once on both sides, then do longest
> common subsequence on those lines, matching them up.

You can set this as the default algorithm by adding the following lines to
your `~/.gitconfig` file:

```
[diff]
    algorithm = patience
```

or it can be set from the command line with:

```bash
$ git config --global diff.algorithm patience
```

[source](http://bryanpendleton.blogspot.com/2010/05/patience-diff.html)

h/t Josh Davey

# Dropping Commits With Git Rebase

I've been warned enough times about the potential dangers of `git reset
--hard ...` that I always second guess myself as I type it out. Is it `git
reset --hard HEAD` or `git reset --hard HEAD~`?

If the working directory and index are clean, then there is another way to
remove commits. A way that gives me more confidence about what exactly is
being removed.

Doing an interactive rebase gives you a number of options. One of those
options is `d` (which stands for `drop`).

```
$ git rebase -i master
```

This pulls up an interactive rebase with all commits going back to what is
on master -- great for when working from a feature branch.

```
pick 71ed173 Add Create A Stream From An Array as a reasonml til
pick 80ac8d3 Add some clarity by distinguishing var names
d 4f06c32 Add Data Structures With Self-Referential Types as a reasonml til
d 01a0e75 Fix the name of this file
```

Adding `d` next to the commits you want to get rid of and saving will drop
those commits. The great part is that there is zero ambiguity about which
ones are being dropped.

h/t Jake Worth

# Dry Runs in Git

There are a few commands in git that allow you to do a *dry run*. That is,
git will tell you the effects of executing a command without actually
executing that command.

For instance, if you are clearing out untracked files, you can double check
what files are going to be deleted with the *dry run* flag, like so:

```
$ git clean -fd --dry-run
Would remove tmp.txt
Would remove stuff/
```

Similarly, if you want to check in which files a commit is going to be incorporated,
you can:

```
$ git commit --dry-run --short
M  README.md
A  new_file.rb
```

Try running `git commit --dry-run` (that is, without the `--short` flag).
Look familiar? That is the same output you are getting from `git status`.

# Exclude A File From A Diff Output

When running `git diff <SHA>`, you'll see output for all files changed at that
commit. It's the same if you do a range of commits (e.g. `git diff
<SHA1>...<SHA2>`).

If you are looking for changes in a particular part of the tree, then other
changes will be a distraction. Some generated files, such as `yarn.lock`, can
create a lot of noise in the diff output.

You can get a more focused output by excluding certain files and paths. The
syntax for doing that, however, is a bit wonky.

To exclude a file, you have to add an argument formatted like
`':(exclude)<filename>`.

For instance, to exclude `yarn.lock`:

```bash
$ git diff <SHA> -- . ':(exclude)yarn.lock'
```

or to exclude an entire directory:

```bash
$ git diff <SHA> -- . ':(exclude)spec/**'
```

[source](https://stackoverflow.com/questions/39931781/git-diff-stat-exclude-certain-files/39937070#39937070)

# Excluding Files Locally

Excluding (read: ignoring) files that should not be tracked is generally
done by listing such files in a tracked `.gitignore` file. Though it doesn't
make sense to list all kinds of excluded files here. For files that you'd
like to exclude that are temporary or are specific to your local
environment, there is another option. These files can be added to the
`.git/info/exclude` file as a way of ignoring them locally.

Add specific files or patterns as needed to that file and then save it.
Relevant files will no longer show up as untracked files when you `git
status`.

h/t [Dillon Hafer](https://twitter.com/DillonHafer)

# Find The Date That A File Was Added To The Repo

The `git log` command has a bunch of flags that you can use to filter
commits and format their output.

We can get `git log` to only show the date for a commit in the `short`
format with the following flags:

```bash
$ git log --pretty=format:"%ad" --date=short
```

We can also get `git log` to filter commits to just those that have files
being added:

```bash
$ git log --diff-filter=A
```

Like many `git` commands, we can restrict the output to those that match a
path or file.

```bash
$ git log -- README.md
```

If we put all of these together, then we have a one-line command for getting
the date a specific file was added to the repository:

```bash
$ git log --pretty=format:"%ad" --date=short --diff-filter=A -- README.md
2015-02-06
```

See `man git-log` for more details.

# Find The Initial Commit

By definition, the initial commit in a repository has no parents. You can
exploit that fact and use `rev-list` to find the initial commit; a commit
with no parents.

```bash
$ git rev-list --max-parents=0 HEAD
```

The `rev-list` command lists all commits in reverse chronological order. By
restricting them to those with at most 0 parents, you are only going to get
root commits. Generally, a repository will only have a single root commit,
but it is possible for there to be more than one.

See `man git-rev-list` for more details.

[source](http://stackoverflow.com/questions/5188914/how-to-show-first-commit-by-git-log)

# Get The Name Of The Current Branch

There are a couple ways of doing this. If you are on Git 2.22+, then the
`git-branch` porcelain command now supports a flag for this.

```bash
$ git branch --show-current
main
```

If you are on an older version of Git or looking for a plumbing command that is
more appropriate for scripting, then `git-rev-parse` is what you're looking
for.

```bash
$ git rev-parse --abbrev-ref HEAD
main
```

[source](https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git)

# Get The Short Version Of The Latest Commit

As part of some automated scripting for an app deployment I wanted to be
able to get the short version of the latest commit to the current git repo.
Git's `rev-parse` command is the perfect fit for this.

```bash
$ git rev-parse --short HEAD
708248b
```

See `man git-rev-parse` for more details.

[source](https://stackoverflow.com/questions/5694389/get-the-short-git-version-hash)

# Grab A Single File From A Stash

In git, you can reference a commit SHA or branch to checkout differing
versions of files.

```bash
$ git checkout d3d2e38 -- README.md
```

In the same way, you can snag the version of a file as it existed in a
stash. Just reference the relevant stash.

```bash
$ git checkout stash@{1} -- README.md
```

[source](http://stackoverflow.com/questions/1105253/how-would-i-extract-a-single-file-or-changes-to-a-file-from-a-git-stash)

# Grep For A Pattern On Another Branch

Git has a built-in `grep` command that works essentially the same as the
standard `grep` command that unix users are used to. The benefit of
`git-grep` is that it is tightly integrated with Git.
You can search for occurrences of a pattern on another branch. For example,
if you have a feature branch, `my-feature`,  on which you'd like to search
for occurrences of `user.last_name`, then your command would look like this:

```bash
$ git grep 'user\.last_name' my-feature
```

If there are matching results, they follow this format:

```
my-feature:app/views/users/show.html.erb:  <%= user.last_name %>
...
```

This formatting is handy because you can easily copy the branch and file
directive for use with [`git-show`](viewing-a-file-on-another-branch.md).

See `man git-grep` for more details.

# Grep Over Commit Messages

The `git log` command supports a `--grep` flag that allows you to do a text
search (using grep, obviously) over the commit messages for that repository.
For the git user that writes descriptive commit messages, this can come in
quite handy. In particular, this can be put to use in an environment where
the standard process involves including ticket and bug numbers in the commit
message. For example, finding bug `#123` can be accomplished with:

```bash
$ git log --grep="#123"
```

See `man git-log` for more details.

# Ignore Changes To A Tracked File

Files that should never be tracked are listed in your `.gitignore` file. But
what about if you want to ignore some local changes to a tracked file?

You can tell git to assume the file is unchanged

```bash
$ git update-index --assume-unchanged <some-file>
```

Reversing the process can be done with the `--no-assume-unchanged` flag.

[source](http://blog.pagebakers.nl/2009/01/29/git-ignoring-changes-in-tracked-files/)

# Ignore Files Specific To Your Workflow

_If you want to watch instead of read, I explore this in [Four Ways to Ignore
Files with Git](https://www.youtube.com/watch?v=ip06v7Wnfz0)._

The most common way to tell git to ignore files is to add them to a project's
`.gitignore` file. This file is kept under version control, so it is shared
with anyone who clones the project.

What about ignoring files that shouldn't necessarily be recorded in the
project's `.gitignore`?

For instance, let's say I create a `notes.md` file to write some project notes
to myself or keep track of a few todo items. This file is just for me. I don't
want it committed. Because this `notes.md` is an idiosyncrasy of my workflow, I
don't want to exclude it in the tracked `.gitignore` file.

Instead, this file is a perfect candidate for the git repository's
`.git/info/exclude` file. Git treats entries in this file the same as it does
the `.gitignore` file. This file only exists on my machine and is not under
version control.

```
# .git/info/exclude
notes.md
```

Once I've added that line, `notes.md` will no longer show up as an untracked
file when I run `git status`.

See `man gitignore` for more details.

# Include A Message With Your Stashed Changes

If you were to quickly stash some changes, you end up with a stash reference
that git would attach a little context to, such as the latest commit SHA and
the first line of its commit message.

```bash
$ git stash list
stash@{0}: WIP on master: 6766419 Add link to source for latest TIL
```

Often this won't provide you the needed context to return to your stash and
pick up where you left off even days later.

You can customize the message of a stash with the `-m` flag.

```bash
$ git stash push -m 'made some changes'
```

When you view your stash list, you'll see your custom message.

```bash
$ git stash list
stash@{0}: On master: made some changes
```

And hopefully that's the context you need to hit the ground running.

See `man git-stash` for more details.

# Include Or Exclude Remaining Patch Changes

I often use `git add --patch` as a way of interactively staging changes for a
commit. Git walks me through each individual chunk of changes—which it calls
_hunks_—so that I can include it or exclude it.

Sometimes, like when I'm working with a `yarn.lock` file, there are a ton of
computer-generated changes to a file that I don't want to individually confirm.
One of the options while interactively staging is to hit `a` which will stage the current hunk and all later hunks for the current file.

A complementary scenario arises at times when working with a Rails `schema.rb`
file. There are a bunch of Postgres client-specific changes that I don't want
to commit. Once I get to the `schema.rb` file, I can hit `d` to _not_ stage
this or all remaining hunks in the current file.

```
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
```

This saves me from hitting `y` a dozen times to accept changes or hitting `n` a
dozen times to decline changes.

See `man git-add` and look for the _Interactive mode_ section for more details.

# Include Some Stats In Your Git Log

A simple `git log` command is going to give you a concise set of information
for each commit. Usually it is enough info. When it's not, `git log` can
provide additional information with the right flags. To include overall and
per-file stats on the number of insertions and deletions, use the `--stat`
flag.

```bash
$ git log --stat
commit 66e67741a1cd6857a4467d1453c9f17ef5849f20
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Mon Nov 13 21:24:41 2017 -0600

    Add Focus The URL Bar as an internet til

 README.md                     |  3 ++-
 internet/focus-the-url-bar.md | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

commit 9241e3919ef1e4f68b71a1491d368ae6361084aa
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat Nov 11 11:41:40 2017 -0600

    Add Freeze An Object, Sorta as a javascript til

 README.md                            |  3 ++-
 javascript/freeze-an-object-sorta.md | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

...
```

See `man git-log` for more details.

# Intent To Add

Git commands like `git diff` and `git add --patch` are awesome, but their
little caveat is that they only work on files that are currently tracked in
the repository. That means that after working on that new feature for 30
minutes, a `git diff` is only going to show you the changes to existing
files and when you go to start making commits with `git add --patch` you
will again be provided with only part of the picture.

The `git add` command has a flag, `-N`, that is described in the git man
pages:

> Record only the fact that the path will be added later. An entry for the
> path is placed in the index with no content. This is useful for, among other
> things, showing the unstaged content of such files
> with git diff and committing them with git commit -a.

By adding untracked files with the `-N` flag, you are stating your *intent
to add* these files as tracked files. Once git knows that these files are
meant to be tracked, it will know to include them when doing things like
computing the diff, performing an interactive add, etc.

# Interactively Unstage Changes

I often use `git add --patch` to interactively stage changes for a commit.
Git takes me through changes to tracked files piece by piece to check if I
want to stage them. This same interactive _staging_ of files can be used in
reverse when removing changes from the index. Just add the `--patch` flag.

You can use it for a single file

```bash
$ git reset --patch README.md
```

or you can let it operate on the entire repository

```bash
$ git reset --patch
```

This is useful when you've staged part of a file for a commit and then
realize that some of those changes shouldn't be committed.

# Last Commit A File Appeared In

In my project, I have a `README.md` file that I haven't modified in a while.
I'd like to take a look at the last commit that modified it. The `git log`
command can be used here with few arguments to narrow it down.

```
$ git log -1 -- README.md
commit 6da76838549a43aa578604f8d0eee7f6dbf44168
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sun May 17 12:08:02 2015 -0500

    Add some documentation on configuring basic auth.
```

This same command will even work for files that have been deleted if you
know the path and name of the file in question. For instance, I used to have
an `ideas.md` file and I'd like to find the commit that removed it.

```
$ git log -1 -- docs/ideas.md
commit 0bb1d80ea8123dd12c305394e61ae27bdb706434
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat May 16 14:53:57 2015 -0500

    Remove the ideas doc, it isn't needed anymore.
```

# List All Files Changed Between Two Branches

The `git-diff` command can help with finding all files that have changed
between two branches. For instance, if you are at the `HEAD` of your current
feature branch and you'd like to see the list of files that have changed
since being in sync with the `master` branch, you'd formulate a command like
the following:

```bash
$ git diff --name-only master
```

The `--name-only` flag is important because it cuts out the rest of the
non-essential output.

You'll want to list the _older_ branch first and the current branch second
as a way of showing what has changed from the original branch to get to the
current branch.

Though the example shows the use of _branches_ any git reference can be used
to see what has changed between two commits.

See `man git-diff` for more details.

# List Branches That Contain A Commit

You know a certain change made it onto the main branch. You'd like to know if
that changes has been integrated back into the development and staging
branches. If you have a specific git sha associated with that change, there is
a handy way to check.

```bash
$ git branch --contains 50e1151
```

The `--contains` flag of the
[`git-branch`](https://git-scm.com/docs/git-branch) command will list all
branches locally that contain the given commit sha.

If you don't see any output, then no branches have that sha. This means either there are remote changes that you need to pull down or you're looking at the wrong repo.

See `man git-branch` for more details.

# List Commits On A Branch

You can list all commits that have taken place since a branch split off from
another branch using `git log`. You just need to specify a ref range with
the originating branch and the branch of interest.

```bash
$ git log master..my-feature-branch
```

That will list all commits on `my-feature-branch` since it branched off from
`master`.

I like to tighten up the output a bit with a flag:

```bash
$ git log master..my-feature-branch --oneline
```

See `man git-log` for more details.

# List Different Commits Between Two Branches

There are times when I want to get a sense of the difference between two
branches. I don't want to look at the actual diff though, I just want to see
what commits are on one and the other.

I can do just this by using the `git-log` command with a couple flags, most
importantly the `--cherry-pick` flag.

To compare the `feature` branch against the `master` branch, I can run a
command like the following:

```bash
$ git log --left-right --graph --cherry-pick --oneline feature...branch
```

This lists commits with the first line of their messages. It also includes
either a `<` or `>` arrow at the front of each commit indicating whether the
commit is on the left (`feature`) or right (`master`) branch, respectively.

Note: you can use more than branches in a command like this. Any two
references will work. You can just use two SHAs for instance.

[source](http://stackoverflow.com/questions/7566416/different-commits-between-two-branches)

# List Filenames Without The Diffs

The `git show` command will list all changes for a given reference
including the diffs. With diffs included, this can get rather verbose at
times. If you just want to see the list of files involved (excluding the
diffs), you can use the `--name-only` flag. For instance,

```
$ git show HEAD --name-only
commit c563bafb511bb984c4466763db7e8937e7c3a509
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat May 16 20:56:07 2015 -0500

    This is my sweet commit message

app/models/user.rb
README.md
spec/factories/user.rb
```

# List Just The Files Involved In A Commit

As part of a script I was writing I needed a command that could list out all
the files involved in a given commit. The `git-show` command (which is
considered a porcelain command) can do this but isn't ideal for scripting. It
is recommended to instead use _plumbing_ commands.

The `git-diff-tree` command is perfect for listing blobs (files) involved in a
commit.

```bash
$ git diff-tree --no-commit-id --name-only -r <SHA>
```

The `--no-commit-id` flag suppresses the output of the commit id, because we
want just the files. The `--name-only` flag tells the command to suppress other
file info and to only show the file names. The `-r` flag tells the command to
recurse into subtrees so that you get full pathnames instead of just the
top-level directory.

If you're interested, the `git-show` parallel to this is:

```bash
$ git show --pretty="" --name-only <SHA>
```

See `man git-diff-tree` and `man git-show` for more details on these.

[source](https://stackoverflow.com/questions/424071/how-to-list-all-the-files-in-a-commit)

# List Most Git Commands

You can list most git commands by using the `-a` flag with `git-help`:

```
$ git help -a
```

[Source](http://stackoverflow.com/questions/7866353/git-list-all-available-commands)

# List Untracked Files

Git's `ls-files` command is a plumbing command that allows you to list
different sets of files based on the state of the working directory. So, if
you want to list all untracked files, you can do:

```
$ git ls-files --others
```

This includes files *ignored* by the `.gitignore` file. If you want to
exclude the ignored files and only see *untracked* and *unignored* files,
then you can do:

```
$ git ls-files --exclude-standard --others
```

There are some other flags worth checking at at `git help ls-files`.

[source](http://stackoverflow.com/questions/2657935/checking-for-a-dirty-index-or-untracked-files-with-git)

# List Untracked Files For Scripting

You'll generally run `git status` to get an overview of the index and working
tree of a git project. This is a _porcelain_ command meant for a Git end-user.
If you want to do some scripting, you'll want a _plumbing_ command like
`ls_files`.

The `git ls-files` command will

> Show information about files in the index and the working tree

This command can be used to list all untracked files in the working tree with
two flags.

1. The `--others` flag will show untracked files in the output
2. The `--exclude-standard` will use the standard ignore files like
   `.gitignore` and `.git/info/exclude`.

Put it all together and you've got:

```bash
$ git ls-files --others --exclude-standard
```

In [Make One-Line Commands Interactive with
fzf](https://www.youtube.com/watch?v=wf5eXdwfVws), I show how to use this with
`fzf` to interactively remove untracked files that are no longer wanted.

[source](https://stackoverflow.com/a/3801554/535590)

# Move The Latest Commit To A New Branch

I sometimes find myself making a commit against the `master` branch that I
intended to make on a new branch. To get this commit on a new branch, one
possible approach is to do a reset, checkout a new branch, and then
re-commit it. There is a better way.

```bash
$ git checkout -b my-new-branch
$ git checkout - 
$ git reset --hard HEAD~
```

This makes better use of branches and avoids the need to redo a commit that
has already been made.

Note: The example was against the `master` branch, but can work for any
branch.

# Pick Specific Changes To Stash

If you run `git stash`, all of the changes to tracked files on the working tree
will be put into a commit-like entity in the stash list.

If you want to be a bit choosier about what gets saved during a stash, you can
include the `--patch` flag.

> With --patch, you can interactively select hunks from the diff between HEAD
> and the working tree to be stashed.

```bash
$ git stash --patch
```

Once in the interactive mode initiated by `--patch`, you'll be presented with a
change of changes and some options. You hit `y` for "yes, include this" and `n`
for "no, don't include that". And then there are some more advanced options
which you can read about in the _Interactive Mode_ section of `git-add`'s man
page.

See `man git-stash` for more details.

# Pulling In Changes During An Interactive Rebase

My standard workflow when doing feature development is to checkout a feature
branch and commit changes as I go. When the feature is finished, I clean up
the commit history with an interactive rebase and then integrate those
changes with `master`.

I initiate the interactive rebase like this (while on the feature branch):

```
$ git rebase -i master
```

This allows me to squash, fixup, and delete commits that I've made since
checking out this branch from `master`.

It is important to note that an another thing will happen seemingly behind
the scenes. Any commits on `master` since the feature branch was checked out
will be applied to the feature branch before the effects of the interactive
rebase are applied.

If you want to strictly do an interactive rebase of the commits on the
feature branch ignoring what is on `master`, then reference the commit you
checked out from -- put another way, reference the commit before the first
commit on this branch.

```
$ git rebase -i <sha-of-first-commit-on-this-branch>~
```

The tilde (`~`) will go back one commit from the specified commit sha.

See `man git-rebase` for more details.

# Push To A Branch On Another Remote

The kind of `git-push` I do most often is:

```bash
$ git push origin HEAD
```

which I have aliased to `put` in my `.gitconfig`.

`HEAD` generally refers to whatever branch you currently have checked out. So
this command will take the state of your current branch and push it to the
branch of the same name on the `origin`, which is a _remote_ (see `git remote
-v`).

If you have other remotes set up, such as a `staging`, `heroku`, etc., then you
may instead want to push to one of those.

```bash
$ git push heroku HEAD
```

This will push the state of the current branch to that branch on the `heroku`
remote.

If I instead want to push the changes from one local branch to a different
named remote branch, then I have to specify both like so:

```bash
$ git push heroku staging:main
```

This will push the state of my local `staging` branch to the `main` branch on
the `heroku` remote.

[source](https://devconnected.com/how-to-push-git-branch-to-remote/)

# Quicker Commit Fixes With The Fixup Flag

Imagine you're working a feature branch and realize that the first commit you
made had a typo. You could just tack on another commit to fix the typo, but
that will add noise to your commit history. You can fix it up by making a
_fixup_ commit.

1. Make your typo fix
2. Stage the fix
3. Find the SHA of the commit that you want to fix (e.g. `2ee53ad`)
4. Create a _fixup_ commit: `git commit --fixup 2ee53ad`

This _fixup_ commit is tied to the original commit it is fixing.

```
❯ git log --pretty=oneline --abbrev-commit
b4258b6 (HEAD -> feature-branch) fixup! Add header
9c0d2b0 Different atomic change
2ee53ad Add header
8486b91 (master) Initial commit
```

To then apply the _fixup_, run `git rebase -i --autosquash master`. This will
present you with the following _interactive rebase_ screen:

```
pick 2ee53ad Add header
fixup b4258b6 fixup! Add header
pick 9c0d2b0 Different atomic change

# Rebase 8486b91..b4258b6 onto 8486b91 (3 commands)
```

Because git knows that your _fixup_ commit is tied to `2ee53ad`, it
automatically moves it into place below that commit with the `fixup` command.

Saving will apply and autosquash the fixup commit leaving you with a clean
commit history.

# Rebase Commits With An Arbitrary Command

Interactive rebasing is a powerful way to manage and tend to the history of
a git repository. Rewording and squashing commits are fairly common actions.
But what if you need to run some arbitrary command against a series of
recent commits?

This is where the `--exec` flag comes in to play.

```bash
$ git rebase -i HEAD~3 --exec "git commit --amend --reset-authors -CHEAD"
```

This generates an interactive rebase file that you can review and save when
ready.

```
pick ea4a215 Add Globally Install A Package With Yarn as a javascript til
exec git commit --amend --reset-author -CHEAD
pick a4f4143 Add Initialize A New JavaScript Project With Yarn as a javascript til
exec git commit --amend --reset-author -CHEAD
pick 2f00aeb Add Default And Named Exports From The Same Module as a javascript til
exec git commit --amend --reset-author -CHEAD
```

As you can see, the specified command is prepared for execution for each
commit involved in the rebase.

h/t [Patricia Arbona](https://github.com/arbonap)

# Reference A Commit Via Commit Message Pattern Matching

Generally when referencing a commit, you'll use the SHA or a portion of the
SHA. For example with `git-show`:

```
$ git show cd6a63d014
...
```

There are many ways to reference commits though. One way is via regex
pattern matching on the commit message. For instance, if you recently had a
commit with a typo and you had included *typo* in the commit message, then
you could reference that commit like so:

```
$ git show :/typo
Author: Josh Branchaud
Date: Mon Dec 21 15:50:20 2015 -0600

    Fix a typo in the documentation
...
```

By using `:/` followed by some text, git will attempt to find the most
recent commit whose commit message matches the text. As I alluded to, regex
can be used in the text.

See `$ man gitrevisions` for more details and other ways to reference
commits.

[Source](https://twitter.com/jamesfublo/status/678906346335428608)

# Rename A Remote

If you just added a remote (`git remote add ...`) and messed up the name or
just need to rename some existing remote, you can do so with the `rename`
command.

First, let's see the remotes we have:

```bash
$ git remote -v
origin  https://github.com/jbranchaud/til.git (fetch)
origin  https://github.com/jbranchaud/til.git (push)
```

To then rename `origin` to `destination`, for example, we can issue the
following command:

```bash
$ git remote rename origin destination
```

See `man git-remote` for more details.

# Renaming A Branch

The `-m` flag can be used with `git branch` to move/rename an existing
branch. If you are already on the branch that you want to rename, all you
need to do is provide the new branch name.

```bash
$ git branch -m <new-branch-name>
```

If you want to rename a branch other than the one you are currently on, you
must specify both the existing (old) branch name and the new branch name.

```bash
$ git branch -m <old-branch-name> <new-branch-name>
```

h/t Dillon Hafer

# Resetting A Reset

Sometimes we run commands like `git reset --hard HEAD~` when we shouldn't
have. We wish we could undo what we've done, but the commit we've *reset* is
gone forever. Or is it?

When bad things happen, `git-reflog` can often lend a hand. Using
`git-reflog`, we can find our way back to were we've been; to better times.

```bash
$ git reflog
00f77eb HEAD@{0}: reset: moving to HEAD~
9b2fb39 HEAD@{1}: commit: Add this set of important changes
...
```

We can see that `HEAD@{1}` references a time and place before we destroyed
our last commit. Let's fix things by resetting to that.

```bash
$ git reset HEAD@{1}
```

Our lost commit is found.

Unfortunately, we cannot undo all the bad in the world. Any changes to
tracked files will be irreparably lost.

[source](http://stackoverflow.com/questions/2510276/undoing-git-reset)

# Resolve A Merge Conflict From Stash Pop

Occasionally when I've stashed some changes and then `stash pop` them back onto
me working tree, I'll end up with a merge conflict. Either some new commits or
other changes to the working tree are in conflict with what's in the stash. Git
tells me it's up to me to resolve it.

Running `git status`, I can see what files have merge conflicts. I can go and
resolve those now based on what I want the state of my working tree to be.

Running `git status`, I'll also note that the files from the stash not involved
in the conflict have been staged. I don' know why git stages those changes when
a merge conflict arises. When I `stash pop` and there is no merge conflict, git
leaves the changes on the working tree.

This has confused me more than a couple times. Is there anything I need to do
to complete or resolve the `stash pop`?

Nope. Resolving the conflicts in the affected files is all that needs to be
done. And since I'm generally not looking to create a commit at this point, I
_unstage_ the staged changes with `git reset HEAD`.

# Run A Git Command From Outside The Repo

Generally you run a git command from somewhere within the parent folder where
the `.git` directory lives. Git recognizes the `.git` directory in that parent
directory and runs your command against it.

You can run a command against a given git repository without being within the
parent directory. This can be handy for scripting as well as for one-off
commands when you don't want to `cd` to the directory. To do this, you need to
tell Git where to find the `.git` directory. You do this with the `-C` flag.

For instance, from anywhere on my machine, I can view a log of this TIL
repository with the following:

```bash
$ git -C ~/code/til log
```

Notice that the `-C` flag and its argument are positioned directly after `git`.
The command (`log`) should be positioned after that.

See `man git` for more details.

[source](https://stackoverflow.com/a/35899275/535590)

# Set A Custom Pager For A Specific Command

The pager can be [configured globally](configuring-the-pager.md), for [one run
of a command](turn-off-the-output-pager-for-one-command.md), or as I'll explain
in this post, for a specific command.

_I explore all of this in [Optimize the way Git displays the output of
commands](https://www.youtube.com/watch?v=VpFldePcu_w)._

Let's assume a git configuration that uses `less` for any command that need a
pager. Perhaps you'd like for the `git show` to work a bit differently than
other commands. You want it to use `less` with the `-F` and `-X` flags.

A custom pager command can be set for any command in the `[pager]` section of
the `~/.gitconfig` file.

```
[pager]
  show = "less -FX"
```

If you want to turn off the pager for a specific command, set it to the boolean
value `false` instead.

```
[pager]
  show = false
```

See `man git-config` for more details in the `core.pager` and `pager.<cmd>`
sections.

# Show All Commits For A File Beyond Renaming

By including `-- <filename>` with a `git log` command, we can list all the
commits for a file. The following is an example of such a command with some
formatting and file names.

```bash
> git log --name-only --pretty=format:%H -- README.md
4e57c5d46637286731dc7fbb1e16330f1f3b2b7c
README.md

56955ff027f02b57212476e142a97ce2b7e60efe
README.md

5abdc5106529dd246450b381f621fa1b05808830
README.md
```

What we may not realize, though, is that we are missing out on a commit in
this file's history. At one point, this file was renamed. The command above
wasn't able to capture that.

Using the `--follow` flag with a file name, we can list all commits for a
file beyond renaming.

```bash
> git log --name-only --pretty=format:%H --follow README.md
4e57c5d46637286731dc7fbb1e16330f1f3b2b7c
README.md

56955ff027f02b57212476e142a97ce2b7e60efe
README.md

5abdc5106529dd246450b381f621fa1b05808830
README.md

ea885f458b0d525f673623f2440de9556954c0c9
README.rdoc
```

This command roped in a commit from when `README.md` used to be called
`README.rdoc`. If you want to know about the *full* history of a file, this
is the way to go.

[source](http://stackoverflow.com/questions/3701404/list-all-commits-for-a-specific-file)

# Show Changes For Files That Match A Pattern

The `git show` command allows you to view the changes associated with a
reference, such as a commit sha (e.g. `git show 86748aacf14e`).

Consider a commit that has changed a bunch of JS files as well as two CSS
files. If we run `git show abcd1234`, we will see all of the changes to each
file which can result in quite a bit of noise. What if we only want to view
the changes to the CSS files?

We can instruct the command to only show changes to files that match a
pattern by tacking that pattern on to the end.

```bash
$ git show abcd1234 *.css
```

Alternatively, we could scope the output of the command to the files that
live in a certain directory.

```bash
$ git show abcd1235 src/css
```

# Show Changes In The Compose Commit Message View

When you execute `git commit`, you'll be dropped into your default editor
and prompted to compose a commit message. By default you'll only see the
status and names of the files involved in the commit.

To also see the line-by-line-changes in this view, you'll want to commit in
verbose mode.

```bash
$ git commit --verbose
```

You can also set verbose mode as the default by updating your `~/.gitconfig`
file.

```
[commit]
    verbose = true
```

[source](https://stackoverflow.com/questions/5875275/git-commit-v-by-default)

# Show File Diffs When Viewing Git Log

Include the `-p` flag with the `git log` command to include the diffs along
with the rest of the information for each commit. Here is an example of
running this against this repository.

```bash
$ git log -p
commit b9809a329acd8150b2474168f8faaf008f376e35
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Wed Oct 11 07:27:53 2017 -0500

    Add Inline Style Attributes Should Be Camel Cased as a react til

diff --git a/README.md b/README.md
index c982f8e..6ee7d32 100644
--- a/README.md
+++ b/README.md
@@ -10,7 +10,7 @@ smart people at [Hashrocket](http://hashrocket.com/).
 For a steady stream of TILs from a variety of rocketeers, checkout
 [til.hashrocket.com](https://til.hashrocket.com/).

-_574 TILs and counting..._
+_575 TILs and counting..._

 ---
```

See `man git-log` for more details.

# Show List Of Most Recently Committed Branches

The standard way to list your branches is with the `git branch` command. If
you use branches extensively for feature work and bug fixes, you may find
yourself overwhelmed by the list of branches trying to visually parse
through them for the one that you had worked on recently.

With the `git for-each-ref` command, we can produce a better list of
branches.

```bash
$ git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/
```

The command itself will iterate over all of the repository's refs and print
them out as a list. The `--sort=-committerdate` option will ensure that list
is sorted by refs mostly recently committed to. The `--count=10` option
limits the list output to 10 refs. The `format` flag cleans up the output a
bit, only showing the shortname of the ref. Lastly, the `refs/heads/`
argument ensures that only local refs are included in the output, thus
ignoring remote refs.

The result is a list of local branches ordered by recency which generally
corresponds to relevance.

See `man git-for-each-ref` for more details.

[source](https://twitter.com/djm_/status/961289486721339392)

# Show Only Commits That Touch Specific Lines

When you run `git log`, you are listing all commits in reverse-chronological
order for the current branch. There are ways of filtering the commits that
get output from `git-log`. As of Git 1.8.4, `git-log` output can be filtered
by commits that touch a range of line numbers.

This is done with the `-L` flag.

For instance, if I want to see all commits that touched the 13th line of my
`README.md` file, then I can do this:

```bash
$ git log -L13,13:README.md
```

I can alter the command to show commits that touched a range of lines like
so:

```bash
$ git log -L19,45:README.md
```

I used the `-L` flag recently to find when a dependency was added to my
`package.json` file even though the most recent changes to that line were
version bumps.

[source](https://stackoverflow.com/questions/8435343/retrieve-the-commit-log-for-a-specific-line-in-a-file)

# Show The diffstat Summary Of A Commit

Use the `--stat` flag when running `git show` on a commit to see the
`diffstat` summary of that commit. For instance, this is what I get for a
recent commit to [delve](https://github.com/derekparker/delve):

```bash
$ git show 8a1f36a1ce --stat
commit 8a1f36a1ce71d708d1d82afbc2191de9aefba021
Author: Derek Parker <derek.parker@coreos.com>
Date:   Wed Jan 27 23:47:04 2016 -0800

    dlv: Flag to print stacktrace on trace subcommand

 cmd/dlv/main.go     | 45 ++++++++++-----------------------------------
 terminal/command.go |  7 +++++--
 2 files changed, 15 insertions(+), 37 deletions(-)
```

The following is a description of the `diffstat` program

> This  program  reads the output of diff and displays a histogram of the
> insertions, deletions, and modifications per-file.

See `man git-show` and `man diffstat` for more details.

# Show The Good And The Bad With Git Bisect

The [`git bisect`](https://git-scm.com/docs/git-bisect) command is a
powerful tool for tracking down a past commit where something verifiable
about the code changed -- whether it be visual or functional. After using
`git bisect` to traverse back and forth through your commit history, you may
be wondering where things stand.

The [`git bisect
log`](https://git-scm.com/docs/git-bisect#_bisect_log_and_bisect_replay)
command will show you each commit that has been inspected and whether you've
marked it as good or bad.

These records can be handy for double checking your work if you're worried
that you made a mistake along the way.

# Show What Is In A Stash

Usually when I want to inspect anything in git, I'll use `git show` with a
specific ref. This can even be done with stash refs.

```bash
$ git stash list
stash@{0}: WIP on ...
stash@{1}: Some commit on ...

$ git show stash@{0}
# ...
```

The `git-stash` command has a built-in way of showing stashes that will save
you from having to type out the somewhat awkward `stash@{n}` ref.

```bash
$ git stash show 1
```

This will show you the `stash@{1}` ref. You can also omit a number which
will show you the latest stash (`stash@{0}`).

See `man git-stash` for more details.

# Single Key Presses in Interactive Mode

When staging changes in interactive mode (`git add -p`), you have a number
of options associated with single keys. `y` is *yes*, `n` is *no*, `a` is
*this and all remaining*, and so on.

By default, you have to press *enter* after making your selection. However,
it can be configured for single key presses. Add the following to your git
configuration file to enable single key presses for interactive mode:

```
[interactive]
    singlekey = true
```

[source](https://github.com/hashrocket/dotmatrix/blob/master/.gitconfig#L33-L34)

# Skip A Bad Commit When Bisecting

The `git bisect` command helps you quickly track down the commit where a bug
was introduced. It is quick because it picks the optimal (minimal) commits in a
binary search fashion.

It is possible that `git bisect` will pick a commit that you aren't able to
evaluate as _good_ or _bad_. If that commit is in a WIP state or for some other
unrelated reason prevents you from evaluating it, then you are kinda stuck.

To move forward, tell `git bisect` that you want to skip this commit:

```bash
$ git bisect skip
```

It will flag that one as skipped and find you another nearby commit to evaluate
instead.

If your commit history is in such a state that you have to skip many of the
suggested commits, it is possible that `git bisect` will not be able to help
you identify the problem commit. You may be left with a few commits that you'll
have to manually read through and evaluate.

This is a good reason to keep your commits atomic and in a functional state.

[source](https://git-scm.com/docs/git-bisect#_bisect_skip)

# Skip Pre-Commit Hooks

Projects can choose to adopt pre-commit hooks as part of their contribution
workflow. These hooks can help enforce project standards like ensuring a set of
changes are formatted and linting properly. These can be set up with a tool
like [husky](https://github.com/typicode/husky) or with a custom script.

As you're working on a feature branch, you can and should make frequent
checkpoint commits like a climber puts
[pitons](https://en.wikipedia.org/wiki/Piton) into the rock face. These are
anchor points that reduce the risk of losing work. They make it easier and
safer to return to a point in time when your code was in a "good" state.

If your checkpoint commit isn't conforming to all the pre-commit hook checks,
you can choose to skip the checks and commit anyway. To do this, tack on the
`--no-verify` flag.

```bash
$ git commit --no-verify
```

With this checkpoint in place, you can either plunge forward with the feature
or you can even go fix the pre-commit violations and combine them into
(`--amend`) that checkpoint commit.

Don't abuse this. You still want the overall work to conform to project
guidelines. Use the process that works best for you as you get there.

See `man git-commit` for more details.

# Staging Changes Within Vim

I've always used git from the command line, but only recently have I started
to leverage [fugitive.vim](https://github.com/tpope/vim-fugitive) to more
quickly do some common git commands from within vim.

I mostly use *fugitive* to stage changes for committing. To stage entire
files, you can view the repository status, `:Gstatus`, and then navigate up
and down (`k` and `j`) tapping `-` next to the files to be staged (or
unstaged).

I've started to use git's interactive mode for staging changes from the
command line (`git add --patch`) more and more and recently wondered if the
same thing can be accomplished with *fugitive*.

It turns out it's pretty simple to do so. Instead of tapping `-` next to a
file you want to stage, you can tap `p` next to it and you will be
immediately dropped into interactive mode for that file. Prepare the lines
you want to stage (or, again, unstage) and save.

# Staging Stashes Interactively

The `-p` flag can be used with `git stash`, just as it is used with `git add`,
for interactively staging a stash.

So, if you have changes in your working tree that you want to stash mixed
with ones that you want to keep working with, then you can simply do:

```
git stash -p
```

Read more on [interactive
staging](https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging).

# Stash A Single Untracked File

If you want to stash everything in your work tree and untracked files, you can
run:

```bash
$ git stash -u
```

If you want a bit more control over what gets stashed from the work tree, you
can interactively stash with `--patch` (or `-p`):

```bash
$ git stash -p
```

Unfortunately, the two don't work together.

```bash
$ git stash -u -p
Can't use --patch and --include-untracked or --all at the same time
```

So, if you'd like to stash a specific untracked file, you can instead formulate
a command like the following:

```bash
$ git stash -u -- <name-of-untracked-file>
```

This will stash just the specified untracked file and leave the rest of them as
they are.

I found this useful when trying to test the setup of a new library. There was
an extra new file that I didn't think I needed. Stashing it temporarily gets it
out of the way without losing it.

# Stash Everything

Running the `git stash` command will take all the changes to tracked files
in the working directory and stash them away. You can tack on the
`--include-untracked` flag to make sure that untracked files are also
included in the stash.

You can take this a step further with the `--all` flag. This will stash
everything included files that you've told git to ignore.

You probably don't want to do this. I ran this command and realized after
the command hung for about 10 seconds that I had just stashed the
`node_modules` directory.

See `man git-stash` for more details.

# Stashing Only Unstaged Changes

If you have both staged and unstaged changes in your project, you can
perform a stash on just the unstaged ones by using the `-k` flag. The
staged changes will be left intact ready for a commit.

```
$ git status
On branch master
...
Changes to be committed:

    modified:   README.md

Changes not staged for commit:

    modified:   app/models/user.rb

$ git stash -k
Saved working directory and index state ...

$ git status
On branch master
...
Changes to be committed:

    modified:   README.md
```

h/t [Chris Erin](https://twitter.com/MCNormalMode)

# Stashing Untracked Files

Normally when stashing changes, using `git stash`, git is only going to
stash changes to *tracked* files. If there are any new files in your project
that aren't being tracked by git, they will just be left lying around.

You might not want these *untracked* files left behind, polluting your
working copy. Perhaps these files change your projects functionality or
affect the outcome of tests. You just want them out of the way, for the
moment at least.

And so along comes the `-u` or `--untracked` flag.

```bash
$ touch new_file.rb
$ git stash
No local changes to stash
$ git stash -u
Saved working directory and index state WIP ...
```

# Switch To A Recent Branch With FZF

[Git](https://git-scm.com/) and [FZF](https://github.com/junegunn/fzf) make
a powerful team. Once you've installed FZF on your machine, there are all
kinds of add-on scripts that you can include in your shell configuration.

This one, for instance, is a personal favorite.

```bash
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
```

When you run the `fbr` command from your shell, FZF will compile a list of
the most recently committed to branches (including remote branches). That
list will then be available in a standard FZF prompt so that you can choose
the branch you want to switch to.

[source](https://github.com/junegunn/fzf/wiki/examples)

# Turn Off The Output Pager For One Command

With `git` a pager, such as `less`, can be configured to display paginated
command output. There are many ways to set up the default pager such as setting
the `core.pager` value in your git-config or by setting the `$PAGER` env var.

Assuming it is set to something like `less`, you can view, scroll through, and
search the output of a command like `git log` or `git diff`. When you're
finished the pager will close, all the output will vanish, and you'll be back
at your terminal prompt.

This is generally a desirable workflow. If, however, you want to be able to
scroll back in your terminal history to reference a SHA or a commit message,
you'll be disappointed.

For one off commands where you know you'll want the output actually printed to
the terminal, you can turn off the pager with the `--no-pager` flag (or `-P` as
a shorthand).

```bash
$ git --no-pager show
```

This will print the details of the HEAD commit to the terminal. I can scroll
back and reference them as needed.

[source](https://stackoverflow.com/questions/2183900/how-do-i-prevent-git-diff-from-using-a-pager#:~:text=17%20Answers&text=%2D%2Dno%2Dpager%20to%20Git,fits%20in%20a%20single%20screen.&text=As%20a%20previous%20answer%20mentioned,is%20less%20than%20one%20screen.)

# Two Kinds Of Dotted Range Notation

There are two kinds of dotted range notation in git -- `..` and `...`.

If you'd like to view all changes on your current feature branch since checking
out from `master`, you can use the two-dot notation:

```bash
❯ git log master..some-feature-branch --oneline
9e50bff (some-feature-branch) Add second feature change
b11bb0b Add first feature change
```

You could also switch the refs around to see what has changed on master since
checking out:

```bash
❯ git log some-feature-branch..master --oneline
c2880f8 (HEAD -> master) Add description to README
```

Then there is the three-dot notation. This will include all commits from the
second ref that aren't in the first and all commits in the first that aren't in
the second.

```bash
❯ git log master...some-feature-branch --oneline
c2880f8 (HEAD -> master) Add description to README
9e50bff (some-feature-branch) Add second feature change
b11bb0b Add first feature change
```

See `man git-rev-parse` for more details.

[source](https://stackoverflow.com/a/24186641/535590)

# Unstage Changes With Git Restore

Git 2.23 introduced the `restore` command which is a more direct alternative to
`checkout` and `reset` for restoring the state of the working tree and the
index (staging area).

With the `--staged` flag, we can unstage changes, moving them from the index to
the working tree.

> To restore a file in the index to match the version in HEAD (this is the same
> as using git-reset(1))

```
$ git restore --staged README.md
```

Staged changes to `README.md` will be removed from the index and put on the
working tree.

```
$ git restore --staged .
```

That will unstage all changes on the index.

This is now recommended by Git when you run `git status`:

> (use "git restore --staged <file>..." to unstage)

See `man git-restore` for more details.

# Untrack A Directory Of Files Without Deleting

In [Untrack A File Without Deleting It](untrack-a-file-without-deleting-it.md),
I explained how a specific file can be removed from tracking without
actually deleting the file from the local file system. The same can be done
for a directory of files that you don't want tracked. Just use the `-r`
flag:

```bash
$ git rm --cached -r <directory>
```

[source](http://stackoverflow.com/questions/1143796/remove-a-file-from-a-git-repository-without-deleting-it-from-the-local-filesyste)

# Untrack A File Without Deleting It

Generally when I invoke `git rm <filename>`, I do so with the intention of
removing a file from the project entirely. `git-rm` does exactly that,
removing the file both from the index and from the working tree.

If you want to untrack a file (remove it from the index), but still have it
available locally (in the working tree), then you are going to want to use
the `--cached` flag.

```bash
$ git rm --cached <filename>
```

If you do this, you may also consider adding that file to the `.gitignore`
file.

[source](http://stackoverflow.com/questions/15027873/untrack-and-stop-tracking-files-in-git)

# Update The URL Of A Remote

I just changed the name of a Github repository. One of the implications of
this is that the remote URL that my local git repository has on record is
now out of date. I need to update it.

If I use `git-remote` with the `-v` flag. I can see what remotes I currently
have.

```bash
$ git remote -v
origin  git@github.com:jbranchaud/pokemon.git (fetch)
origin  git@github.com:jbranchaud/pokemon.git (push)
```

Now, to update the URL for that remote, I can use `git remote set-url`
specifying the name of the remote and the updated URL.

```bash
$ git remote set-url origin git@github.com:jbranchaud/pokemon_deluxe.git
```

If I check again, I can see it has been updated accordingly.

```bash
$ git remote -v
origin  git@github.com:jbranchaud/pokemon_deluxe.git (fetch)
origin  git@github.com:jbranchaud/pokemon_deluxe.git (push)
```

# Using Commands With A Relative Date Format

If you want to know what changed on a branch _since_ last week, you can more or
less ask just like that:

```bash
$ git log --since="1 week ago"
```

Or, what has happened since yesterday:

```bash
$ git log --after="yesterday"
```

The `--since`/`--after` flags, and their counterparts `--until`/`--before`,
accept a variety of date formats including _relative dates_.

Relative dates can be used with other commands and even as a ref modifier. For
instance, this is a way of comparing `develop` from a week ago with `develop`
from two weeks ago:

```bash
$ git diff develop@{"1 week ago"} develop@{"2 weeks ago"}
```

[source](https://alexpeattie.com/blog/working-with-dates-in-git)

# Verbose Commit Message

Git allows you to display a *diff* of the staged changes in the commit
message buffer. This gives you the opportunity to carefully craft your
commit message in a way that accurately describes the changes being
committed. To display the diff when committing:

```bash
$ git commit -v
```

# Viewing A File On Another Branch

Sometimes you want to view a file on another branch (without switching
branches). That is, you want to view the version of that file as it exists
on that branch. `git show` can help. If your branch is named `my_feature` and
the file you want to see is `app/models/users.rb`, then your command should
look like this:

```
$ git show my_feature:app/models/users.rb
```

You can even tab-complete the filename as you type it out.

See `man git-show` for more details.

[source](http://stackoverflow.com/questions/7856416/view-a-file-in-a-different-git-branch-without-changing-branches)

# What Changed?

If you want to know what has changed at each commit in your Git history,
then just ask `git whatchanged`.

```bash
$ git whatchanged

commit ddc929c03f5d629af6e725b690f1a4d2804bc2e5
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sun Feb 12 14:04:12 2017 -0600

    Add the source to the latest til

:100644 100644 f6e7638... 2b192e1... M  elixir/compute-md5-digest-of-a-string.md

commit 65ecb9f01876bb1a7c2530c0df888f45f5a11cbb
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat Feb 11 18:34:25 2017 -0600

    Add Compute md5 Digest Of A String as an Elixir til

:100644 100644 5af3ca2... 7e4794f... M  README.md
:000000 100644 0000000... f6e7638... A  elixir/compute-md5-digest-of-a-string.md

...
```

This is an old command that is mostly equivalent to `git-log`. In fact, the
man page for `git-whatchanged` says:

> New users are encouraged to use git-log(1) instead.

The difference is that `git-whatchanged` shows you the changed files in
their raw format which can be useful if you know what you are looking for.

See `man git-whatchanged` for more details.

# What Is The Current Branch?

This question can be answered with one of git's plumbing commands,
`rev-parse`.

```
$ git rev-parse --abbrev-ref HEAD
```

The `--abbrev-ref` flag tells `git-rev-parse` to give us the short name for
`HEAD` instead of the SHA.

[source](http://stackoverflow.com/a/12142066/535590)

# Whitespace Warnings

You can configure git to warn you about whitespace issues in a file when you
diff it. This is handled by the `core.whitespace` configuration. Add the
following to your `.gitconfig` file:

```
[core]
      whitespace = warn
```

By default, git will warn you of trailing whitespace at the end of a line as
well as blank lines at the end of a file.

