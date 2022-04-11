### Category sed

---

 - [Apply Multiple Substitutions To The Input](#apply-multiple-substitutions-to-the-input)
 - [Equivalence Classes Of Repetition MetaChars](#equivalence-classes-of-repetition-metachars)
 - [Extract Value From Command Output With Sed](#extract-value-from-command-output-with-sed)
 - [Grab All The Method Names Defined In A Ruby File](#grab-all-the-method-names-defined-in-a-ruby-file)
 - [Grab The First Line Of A File](#grab-the-first-line-of-a-file)
 - [OSX sed Does Regex A Bit Different](#osx-sed-does-regex-a-bit-different)
 - [Output Only Lines Involved In A Substitution](#output-only-lines-involved-in-a-substitution)
 - [Reference A Capture In The Regex](#reference-a-capture-in-the-regex)
 - [Use An Alternative Delimiter In A Substitution](#use-an-alternative-delimiter-in-a-substitution)

---

# Apply Multiple Substitutions To The Input

You can apply multiple substitutions to the input of a `sed` command a couple
ways.

One of those ways is to use the `-e` flag multiple times to define
substitutions that should be _appended_ to the `sed` script.

```bash
$ echo 123 | sed -e 's/3/three/' -e 's/1/one/'
one2three
```

Another way is to define a single string as the `sed` script and separate each
substitution with a `;` (semicolon).

```bash
$ echo 123 | sed 's/3/three/; s/1/one/'
one2three
```

Each of these will run each substitution in the `sed` script sequentially for
each line in the input.

# Equivalence Classes Of Repetition MetaChars

There are two types of Repetition MetaChars. The simple ones are `*`, `+`, and
`?`. The general ones are ranges specified inside `{` and `}`. Here are
equivalence classes between these two sets.

_These use the -E (extended regex) option for OSX's `sed`._

1. `*` is equivalent to `{0,}`

_Zero or more of the preceeding character._

```bash
$ echo 'abc123' | sed -E 's/[[:alpha:]]*/!/'
!123

$ echo 'abc123' | sed -E 's/[[:alpha:]]{0,}/!/'
!123
```

2. `+` is equivalent to `{1,}`

_One or more of the preceeding character._

```bash
$ echo 'fix   the spacing' | sed -E 's/[ ]+/ /g'
fix the spacing

$ echo 'fix   the spacing' | sed -E 's/[ ]{1,}/ /g'
fix the spacing
```

3. `?` is equivalent to `{0,1}`

_Exactly zero or one of the preceeding character._

```bash
$ echo '#1, 2, 1oz' | sed -E 's/#?1/ONE/g'
ONE, 2, ONEoz

$ echo '#1, 2, 1oz' | sed -E 's/#{0,1}1/ONE/g'
ONE, 2, ONEoz
```

[source](https://www.goodreads.com/book/show/19407377-definitive-guide-to-sed)

# Extract Value From Command Output With Sed

As part of a shell script, you may need to extract a value from one command to
be used as part of a subsequent command.

For instance, [I recently wrote a
script](https://gist.github.com/jbranchaud/3cda6be6e1dc69c6f55435a387018dac)
that needed to determine the version of the currently running Postges server.
The `postgres` command can tell me that.

```bash
$ postgres -V
postgres (PostgreSQL) 12.3
```

However, the output includes extra fluff that I don't need, namely the leading
`postgres (PostgreSQL) ` part.

The output of `postgres` can be piped into a `sed` command that can extract
just what I need.

```bash
$ postgres -V | sed -n 's/postgres (PostgreSQL) \(.*\)/\1/p'
12.3
```

The `sed` command receives this single line of output and attempts a
substituation. It matches on `postgres (PostgresSQL) ` followed by a capture
group (`\(.*\)`) for the remaining characters. This capture group matches the
version part of the output. `sed` replaces everything in the first part of the
substitution with `\1`, which is `12.3`, and outputs that.

The output of this could then be piped to another command or captured in a
variable to be used in the remainder of a script.

[source](https://stackoverflow.com/a/24572880/535590)

# Grab All The Method Names Defined In A Ruby File

I wanted a listing of all the methods defined in a Ruby file. Metaprogramming
aside, I figured I could write a one-line `sed` script to effectively do this.

```bash
$ sed -n 's/[[:space:]]*def \([[:alnum:]_?!]*\).*/\1/p' file.rb
```

Let's break this down.

- `[[:space:]]*` accounts for any level of indentation.
- `def ` matches againts the start of a method definition.
- `\(...\)` is a capture that can be referenced in the replace side of the
  script.
- `[[:alnum:]_?!]*` represents the characters that can make up a Ruby method
  name, this is equivalent to writing `[a-zA-Z0-9_?!]*`.
- `.*` is the final part of the regex match which ensures the rest of the line
  is loaded into the pattern space so that the replacement will only be the
  method name.
- `\1` replaces everything in the first part of the script with the capture
  which is just the method name.
- combining the `-n` and `p` flags ensures that only lines with substitutions
  are printed.

This probably isn't perfect, but it is good enough to reference from time to
time in my shell history.

# Grab The First Line Of A File

You can grab the first line of a file with `sed` using either the `p` (print)
command or the `d` (delete) command.

First, the _print_ command can be told to print the line matching the line
number `1`. That combined with the `-n` flag, which suppresses all lines not
explicitly printed, will print just the first line in the file.

```bash
$ sed '1 p' README.md
# TIL
```

Second, the _delete_ command can be told to delete all lines that aren't the
first (`1`) line.

```bash
$ sed '1! d' README.md
# TIL
```

The `1` will match on the first line. By following it with `!`, that will
negate it so that it represents all lines except `1`.

See `man sed` for more details.

Note: there are more efficient ways, not using `sed`, to get the first line in
a file. This is an exercise in using and understanding some `sed` features.

# OSX sed Does Regex A Bit Different

With GNU sed, `\+`, `\?`, `\(...\)` and friends are considered extended regex
characters. You can use them directly with the preceding backslashes. Or you
can include the `-r` flag to turn on extended regex and use them without.

```bash
$ echo '11+1 = 12' | sed 's/1+/3/'
131 = 12
$ echo '11+1 = 12' | sed -r 's/1+/3/'
3+1 = 12
```

With OSX sed, `\+`, `\?`, and `\|` are not interpreted as part of the basic
regex. To use them at all you need to include `-E` to turn on extended regex.
The capture characters (`\(...\)`) are available with basic regex.

```bash
# Basic, always treated as literal +
$ echo '11+1 = 12' | sed 's/1+/3/'
131 = 12
$ echo '11+1 = 12' | sed 's/1\+/3/'
131 = 12

# Extended, + is now a meta-character
$ echo '11+1 = 12' | sed -E 's/1+/3/'
3+1 = 12
$ echo '11+1 = 12' | sed -E 's/1\+/3/'
131 = 12
```

[source](https://unix.stackexchange.com/a/131940/5916)

# Output Only Lines Involved In A Substitution

When you run a basic `sed` command, it will _autoprint_ the pattern space (a
line of input) once it is done running the script against it. That means every
line will get sent to stdout.

You can supress the autoprint functionality with the `-n` flag like so:

```bash
$ seq 100 | sed -n 's/1$/one/'
```

You can then add the `p` flag to the end of the substitute command to tell it
to _print_ any line that was affected by that substitution after the
substitution has been applied.

```bash
$ seq 100 | sed -n 's/1$/one/p'
one
1one
2one
3one
4one
5one
6one
7one
8one
9one
```

For all numbers between 1 and 100, this matches those that end in `1` and
substitutes that `1` for `one`. And then it is only those lines that go to
stdout.

If you used the `p` flag without `-n`, every line would autoprint and then
you'd get duplicate output for each line that had a substitution.

See `man sed` for more details.

# Reference A Capture In The Regex

You create a capture group in a `sed` regex by wrapping a pattern in `\(` and
`\)`. Generally, this capture group is referenced in the substitution
expression with `\1`.

The capture references (e.g. `\1`) can also be used in the regex as part of
specifying the match.

For instance, we can do a capture of a single digit followed by a reference to
that capture. That will match any line that has a pair of matching consecutive
digits.

```bash
$ seq 111 | sed -n 's/\([[:digit:]]\)\1/&/p'
11
22
33
44
55
66
77
88
99
100
110
111
```

This also uses `&` in the subex which represents the entire match. The `-n` and
`/p` combination suppresses printing of lines to only those that have
substitutions.

# Use An Alternative Delimiter In A Substitution

A pretty standard sed substitution command is going to use `/` (the forward
slash) as the delimiter. The delimiter separates the different parts of the
command.

```bash
$ sed 's/critter/creature/' animals.txt
```

The first delimiter marks the beginning of the regular express to be replaced.
That expression is everything up to the next delimiter. Then the substute
expression starts up until the next delimiter.

There is nothing special about the `/` as the delimiter, it just happens to be
the most commonly used character.

In fact, any visible character can be used as the delimiter with sed.

Some other common ones are `:`, `|`, and `_`. I like how the `pipe` character
looks.

```bash
$ sed 's|critter|creature|' animals.txt
```

But like I said, any visible character will work. If you wanted, you could use
`Q` though that'll look strange and could cause some confusion when reading
through your script.

```bash
$ sed 'sQcritterQcreatureQ' animals.txt
```

