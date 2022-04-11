### Category yaml

---

 - [Create Multi-Line Strings Without The Line Breaks](#create-multi-line-strings-without-the-line-breaks)
 - [YAML Is A Superset Of JSON](#yaml-is-a-superset-of-json)

---

# Create Multi-Line Strings Without The Line Breaks

There are [many ways](https://stackoverflow.com/a/21699210/535590) to add
multi-line strings to a YAML document. Most of them preserve the literal
newlines present in the multi-line string. And generally that is what you want
in a multi-line string.

Sometimes, however, you want a multi-line string just for its readability in
the file. The literal representation of the string should exclude the newlines.
To achieve this, you can use either `>-` or `|-`.

```yaml
run: >-
  echo "::set-output name=NODE_VERSION::$(
    cat .tool-versions
    | grep nodejs
    | sed 's/nodejs \(.*\)$/\1/'
  )"
```

This creates a readable key-value pair without introducing newline characters
into the string that represents a shell command.

# YAML Is A Superset Of JSON

Put another way, JSON is a subset of YAML.

Here is what the YAML spec has to say:

> YAML can therefore be viewed as a natural superset of JSON, offering improved
> human readability and a more complete information model. This is also the
> case in practice; every JSON file is also a valid YAML file.

We can _see_ this in practice by using our favorite YAML parse to read a JSON
file. For me that is Ruby and its built-in YAML library.

First, consider the following JSON file (`data.json`):

```json
{
  "data": [
    "one",
    "two",
    "three"
  ],
  "number": 22
}
```

Now, I'll open up an IRB session (Ruby's interactive REPL) and read it in.

```ruby
> require 'yaml'
=> true
> YAML.load_file('data.json')
=> {"data"=>["one", "two", "three"], "number"=>22}
```

It works. And for me, having not considered those two format related, this
isn't something I would have expected to work.

[source](http://yaml.org/spec/1.2/spec.html#id2759572)

