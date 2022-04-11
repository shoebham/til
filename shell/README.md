### Category shell

---

 - [Check If The First Argument Is Given](#check-if-the-first-argument-is-given)
 - [Format And Print The Current Date And Time](#format-and-print-the-current-date-and-time)

---

# Check If The First Argument Is Given

In a shell script, you may want to check if an argument was given. Each
argument is referenced numerically with the `$` prefix, so the first argument
is `$1`. To check if the first argument is given, you can use the `-z` check.

```bash
if [ -z "$1" ]
  then
    echo "The first argument is missing"
    exit 1
fi
```

The `-z` checks if the argument is a zero-length string (so `""` or undefined
will be true). If it is missing, then we echo out a message and exit the
script. This is how I might fashion a script that requires the first argument.

[source](https://stackoverflow.com/questions/6482377/check-existence-of-input-argument-in-a-bash-shell-script)

# Format And Print The Current Date And Time

If I run the `date` command from the terminal, I get output like the following:

```bash
$ date
Fri Jan 22 13:45:44 CST 2021
```

If I want to format the date output different, perhaps for inclusion in a shell
script, I can do something like this:

```bash
$ date +"%Y/%m/%d %H:%M:%S"
2021/01/22 13:47:55
```

Then I can incorporate that in a script like this:

```bash
now() {
  echo "Today: $(date +'%Y/%m/%d %H:%M:%S')"
}
```

This
[page](https://www.tutorialkart.com/bash-shell-scripting/bash-date-format-options-examples/)
includes some examples and a page of formatting options.

