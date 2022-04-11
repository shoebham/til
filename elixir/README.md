### Category elixir

---

 - [All Values For A Key In A Keyword List](#all-values-for-a-key-in-a-keyword-list)
 - [Append To A Keyword List](#append-to-a-keyword-list)
 - [Assert An Exception Is Raised](#assert-an-exception-is-raised)
 - [Binary Representation Of A String](#binary-representation-of-a-string)
 - [Check For A Substring Match](#check-for-a-substring-match)
 - [Check List Membership](#check-list-membership)
 - [Comparing DateTime Structs](#comparing-datetime-structs)
 - [Compute Intermediate Values In A With Construct](#compute-intermediate-values-in-a-with-construct)
 - [Compute md5 Digest Of A String](#compute-md5-digest-of-a-string)
 - [Counting Records With Ecto](#counting-records-with-ecto)
 - [Create A Date With The Date Sigil](#create-a-date-with-the-date-sigil)
 - [Create A List Of Atoms](#create-a-list-of-atoms)
 - [Creating A PID](#creating-a-pid)
 - [Creating Indexes With Ecto](#creating-indexes-with-ecto)
 - [Defining Multiple Clauses In An Anonymous Function](#defining-multiple-clauses-in-an-anonymous-function)
 - [Determine The Latest Release Of A Hex Package](#determine-the-latest-release-of-a-hex-package)
 - [Do You Have The Time?](#do-you-have-the-time?)
 - [Do You Have The Time? - Part 2](#do-you-have-the-time?---part-2)
 - [Documentation Lookup With Vim And Alchemist](#documentation-lookup-with-vim-and-alchemist)
 - [Dynamically Generating Atoms](#dynamically-generating-atoms)
 - [Execute Raw SQL In An Ecto Migration](#execute-raw-sql-in-an-ecto-migration)
 - [Expose Internal Representation](#expose-internal-representation)
 - [Include Captures With String.split](#include-captures-with-string.split)
 - [Inspecting The Process Message Queue](#inspecting-the-process-message-queue)
 - [List Functions For A Module](#list-functions-for-a-module)
 - [Listing Files In IEx](#listing-files-in-iex)
 - [Match On A Map In A With Construct](#match-on-a-map-in-a-with-construct)
 - [Passing Around And Using Modules](#passing-around-and-using-modules)
 - [Pattern Matching In Anonymous Functions](#pattern-matching-in-anonymous-functions)
 - [Pipe Into A Case Statement](#pipe-into-a-case-statement)
 - [Quitting IEx](#quitting-iex)
 - [Range Into List Using Comprehensions](#range-into-list-using-comprehensions)
 - [Refer To A Module Within Itself](#refer-to-a-module-within-itself)
 - [Referencing Values In IEx's History](#referencing-values-in-iex's-history)
 - [Remove One List From Another](#remove-one-list-from-another)
 - [Replace Duplicates In A Keyword List](#replace-duplicates-in-a-keyword-list)
 - [Requiring Keys For Structs](#requiring-keys-for-structs)
 - [Reversing A List](#reversing-a-list)
 - [Reversing A List - Part 2](#reversing-a-list---part-2)
 - [Root Directory Of A Project](#root-directory-of-a-project)
 - [Round Floats To Integers](#round-floats-to-integers)
 - [Run ExUnit Tests In A Deterministic Order](#run-exunit-tests-in-a-deterministic-order)
 - [Run The Test At A Specific Line Number](#run-the-test-at-a-specific-line-number)
 - [Same Functions Should Be Grouped Together](#same-functions-should-be-grouped-together)
 - [Skip A Specific Test](#skip-a-specific-test)
 - [String Interpolation With Just About Anything](#string-interpolation-with-just-about-anything)
 - [Unique Indexes With Ecto](#unique-indexes-with-ecto)
 - [Updating Values In A Map](#updating-values-in-a-map)
 - [Using When Clauses In A With Construct](#using-when-clauses-in-a-with-construct)
 - [Virtual Fields With Ecto Schemas](#virtual-fields-with-ecto-schemas)
 - [When Things Don't Match The With Statements](#when-things-don't-match-the-with-statements)
 - [Word Lists For Atoms](#word-lists-for-atoms)

---

# All Values For A Key In A Keyword List

A keyword list in Elixir can contain the same key multiple times.

```elixir
kwl = [a: 1, b: 2, a: 3, c: 4]
#=> [a: 1, b: 2, a: 3, c: 4]
```

The `get/2` function will only grab the value of the first occurrence.

```elixir
Keyword.get(kwl, :a)
#=> 1
```

You can use `get_values/2` to retrieve _all_ values associated with the key.

```elixir
Keyword.get_values(kwl, :a)
#=> [1, 3]
```

# Append To A Keyword List

If you have two keyword lists, you can append them like so:

```elixir
> a = [a: 1]
[a: 1]
> b = [b: 2]
[b: 2]
> a ++ b
[a: 1, b: 2]
```

But what if something a bit more programmatic is happening and you are
building up the additions to the keyword list based on variables?

```elixir
> x = :x
:x
> c = a ++ [x 5]
** (CompileError) iex:5: undefined function x/1
    (stdlib) lists.erl:1353: :lists.mapfoldl/3
    (stdlib) lists.erl:1354: :lists.mapfoldl/3
```

That makes elixir think `x` is some function when in fact it is just a
variable containing the keyword `:x`.

Simply adding a comma doesn't quite do it either.

```elixir
> c = a ++ [x, 5]
[{:a, 1}, :x, 5]
```

We need to wrap the internal part with curly braces to create the tuple that
can then be appended to `a`.

```elixir
> c = a ++ [{x, 5}]
[a: 1, x: 5]
```

# Assert An Exception Is Raised

Elixir's [`ExUnit`](http://elixir-lang.org/docs.html) comes with a number of
different ways to make assertions in your tests. One of those functions is
[`assert_raise`](http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#assert_raise/2)
which allows you to test that a particular exception is raised when the
given function is invoked.

Using `assert_raise/2` looks something like this:

```elixir
assert_raise FunctionClauseError, fn ->
  Enum.chunk([1,2,3], 0)
end
```

The `assert_raise/3` form is also available which allows you to test both
the type of exception and the resulting message.

```elixir
assert_raise FunctionClauseError, ~r/^no function clause matching/, fn ->
  Enum.chunk([1,2,3], 0)
end
```

Using the regex sigil for the second argument is generally a good way to go
to keep tests from getting too brittle.

# Binary Representation Of A String

> A common trick in Elixir is to concatenate the null byte <<0>> to a string
> to see its inner binary representation.

A couple example of this can be seen in the following snippet of code:

```elixir
> "hello" <> <<0>>
<<104, 101, 108, 108, 111, 0>>
> "ƒå®øü†" <> <<0>>
<<198, 146, 195, 165, 194, 174, 195, 184, 195, 188, 226, 128, 160, 0>>
```

[source](http://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html)

# Check For A Substring Match

Using Erlang's `:binary.match` function, you can easily check if a string
has a matching substring.

```elixir
> :binary.match("all food is good", "foo")
{4, 3}
> :binary.match("all food is good", "bar")
:nomatch
```

As you can see, the return value on a successful match is a tuple with the
index of where the match starts and the length of the match. If there is no
match, the `:nomatch` atom is returned.

See the [`match/2` and `match/3`
docs](http://erlang.org/doc/man/binary.html#match-2) for more details.

[source](http://stackoverflow.com/questions/35551072/how-to-find-index-of-a-substring)

# Check List Membership

You can use the [`in` operator](https://hexdocs.pm/elixir/operators.html) to
check if something appears in a list. This is a handy way of checking if a
variable is one of a few acceptable or expected values.

For instance, a common DateTime comparison pattern relies on this to check
if a DateTime is `>=` or `<=` to another DateTime.

```elixir
{:ok, datetime} = DateTime.from_naive(~N[2016-05-24 13:26:08.003], "Etc/UTC")

DateTime.compare(datetime, DateTime.utc_now()) in [:lt, :eq]
```

Alternatively, you can check that something does not have membership in a
list by also including the `not` operator.

```elixir
DateTime.compare(datetime, DateTime.utc_now()) not in [:lt, :eq]
```

# Comparing DateTime Structs

> Remember, comparisons in Elixir using ==/2, >/2, </2 and friends are
> structural and based on the DateTime struct fields. For proper comparison
> between datetimes, use the compare/2 function.

As the [DateTime docs](https://hexdocs.pm/elixir/DateTime.html) say, you'll
want to use [`compare/2`](https://hexdocs.pm/elixir/DateTime.html#compare/2)
in order to accurately compare two `DateTime` structs.

```elixir
{:ok, older} = DateTime.from_naive(~N[2016-05-24 13:26:08.003], "Etc/UTC")
{:ok, newer} = DateTime.from_naive(~N[2017-11-24 13:26:08.003], "Etc/UTC")

DateTime.compare(older, newer)
#=> :lt

DateTime.compare(newer, older)
#=> :gt

DateTime.compare(newer, newer)
#=> :eq
```

When using `compare/2`, you'll get one of `:lt`, `:gt`, or `:eq` as a
result, meaning _less than_, _greater than_, or _equal_ respectively.

# Compute Intermediate Values In A With Construct

The expressions you use in a `with` construct do not have to contain the
`<-` syntax. You can pattern match and bind values along the way as well.

```elixir
with %{id: id} <- get_user(),
     url = "/api/#{id}/blogs",
     %{status_code: 200, body: body} <- HTTPoison.get(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
end
```

In the above (sorta contrived) example we were able to construct a URL in
the middle of the series of expressions.

The values we compute inline will be closed into the `with` construct, so
they won't leak.

See the [`with`
docs](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1) for more
details.

# Compute md5 Digest Of A String

To compute the md5 digest of a string, we can use Erlang's top-level `md5`
function.

```elixir
> :erlang.md5("#myelixirstatus")
<<145, 148, 139, 99, 194, 176, 105, 18, 242, 246, 37, 69, 142, 69, 226, 199>>
```

This, however, gives us the result in the raw binary representation. We
would like it in a base 16 encoding, as md5 digests tend to be.

We can wrap (or pipe) this with `Base.encode16` to get the result we are
looking for.

```elixir
> Base.encode16(:erlang.md5("#myelixirstatus"), case: :lower)
"91948b63c2b06912f2f625458e45e2c7"
```

[source](https://gist.github.com/10nin/5713366#gistcomment-1445219)

# Counting Records With Ecto

Sometimes you want to know how many records there are in a table. Ecto gives
us a couple ways to approach this.

We can use the
[`count\1`](https://hexdocs.pm/ecto/Ecto.Query.API.html#count/1) function
that the Ecto query API provides.

```elixir
> Repo.one(from p in "people", select: count(p.id))

16:09:52.759 [debug] QUERY OK source="people" db=1.6ms
SELECT count(p0."id") FROM "people" AS p0 []
168
```

Alternatively, we can use the
[`fragment/1`](https://hexdocs.pm/ecto/Ecto.Query.API.html#fragment/1)
function to use PostgreSQL's `count` function.

```elixir
> Repo.one(from p in "people", select: fragment("count(*)"))

16:11:19.818 [debug] QUERY OK source="people" db=1.5ms
SELECT count(*) FROM "people" AS p0 []
168
```

Lastly, `Ecto.Repo` has the
[`aggregate/4`](https://hexdocs.pm/ecto/Ecto.Repo.html#c:aggregate/4)
function which provides a `:count` option.

```elixir
> Repo.aggregate(from(p in "people"), :count, :id)

16:11:23.786 [debug] QUERY OK source="people" db=1.7ms
SELECT count(p0."id") FROM "people" AS p0 []
168
```

# Create A Date With The Date Sigil

Elixir 1.3 introduced a new sigil for creating dates, `~D`. It works in the
same way as Date's
[`new/3`](http://elixir-lang.org/docs/stable/elixir/Date.html#new/3)
function producing the Date struct with each of the date parts.

```elixir
> ~D[2016-01-01]
~D[2016-01-01]
> ~D[2016-01-01].year
2016
> ~D[2016-01-01].month
1
> ~D[2016-01-01].day
1
```

# Create A List Of Atoms

The `~w` sigil makes it easy to create a word list -- a list of strings --
where each word is separated by a space.

```elixir
> ~w(bulbasaur charmander squirtle)
["bulbasaur", "charmander", "squirtle"]
```

By appending an `a` onto that sigil construct, you are instructing Elixir
that you would instead like a list of atoms.

```elixir
> ~w(bulbasaur charmander squirtle)a
[:bulbasaur, :charmander, :squirtle]
```

[source](http://elixir-lang.org/getting-started/sigils.html#strings)

# Creating A PID

Often times, when invoking a function that spawns a process, the PID of the
spawned process is returned and we bind to it. That PID is a reference to
some BEAM process in our system.

We can create our own references using the `pid/3` function.

Let's assume we have the following processes, among others, in our system at
the moment.

```elixir
> Process.list |> Enum.reverse |> Enum.take(3)
[#PID<0.284.0>, #PID<0.283.0>, #PID<0.282.0>]
```

We can create a reference to any of them using the three number parts that
they are made up of.

```elixir
> pid(0, 284, 0)
#PID<0.284.0>
```

See, it's alive.

```elixir
> pid(0, 284, 0) |> Process.alive?
true
```

What if we make up a PID that doesn't actually reference any process?

```elixir
> pid(0, 333, 0) |> Process.alive?
false
```

Note: there is also a `pid/1` version of the function. See `h pid` for more
details.

# Creating Indexes With Ecto

Using indexes in the right places within relational databases is a great way
to speed up queries.

To add a basic index in an Ecto migration, use `Ecto.Migration.index\2`:

```elixir
create index(:users, [:email])
```

Creating a composite index doesn't require jumping through any hoops; just
put the relevant column names in the list:

```elixir
create index(:posts, [:user_id, :title])
```

See `h Ecto.Migration.index` for more details.

# Defining Multiple Clauses In An Anonymous Function

Anonymous functions often take the approach of doing a single thing with the
inputs, regardless of their shape or values. There is no need to limit
ourselves though. The same pattern matching that we use all over our Elixir
programs can be utilized to define multiple clauses in an anonymous function
as well.

Consider the following example:

```elixir
iex> my_function = fn
  {:ok, x} -> "Everything is ok: #{x}"
  {:error, x} -> "There was an error: #{x}"
end
#Function<6.52032458/1 in :erl_eval.expr/5>
```

We can then invoke our anonymous function using the bound variable to see
what results we get with different kinds of inputs.

```elixir
iex> my_function.({:ok, 123})
"Everything is ok: 123"
iex> my_function.({:error, "be warned"})
"There was an error: be warned"
```

[source](http://stackoverflow.com/a/18023790/535590)

# Determine The Latest Release Of A Hex Package

I will often pop open the browser and do a Google search in order to figure
out the latest release of a package when adding it to my dependencies.
However, lately I've been getting in the habit of using a quicker approach.
The `mix` CLI has a way of looking up info about a package and we don't have
to leave the terminal to use it.

For instance, if I need to determine the latest version of the `postgrex`
package, I can run the following command.

```bash
$ mix hex.info postgrex
PostgreSQL driver for Elixir.

Config: {:postgrex, "~> 0.12.0"}
Releases: 0.12.0, 0.11.2, 0.11.1, 0.11.0, 0.10.0, 0.9.1, 0.9.0, 0.8.4, 0.8.3, 0.8.2, ...

Maintainers: Eric Meadows-Jönsson, James Fish
Licenses: Apache 2.0
Links:
  Github: https://github.com/elixir-ecto/postgrex
```

The third line gives me the info I need (`{:postgrex, "~> 0.12.0"}`) and it
is already formatted as a tuple that I can paste right into my `mix.exs`
file.

# Do You Have The Time?

Elixir doesn't come with any standard ways of getting at or working with
time. There are packages like [Timex](https://github.com/bitwalker/timex)
out there that we can pull in to our projects. However, if we don't have
need for a full-featured date/time library, we can opt for a simpler
solution.

Erlang can give us the time.

```elixir
defmodule TickTock do
  def current_time do
    {hh,mm,ss} = :erlang.time
    "#{hh}:#{mm}:#{ss}"
  end
end

> TickTock.current_time
"11:47:13"
```

# Do You Have The Time? - Part 2

In [_Do You Have The
Time?_](https://github.com/jbranchaud/til/blob/master/elixir/do-you-have-the-time.md),
I demonstrated a way of using an Erlang function to get at and work with
time in Elixir. As of Elixir 1.3, there is now a [`Time`
module](http://elixir-lang.org/docs/stable/elixir/Time.html) that provides a
sigil and some functions for working with time.

We can use Elixir's `Time` module to simplify the example from the previous
iteration of this TIL:

```elixir
defmodule TickTock do
  def current_time do
    Time.from_erl!(:erlang.time)
    |> Time.to_string
  end
end

> TickTock.current_time
"19:58:12"
```

# Documentation Lookup With Vim And Alchemist

_Which argument position is the accumulator for `Enum.reduce/3`?_

_How does `group_by` work?_

I find myself fairly frequently jumping from vim to Chrome to do Google
searches for Elixir standard lib documentation. It gets the job done, but it
is kinda slow and I'd prefer to avoid the context switch.

With [alchemist.vim](https://github.com/slashmili/alchemist.vim), Elixir
documentation lookup is at your finger tips. Just move the cursor over the
module or function you are curious about and hit `K` (from normal mode).

Curious about `Enum.reduce`? Type it out in your current Vim buffer, move
the cursor over it, and hit `K`.

# Dynamically Generating Atoms

> Atoms are constants where their name is their own value.

The use of atoms like `:ok` and `:error` show up all over the place in
Elixir. These are atoms that tend to be statically defined. Atoms can also
be dynamically defined using string interpolation.

For example, I can generate a handful of atoms by mapping over a range of
integers.

```elixir
> Enum.map(1..5, &(:"some_atom_#{&1}"))
[:some_atom_1, :some_atom_2, :some_atom_3, :some_atom_4, :some_atom_5]
```

# Execute Raw SQL In An Ecto Migration

If you are performing a database migration with
[Ecto](https://hexdocs.pm/ecto/Ecto.html), perhaps the most straightforward
approach is to use Ecto's DSL. However, the DSL may not always be the best
choice. Being able to write raw SQL gives you more control. It will also
enable you to use database features that may not be directly or easily
available through the DSL.

Raw SQL can be included in a Ecto migration with a combination of Elixir's
heredoc syntax and the [`Ecto.Migration#execute/1`
function](https://hexdocs.pm/ecto/Ecto.Migration.html#execute/1). You'll
also need to provide both an `up` and `down` function to ensure that your
migrations are reversible.

```elixir
defmodule MyApp.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def up do
    execute """
      create table posts (
        id serial primary key,
        title varchar not null,
        body varchar not null default '',
        inserted_at timestamptz not null default now(),
        updated_at timestamptz not null default now()
      );
    """
  end

  def down do
    execute "drop table posts;"
  end
end
```

# Expose Internal Representation

Elixir is a language that has strong support for metaprogramming. It
provides easy access to an internal representation of the code in the form
of an Abstract Syntax Tree (AST) using maps and keyword lists. The `quote`
macro is used to expose this internal representation.

```elixir
> quote do: 2 * 2
{:*, [context: Elixir, import: Kernel], [2, 2]}
> quote do: 2 * 2 == 4
{:==, [context: Elixir, import: Kernel],
 [{:*, [context: Elixir, import: Kernel], [2, 2]}, 4]}
```

[source](http://elixir-lang.org/getting-started/meta/quote-and-unquote.html)

# Include Captures With String.split

The
[`String.split/3`](http://elixir-lang.org/docs/stable/elixir/String.html#split/3)
function comes with two options: `trim` and `parts`. However, when using it
with a regex pattern, you gain access to a couple extra options, including
`include_captures`. This is because when used with a regex pattern,
`String.split` just invokes `Regex.split` which comes with extra options
like `include_captures`.

Here is `String.split` in action by itself and with the supported `trim`
option.

```elixir
> String.split("23d", ~r/\d+/)
["", "d"]
> String.split("23d", ~r/\d+/, trim: true)
["d"]
```

Adding in the `include_captures` option, we get a resulting list that
includes the value captured by the splitting regex.

```
> String.split("23d", ~r/\d+/, trim: true, include_captures: true)
["23", "d"]
```

This isn't a documented feature, so it is only supported as long as
`Regex.split` supports it and as long as `String.split` continues to
delegate to `Regex.split`.

h/t Chris Erin

# Inspecting The Process Message Queue

A core tenant of Elixir is message passing between processes. So, if a
process is sent a message, where does that message go? What happens if it
gets sent many messages? The `Process.info/2` function allows us to inspect
the message queue.

First, let's send some messages (to ourself) and then keep an eye on the
length of the message queue as we go.

```elixir
> send self(), {:error, "this is bad"}
{:error, "this is bad"}
> Process.info(self(), :message_queue_len)
{:message_queue_len, 1}
> send self(), {:hello, "world"}
{:hello, "world"}
> Process.info(self(), :message_queue_len)
{:message_queue_len, 2}
```

Now, I am curious what those specific messages are. Let's ask
`Process.info/2` for the messages that are in the message queue.

```elixir
> Process.info(self(), :messages)
{:messages, [error: "this is bad", hello: "world"]}
```

There are a lot of other things that `Process.info/2` can tell us about a
process. See [the Erlang docs for
`process_info`](http://erlang.org/doc/man/erlang.html#process_info-2) for
more details.

# List Functions For A Module

During an `iex` session, I can do a little introspection on modules using
either the
[`__info__/1`](http://elixir-lang.org/docs/stable/elixir/Module.html#__info__/1)
function or Erlang's
[`module_info/0`](http://erlang.org/doc/man/erlang.html#module_info-0)
function. In particular, I can pass `:functions` to either one to get a list
of the functions for that module.

This is what `__info__/1` looks like for the functions of the `List`
module:

```elixir
> List.__info__(:functions)
[delete: 2, delete_at: 2, duplicate: 2, first: 1,
 flatten: 1, flatten: 2, foldl: 3, foldr: 3, insert_at: 3,
 keydelete: 3, keyfind: 3, keyfind: 4, keymember?: 3,
 keyreplace: 4, keysort: 2, keystore: 4, keytake: 3,
 last: 1, replace_at: 3, to_atom: 1, to_existing_atom: 1,
 to_float: 1, to_integer: 1, to_integer: 2, to_string: 1,
 to_tuple: 1, update_at: 3, wrap: 1, zip: 1]
```

[source](http://stackoverflow.com/questions/28664119/in-elixir-is-there-any-way-to-get-a-module-to-list-its-functions)

# Listing Files In IEx

When you start an IEx session, you do so in the context of some directory --
the current working directory. This context can be important if you need to
do something like import a file. In fact, you may want to know what files
are available in the current working directory.

You can list them all out within IEx using `ls/0`.

```elixir
iex(1)> ls()
           .git     .gitignore      README.md         _build         assets         config
           deps            lib        mix.exs       mix.lock           priv           test
            tmp
```

You can also list the contents of some other specific directory by naming it
when invoking `ls/1`.

See `h()` within IEx for more details.

# Match On A Map In A With Construct

Many usage example of the
[`with`](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1)
construct show a series of matches on a tuple.

```elixir
with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, height} <- Map.fetch(opts, :height) do
  {:ok, width * height}
end
```

You can match on more than just tuples though. Here is how you might match
on a map.

```elixir
with %{status_code: 200, body: body} <- HTTPoison.get!(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
end
```

In fact, you have the full power of Elixir's pattern matching available to
you in your series of matches for a `with` construct.

# Passing Around And Using Modules

A module is a bag of functions. When we define a module, we are tying it to
an atom. If we pass around the atom that references this module, then we can
use it to call its functions.

For example, consider two types of greetings:

```elixir
defmodule Hello do
  def get_greeting do
    "Hello, World!"
  end
end

defmodule Hola do
  def get_greeting do
    "Hola, Mundo!"
  end
end
```

And a generic greeting module that accepts a language module:

```elixir
defmodule Greeting do
  def say_hello(language_module) do
    language_module.get_greeting
    |> IO.puts
  end
end

Greeting.say_hello(Hello) # => "Hello, World!"
Greeting.say_hello(Hola) # => "Hola, Mundo!"
```

The module reference that we pass in to `Greeting.say_hello` can be used to
invoke the `get_greeting` function.

# Pattern Matching In Anonymous Functions

Pattern matching shows up everywhere in Elixir, even where you may not be
expecting it. When declaring an anonymous function, you can use pattern
matching against different sets and shapes of input parameters to invoke
different behaviors.

Here is an example of how you might use this:

```elixir
> handle_result = fn
  {:ok, result} -> IO.puts "The result is #{result}"
  :error -> IO.puts "Error: couldn't find anything"
end
#Function<6.50752066/1 in :erl_eval.expr/5>

> Map.fetch(%{a: 1}, :a) |> handle_result.()
The result is 1
:ok
> Map.fetch(%{a: 1}, :b) |> handle_result.()
Error: couldn't find anything
:ok
```

[source](https://elixirschool.com/lessons/basics/functions#pattern-matching)

# Pipe Into A Case Statement

The standard use of a case statement looks something like this:

```elixir
case HTTPoison.get(url) do
  {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    IO.puts body
  {:ok, %HTTPoison.Response{status_code: 404}} ->
    IO.puts "Not found :("
  {:error, %HTTPoison.Error{reason: reason}} ->
    IO.inspect reason
end
```

If you are a fan of the pipe syntax, then you may enjoying writing the above
like this:

```elixir
url
|> HTTPoison.get()
|> case do
  {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    IO.puts body
  {:ok, %HTTPoison.Response{status_code: 404}} ->
    IO.puts "Not found :("
  {:error, %HTTPoison.Error{reason: reason}} ->
    IO.inspect reason
end
```

Just like any function, the value from the previous line in the pipe will be
passed in and used as the value switched over in the case statement.

# Quitting IEx

There are two ways to quit out of an Interactive Elixir shell. The standard
way is with `Ctrl-c`. This gives you a list of options, one of which is `a`
for _abort_. This will terminate your IEx session and drop you back on the
command line where the process started.

Additionally, IEx also understands `Ctrl-\` which is control key that will
terminate just about any interactive environment. This command will cause
IEx to immediately exit with no prompt.

Note: IEx does not, however, respond to `Ctrl-d`.

[source](http://blog.plataformatec.com.br/2016/03/how-to-quit-the-elixir-shell-iex/)

# Range Into List Using Comprehensions

Using an _identity_ comprehension and the `:into` option, we can easily
convert a range into a list.

```elixir
> for x <- 1..10, into: [], do: x
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Check out [the docs for the `:into`
option](http://elixir-lang.org/getting-started/comprehensions.html#the-into-option)
for more details.

# Refer To A Module Within Itself

Elixir comes with the `__MODULE__` reserve word for referencing a module
within itself. This is handy for things like structs.

```elixir
defmodule SomeNamespace.MyModule do
  defstruct [:id]

  def do_thing(%__MODULE__{}=thing) do
    # ...
  end
end
```

You can use an alias in order to ditch `__MODULE__` and perhaps make your
code a bit more human readable.

```elixir
defmodule SomeNamespace.MyModule do
  alias __MODULE__, as: MyModule

  defstruct [:id]

  def do_thing(%MyModule{}=thing) do
    # ...
  end
end
```

# Referencing Values In IEx's History

Each time we execute a statement in an `iex` session, the counter is
incremented. These numbers are references to the history of the session. We
can use these references to _refer_ to previously executed values using
`v/1`. This is particularly handy for multi-line statements or when we
forget to bind to the result of some function.

Consider the following `iex` session:

```elixir
iex(1)> :one
:one
iex(2)> 1 + 1
2
iex(3)> "three" |> String.to_atom()
:three
```

If we execute `v()` on its own, it is the same as `v(-1)` in that it will
give us the latest value in the history.

```elixir
iex(4)> v()
:three
```

Providing any positive number will refer to the references we see next to
each statement.

```elixir
iex(5)> v(1)
:one
```

Negative numbers, as we saw with `v(-1)`, will count backwards in the
history from where we are.

```elixir
iex(6)> v(-4)
2
```

See `h v` for more details.

# Remove One List From Another

The `--/2` operator allows you to subtract two lists, that is, remove all
elements in the _right_ list from the _left_ list. Each occurrence of an
element is removed if there is a corresponding element. If there is no
corresponding element, it is ignored.

Here are some examples.

```elixir
> [1, 2, 3] -- [2, 4]
[1, 3]
> [:a, :b, :c, :a, :d, :a] -- [:a, :a]
[:b, :c, :d, :a]
```

This kind of list operation is not particularly efficient, so for large
lists it can be quite slow. The following example took several minutes to
run.

```elixir
> Enum.into(1..1000000, []) -- Enum.into(2..1000000, [])
[1]
```

To achieve a true set difference, you'll note that the docs for this
operator recommend checking out `MapSet.difference/2`.

See `h Kernel.--` for more details.

# Replace Duplicates In A Keyword List

Use the
[`Keyword.put`](http://elixir-lang.org/docs/stable/elixir/Keyword.html#put/3)
function to replace duplicate key entries in a keyword list.

If there are no duplicate entries, the entry will just be added.

```elixir
Keyword.put([a: 1], :b, 2)
[b: 2, a: 1]
```

If there is a duplicate entry, it will be replaced by the new value.

```elixir
> Keyword.put([b: 1, a: 1], :b, 2)
[b: 2, a: 1]
```

If there are multiple duplicate entries, they will all be replaced.

```elixir
> Keyword.put([b: 3, b: 4, a: 1], :b, 2)
[b: 2, a: 1]
```

# Requiring Keys For Structs

When defining a
[`struct`](http://elixir-lang.org/getting-started/structs.html) in Elixir,
we may want to ensure that certain values are provided. We can require that
certain keys are used in the creation of a struct with the
[`@enforce_keys`](https://hexdocs.pm/elixir/Kernel.html#defstruct/1)
attribute. Here is an example of a `Name` struct.

```elixir
defmodule Name do
  @enforce_keys [:first, :last]
  defstruct [:first, :middle, :last]
end
```

With this defined, we can create a struct that uses all of the keys.

```elixir
> jack = %Name{first: "Jack", middle: "Francis", last: "Donaghy"}
%Name{first: "Jack", last: "Donaghy", middle: "Francis"}
```

We can also ignore `:middle` and just provide the required keys.

```elixir
> liz = %Name{first: "Liz", last: "Lemon"}
%Name{first: "Liz", last: "Lemon", middle: nil}
```

We cannot, however, omit any of the keys specified in `@enforce_keys`. If we
do omit any of them, Elixir will raise an error.

``` elixir
> tracy = %Name{first: "Tracy"}
** (ArgumentError) the following keys must also be given when building struct Name: [:last]
    expanding struct: Name.__struct__/1
    iex:6: (file)
```

# Reversing A List

To efficiently work with and _transform_ lists in Elixir, you will likely
need utilize a list reversing function from time to time. Your best bet is
to reach for the Erlang implementation which is available as part of the
`lists` module.

Here are a couple examples of how to use it:

```elixir
> :lists.reverse([1,2,3])
[3, 2, 1]
> :lists.reverse([1, :a, true, "what", 5])
[5, "what", true, :a, 1]
```

Note: though I said "_transform_ lists" above, what is actually going on is
that a new version of the list representing my transformation is being
created, per Elixir's functional nature.

# Reversing A List - Part 2

In [Reversing A List](reversing-a-list.md), I showed how Erlang's
`:lists.reverse()` function could be used to reverse a list. Since then,
Elixir now has a built-in function for reversing lists. In fact, it works
with anything that implements the `Enumerable` protocol.

```elixir
> Enum.reverse([1,2,3,4,5])
[5, 4, 3, 2, 1]
> Enum.reverse(%{a: 1, b: 2, c: 3})
[c: 3, b: 2, a: 1]
```

# Root Directory Of A Project

Do you need the root directory of an elixir project? The
[`File.cwd!/0`](http://elixir-lang.org/docs/stable/elixir/File.html#cwd!/0)
function can help.

```elixir
iex> File.cwd!
"/home/dev/code/my_app"
```

Keep in mind though, this will only work reliably with projects that are
compiled using Mix.

[source](https://groups.google.com/forum/#!msg/elixir-lang-talk/Ls0eJDdMMW8/1Lmg5K2MAQAJ)

# Round Floats To Integers

The
[`Float.round/2`](http://elixir-lang.org/docs/stable/elixir/Float.html#round/2)
function allows you to round floating point numbers. The result is another
floating point number.

```elixir
> Float.round(1.5)
2.0
> Float.round(1.3)
1.0
```

If, instead, you always want an integer as the result of rounding, you can
use `Kernel`'s version of a rounding function:

```elixir
> Kernel.round(1.5)
2
> Kernel.round(1.3)
1
```

The
[`Kernel.round/1`](http://elixir-lang.org/docs/stable/elixir/Kernel.html#round/1)
function accepts both integers and floats, and always returns an integer.
Additionally, it can be used in guard tests.

# Run ExUnit Tests In A Deterministic Order

When running a file of
[`ExUnit`](http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html) tests,
they will be executed in a pseudo-random order based on a seed value. In
general, `ExUnit` will pick a random seed each time you run your tests. If
you'd like to add some determinism to the order that your tests run in, you
can specify the seed in the `ExUnit` configuration.

```elixir
ExUnit.configure seed: 42
ExUnit.start

defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "the truth" do
    assert true
  end

  test "more truth" do
    assert 2 + 2 = 4
  end
end
```

[source](https://til.hashrocket.com/posts/4a7dc5fd94-run-exunit-tests-in-the-order-they-are-defined)

h/t Chris Erin

# Run The Test At A Specific Line Number

You can tell `mix test` to only run tests that appear in a specific file by
naming the file:

```bash
$ mix test test/module/file_test.exs
```

You can even point it to a specific line number in that file like so:

```bash
$ mix test test/module/file_test.exs:45
```

Behind the scenes, `mix test` is using tags to build a list of exclusions
and inclusions that result in only the test at line 45 running. Here is an
equivalent of the above command:

```bash
$ mix test test/module/file_test.exs --exclude test --include line:45
```

This will exclude every test. It will then re-include the test that
corresponds to having a tag `line:45`.

# Same Functions Should Be Grouped Together

A favorite feature of Elixir is the function clauses that can be defined in
multiple ways with pattern matching. I've always grouped same-named function
clauses together. It seems like good form and it's what I see everyone else
doing. It also makes for readable, maintainable code.

This is more than just personal preference though. It is the correct,
idiomatic way to organize your Elixir function clauses. The compiler will
let you know if anything gets out of place.

Consider the following snippet of code:

```elixir
defmodule MeterToLengthConverter do
  def convert(:feet, m), do: m * 3.28084
  def convert(:inch, m), do: m * 39.3701
  def hello(), do: IO.puts "Hello, World!"
  def convert(:yard, m), do: m * 1.09361
end
```

It is syntactically correct, so it will compile. However, the compiler will
emit a warning like the following:

```
warning: clauses for the same def should be grouped together, def convert/2
was previously defined (length_converter.ex:2)
  length_converter.ex:5
```

# Skip A Specific Test

Elixir's `ExUnit` supports all kinds of tags for customizing the behavior of
your test suite. The `:skip` tag signals that `ExUnit` should skip over that
specific test.

```elixir
@tag :skip
test "this is a test that should not run" do
  assert false
end
```

When you run `mix test`, it will make sure to not execute any tests with the
`:skip` tag.

Using the `:skip` tag can be a great temporary measure in a lot of
situations. It is not a good long-term practice to keep these around and
check them in.

# String Interpolation With Just About Anything

Coming to Elixir from Ruby, I am used to being able to interpolate literally
_anything_ into a string. In Elixir, this is not the case.

> By default, it handles strings, atoms (including nil, true, false and
> module name aliases like String – which are all just atoms behind the
> scenes), integers, floats, and some lists. That's it.

There are two approaches you can take to interpolate everything else into a
string. The easier approach is to use
[`Kernel.inspect/2`](http://elixir-lang.org/docs/stable/elixir/Kernel.html#inspect/2).

```elixir
> IO.puts "A map #{inspect %{a: 1, b: 2}}"
A map %{a: 1, b: 2}
```

The other approach is to implement the `String.Chars` protocol for the thing
that you are trying to print. You can read more about that in [_Elixir
String Interpolation for
Rubyists_](http://thepugautomatic.com/2016/01/elixir-string-interpolation-for-the-rubyist/).

# Unique Indexes With Ecto

You can create a unique index in a migration for one or more columns using
the
[`unique_index/3`](https://hexdocs.pm/ecto/Ecto.Migration.html#unique_index/3)
function.

For example, if you are creating a join table for `followers` and want to
ensure that duplicate _follower_ entries are prevented, you may want to
include a unique index like so:

```elixir
create table(:followers) do
  add :followed_user, references(:users), null: false
  add :following_user, references(:users), null: false
end

create unique_index(:followers, [:followed_user, :following_user])
```

Keep in mind that `unique_index/3` is a shorthand for
[`index/3`](https://hexdocs.pm/ecto/Ecto.Migration.html#index/3) when you
set `unique: true`.

# Updating Values In A Map

When working with maps in any language, you often need a way to update
key-value pairs. Furthermore, you will need a way to handle keys that are
not already present in the map, generally associating some default value.

In Elixir, the `Map` module provides the `get_and_update/3` function as a
way of accomplishing such a task.

You need to provide the map, the key to be fetched and updated, and a
function for _transforming_ (or updating) the existing value.

Let's use a score counting example to see it in action:

```elixir
> scores = %{}
%{}
# jake scores a point
> {_, scores} = Map.get_and_update(scores, :jake, fn(x) -> {x, (x || 0) + 1} end)
{nil, %{jake: 1}}
# chris scores a point
> {_, scores} = Map.get_and_update(scores, :chris, fn(x) -> {x, (x || 0) + 1} end)
{nil, %{chris: 1, jake: 1}}
# jake scores another point
> {_, scores} = Map.get_and_update(scores, :jake, fn(x) -> {x, (x || 0) + 1} end)
{1, %{chris: 1, jake: 2}}
# final scores
> scores
%{chris: 1, jake: 2}
```

We use `(x || 0) + 1` as the updated value. This is a simple way of
providing a default value for when the key is not already present in the
map.

The update function is expected to return a tuple with the _original_ value
and the _updated_ value.

See [the
docs](http://elixir-lang.org/docs/stable/elixir/Map.html#get_and_update/3)
for more details.

# Using When Clauses In A With Construct

Because Elixir's `with` construct supports the full power of the language's
pattern matching, we can use `when` clauses to further narrow down our
matches.

For instance, if we want to match against the response to an API request,
but only for response status codes in the 2xx range, we can do something
like the following:

```elixir
with %{status_code: code, body: body}
       when code >= 200 && code < 300 <- HTTPoison.get!(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
end
```

See the [docs for
`with`](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1) for more
details.

# Virtual Fields With Ecto Schemas

If you'd like to include a particular key-value pair in an Ecto changeset,
it needs to be included as a field in the schema. In the case of something
akin to a password field, you want to be able to perform validations against
it, but the password itself does not have a column in the database. In other
words, you want to use the password in memory as part of the validation
process but not save it to the database. To accomplish this, you need to
specify that it is a `virtual` field.

```elixir
schema "users" do
  field :username, :string
  field :password_digest, :string
  field :password, :string, virtual: true
end
```

With that schema, you can then validate the `:password` and transform it
into the corresponding `:password_digest` field.

```elixir
def registration_changeset(model, params) do
  model
  |> changeset(params)                  # do other standard validations
  |> cast(params, [:password])          # include :password in the changeset
  |> validate_length(:password, min: 8) # validations
  |> put_pass_hash()                    # transform into :password_digest
end
```

# When Things Don't Match The With Statements

You set up a series of match statements in a `with` construct as a way of
avoiding a bunch of nested if statements. Inevitably you will be passing
data through that doesn't meet all of the match criteria. By default, the
`with` construct will short circuit and your program will continue from
there.

You can, however, take more control over how you handle the _failure_ cases
by employing an `else` block. The `else` block works a lot like a case
statement.

```elixir
with %{status_code: 200, body: body} <- HTTPoison.get!(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
else
  %{status_code: 401} ->
    reauthenticate()
  _ ->
    log_error()
end
```

Here we are able to anticipate a _failure_ case and respond accordingly. For
everything else, we have a generic action that we take.

See the [docs for
`with`](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1) for more
details.

# Word Lists For Atoms

The `~w` sigil works similarly to Ruby's `%w` (word array notation). It
allows you to create a list of words (i.e. strings).

```elixir
> ~w(one two three)
["one", "two", "three"]
```

It sets itself apart though with some modifiers. The default behavior
matches the `s` modifier (for strings).

```elixir
> ~w(one two three)s
["one", "two", "three"]
```

Where it gets more interesting is with the `a` modifier allowing you to
create a list of atoms.

```elixir
> ~w(one two three)a
[:one, :two, :three]
```

Note: there is a third modifier, `c`, for char lists.

```elixir
> ~w(one two three)c
['one', 'two', 'three']
```

[source](http://elixir-lang.org/getting-started/sigils.html)

