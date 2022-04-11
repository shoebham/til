### Category linux

---

 - [Check Ubuntu Version](#check-ubuntu-version)
 - [Configure Your Server Timezone](#configure-your-server-timezone)
 - [List The Statuses Of All Upstart Jobs](#list-the-statuses-of-all-upstart-jobs)
 - [Show Current System Time And Settings](#show-current-system-time-and-settings)
 - [Upgrading Ubuntu](#upgrading-ubuntu)

---

# Check Ubuntu Version

Are you on Ubuntu? Want to know what version (release) of Ubuntu you are
using?

Run the following to find out:

```bash
$ lsb_release -r
```

# Configure Your Server Timezone

On Ubuntu and Debian, you can open an interactive prompt for configuring
your timezone with the following command:

```bash
$ dpkg-reconfigure tzdata
```

# List The Statuses Of All Upstart Jobs

To see a list of all known upstart jobs and their statuses, use the
following command:

```bash
$ initctl list
...
console stop/waiting
mounted-run stop/waiting
acpid start/running, process 2927
checkfs.sh start/running
checkroot-bootclean.sh start/running
kmod stop/waiting
mountnfs.sh start/running
nginx stop/waiting
plymouth-stop stop/waiting
rcS stop/waiting
ufw start/running
...
```

It will tell you for each job if it is stopped or started.

See `man initctl` for more details.

h/t Josh Davey

# Show Current System Time And Settings

If you are accessing a remote server and viewing logs, you may want to know
what the current system time is. The `timedatectl` command can show the
current system date, time, and related settings.

```bash
$ timedatectl
       Local time: Di 2015-04-07 16:26:56 CEST
   Universal time: Di 2015-04-07 14:26:56 UTC
         RTC time: Di 2015-04-07 14:26:56
        Time zone: Europe/Berlin (CEST, +0200)
  Network time on: yes
 NTP synchronized: yes
  RTC in local TZ: no
```

This command can also be used to modify these settings.

[source](http://man7.org/linux/man-pages/man1/timedatectl.1.html)

# Upgrading Ubuntu

I recently discovered that my Linode box was running a fairly old version of
Ubuntu. Because it is a remote box that I SSH into, there is no graphical
user interface. Upgrading to a newer release can be accomplished with the
following command line utility:

```
$ do-release-upgrade
```

It includes a series of prompts regarding choices about the upgrade and a
lot of waiting.

Adding the `-d` flag will upgrade to the latest development release.

