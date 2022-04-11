### Category reason

---

 - [Break Out Of A While Loop](#break-out-of-a-while-loop)
 - [Compile Reason To Native With Dune](#compile-reason-to-native-with-dune)
 - [Compile Reason With An OCaml Package Using Dune](#compile-reason-with-an-ocaml-package-using-dune)
 - [Create A Map Of Strings](#create-a-map-of-strings)
 - [Create A Stream From An Array](#create-a-stream-from-an-array)
 - [Creating A 2D Array](#creating-a-2d-array)
 - [Data Structures With Self-Referential Types](#data-structures-with-self-referential-types)
 - [Defining Variants With Constructor Arguments](#defining-variants-with-constructor-arguments)
 - [Dynamically Create A Printf String Format](#dynamically-create-a-printf-string-format)
 - [Exhaustive Pattern Matching Of List Variants](#exhaustive-pattern-matching-of-list-variants)
 - [Format The Current File Within Vim](#format-the-current-file-within-vim)
 - [Generate A Native ReasonML Project With Pesy](#generate-a-native-reasonml-project-with-pesy)
 - [Generate Starter Reason Projects](#generate-starter-reason-projects)
 - [Helping The Compiler Help Us With Variants](#helping-the-compiler-help-us-with-variants)
 - [Inline Component Styles With Reason React](#inline-component-styles-with-reason-react)
 - [Is This A Directory Or A File?](#is-this-a-directory-or-a-file?)
 - [Making Things Mutable](#making-things-mutable)
 - [Modifying A String With blit_string](#modifying-a-string-with-blit_string)
 - [Multi-Argument Functions As Syntactic Sugar](#multi-argument-functions-as-syntactic-sugar)
 - [Pattern Match On Exceptions](#pattern-match-on-exceptions)
 - [Quickly Bootstrap A React App Using Reason](#quickly-bootstrap-a-react-app-using-reason)
 - [Seeding And Generating Random Integers](#seeding-and-generating-random-integers)
 - [Stream A File Line By Line](#stream-a-file-line-by-line)
 - [String Interpolation With Integers And Sprintf](#string-interpolation-with-integers-and-sprintf)
 - [String Interpolation With Quoted Strings](#string-interpolation-with-quoted-strings)
 - [Trying Out ReasonML In CodeSandbox](#trying-out-reasonml-in-codesandbox)
 - [Two Ways To Find An Item In A List](#two-ways-to-find-an-item-in-a-list)
 - [Using Optional Labeled Function Arguments](#using-optional-labeled-function-arguments)
 - [Wrapping A Component For Use In JavaScript](#wrapping-a-component-for-use-in-javascript)

---

# Break Out Of A While Loop

The `while` construct is a great way to loop indefinitely. You may
eventually want to break out of the loop. For that, you are going to need to
invalidate the _while condition_. One way of going about this is creating a
mutable ref, changing it from true to false when a certain condition is met.

```reason
let break = ref(true);

while (break^) {
    switch (Unix.readdir(currentDir)) {
    | exception End_of_file => break := false
    | item => print_endline(item);
    }
};
```

Here we have a mutable ref called `break` which starts as `true`. This is
our _while condition_. Its actual value can be referenced by appending the
`^` character -- hence `break^`. Once a certain condition is met inside our
`while` block, we can set `break` to `false` using the `:=` operator.

The above code snippet can be seen in full details
[here](https://github.com/jbranchaud/basic-ls-reason-native/blob/master/src/Index.re).

[source](https://reasonml.github.io/docs/en/imperative-loops.html#tips-tricks)

# Compile Reason To Native With Dune

[Dune](https://github.com/ocaml/dune) is "a composable build system for
OCaml" with out-of-the-box support for ReasonML. Dune can be used for a lot
of things, but in simplest terms it can be used to compile ReasonML programs
into native executables.

Considering the following ReasonML program.

```reason
/* hello_reason.re */
print_endline("Hello, Reason!")
```

We can then create the following Dune build file.

```lisp
;; dune
(executable
 (name hello_reason))
```

If we then run `dune build hello_reason.exe`, then Dune will compile the
`hello_reason.re` into a `hello_reason.exe` executable that can be found in
`build/default`. Run it and see the output.

Read more in the [Quickstart
guide](https://dune.readthedocs.io/en/latest/quick-start.html).

# Compile Reason With An OCaml Package Using Dune

In [Compile Reason To Native With
Dune](reason/compile-reason-to-native-with-dune.md), I showed how to compile
a basic ReasonML file as a native executable using Dune.

Any non-trivial program will likely involve pulling in an OCaml dependency.
For example, you may want to pull in [Lwt](https://github.com/ocsigen/lwt).
Assuming this package is available, whether you've manually downloaded it
via [opam](https://opam.ocaml.org/) or used something like
[esy](https://github.com/esy/esy), you'll want to let Dune know that Lwt is
an available library.

```lisp
;; dune
(executable
 (name hello_reason)
 (libraries lwt lwt.unix))
```

The modules in the Lwt package will now be globally available to your
Reason code.

```reason
let () = {
  Lwt_main.run(
    Lwt_io.printf("Hello, Reason!\n")
  );
};
```

When Dune builds your code, it will include and compile Lwt.

See a [full example
here](https://github.com/jbranchaud/esy-reasonml-lwt-example).

# Create A Map Of Strings

[ReasonML](https://reasonml.github.io/en) has the [`Map.Make`
functor](https://reasonml.github.io/api/Map.Make.html) in its standard
library which allows you to create a `Map` module with a specific key type.
Here is how we can make a map module with string keys.

```reason
module StringMap = Map.Make(String);
```

We can then use that module to to create an empty map followed by adding
key-value pairs to it.

```reason
StringMap.empty
|> StringMap.add("Morty", "Smith")
|> StringMap.add("Rick", "Sanchez")
|> StringMap.add("Scary", "Terry")
|> StringMap.iter((first, last) => {
  print_endline(Printf.sprintf("%s %s", first, last));
});
/*
Morty Smith
Rick Sanchez
Scary Terry
*/
```

See the [live
example](https://reasonml.github.io/en/try?rrjsx=true&reason=LYewJgrgNgpgBAZQC4CcCWA7A5gWQIYAOcAvHPgQHT4DWMAFMutgJQDcAUO45roRTMAJIAnuwA+APkSoe5CnjBg6AIhwgUI5QBo4yhMDRIAFsubip3bHIVLlAJTQBjatt0I8GR0ZgAvU+ekmXkobFQRHPBRhV2UAFRgUKP9JQNk+QwS6OgAzNBQAZyQdKDxC5hIpAG92ODgCJiQAfRgMMChMegAFBuyKfPrMJGyVAFJ8uDHXXIKiuBKytnYAXzYgA).

# Create A Stream From An Array

There are functions in the [`Stream`
module](https://reasonml.github.io/api/Stream.html) for turning a variety of
data structures into streams -- lists, input channels, etc.

What if you have an array?

The `Stream.from` function lets you define a function for custom fitting
data structures into streams. Let's take a look:

```reason
let pokemons = [| "bulbasaur", "charmander", "squirtle" |];

let poke_stream: Stream.t(string) =
  Stream.from(i =>
    switch (pokemons[i]) {
    | pokemon => Some(pokemon)
    | exception (Invalid_argument("index out of bounds")) => None
    }
  );
```

The function takes the current index and needs to either return `Some('a)`
with the corresponding value or `None` if the stream is empty.

With that, we now have a stream on which we can invoke any of the stream
functions.

```reason
switch (Stream.next(poke_stream)) {
| pokemon => print_endline(Printf.sprintf("Next Pokemon: %s", pokemon))
| exception Stream.Failure => print_endline("No pokemon left")
};
```

# Creating A 2D Array

In most languages if I wanted to create a two-dimensional array, I would
utilize some nested looping construct to generate columns of rows. The
[ReasonML `Array` module](https://reasonml.github.io/api/Array.html)
abstracts this away.

```reason
let grid = Array.make_matrix(10, 10, 0);

grid
|> Array.iter(column => {
  column
  |> Array.iter(cell => {
    print_int(cell);
  });
  print_endline("");
});

/*
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
0000000000
*/
```

The `make_matrix` function allows you to specify dimensions of a
two-dimensional array with all positions initialized to the same value --
that third argument.

# Data Structures With Self-Referential Types

[ReasonML](https://reasonml.github.io/) has a powerful type system that
allows us to create types that represent all sorts of things. For data
structures like [linked lists](https://en.wikipedia.org/wiki/Linked_list),
we need a sort of recursive type, a type that can reference itself -- a
self-referential type.

Reason's type system allows us to define types that reference themselves.
Combine that with type arguments and variants -- we can create a type
definition to represents something like a linked list.

```reason
type linked_list('a) =
  | Empty
  | Node('a, linked_list('a));
```

A linked list is a chain of nodes. It can be an _empty_ list, hence the
first part of the variant. Otherwise, it is a node that has some data and
then points to another linked list (chain of nodes).

The `'a` part is a type argument. When creating a linked list, we can decide
what type the `'a` will be. Here is an `int`-based linked list:

```reason
let my_list: linked_list(int) = Node(25, Node(27, Empty));
/* my_list = [25] => [27] => [] */
```

# Defining Variants With Constructor Arguments

In [Helping The Compiler Help Us With
Variants](https://github.com/jbranchaud/til/blob/master/reason/helping-the-compiler-help-us-with-variants.md),
I introduced the concept of variants with a basic example of how to define
and use one. The fun doesn't stop there.

We can take variants a step further by defining them with constructor
arguments.

```reason
type listActions =
  | Length
  | Nth(int);
```

The second variant is defined such that it is paired with some extra data --
a single `int` argument.

Here is how we use that variant in our code:

```reason
let performListAction = (l: list(int), action: listActions) => {
  switch(action) {
  | Length => List.length(l)
  | Nth(n) => List.nth(l, n)
  }
};

performListAction([7,8,9], Nth(1)); /* 8 */
performListAction([1,2,3], Length); /* 3 */
```

Our switch statement not only matches on that variant, but it makes the
`int` argument available as a value we can consume in that step of the
switch.

[source
code](https://reasonml.github.io/en/try.html?reason=C4TwDgpgBANglgZ2AQQMbDgewHYKgXgCgooAfKAGQmwHNgALYsqAOQYAo5tgBKAbkKEYEYFEgAnAGaZxAWwqIU6LNgJR2MAFyxFnbjwA0UAIbKc2+EjQYcCHgQB8UAN5MEAdzjBU9dqZvY9q4k5FS0DI6UigB0wuG+MDxM5Gy+gZEKSNHcCUaBTAC+hAUChABSCLGYNOwS0nKZSgHsANoA7AYAHAYAnAC6RqnsAIw8YwIVVTV1MvKK1iqtwwYATAYAzAOU1HT040A)

# Dynamically Create A Printf String Format

Formatting a string with `Printf` requires defining a format for that
string.

```reason
let str = Printf.sprintf("%6s", "dope");
/* str => "  dope" */
```

The _format_ is the first argument. At compile-time it is interpreted as a
`format6` type value.

So, what if you want a dynamically created _format_ value? Simply
concatenating some strings together won't do it because then the type will
be `string` and that's not going to compile.

The [`Scanf.format_from_string`](https://reasonml.github.io/api/Scanf.html)
function can help.

```reason
let some_num = 6;
let format_str = "%" ++ string_of_int(some_num) ++ "s";
let format = Scanf.format_from_string(format_str, "%s");

let str = Printf.sprintf(format, "dope");
/* str => "  dope" */
```

We can convert our string that has the appearance of a format into an actual
`format6` type. To do this, we have to tell `format_from_string` what types
each of the formats is going to have -- hence the second argument `%s`.

[source](https://twitter.com/rickyvetter/status/1013476235253436417)

# Exhaustive Pattern Matching Of List Variants

ReasonML's `switch` expression allows for powerful pattern matching. When
using `switch` to pattern match against a list, the compiler will be sure to
warn you if you haven't accounted for all variants of a list.

```reason
let getFirst = (numList: list(int)): int => {
  switch(numList) {
  | [first, ...rest] => first
  };
};
```

> this pattern-matching is not exhaustive. Here is an example of a value
> that is not matched: []

The compiler knows that a list can either be 1) empty (`[]`) or 2) contain
at least one value and another list (`[a, ...rest]`). To ensure all variants
are accounted for, we can include the `[]` case in our switch.

```reason
let getFirst = (numList: list(int)): int => {
  switch(numList) {
  | [] => -1
  | [first, ...rest] => first
  };
};
```

[source
code](https://reasonml.github.io/en/try.html?reason=DYUwLgBAdgrgtgIxAJwM4C4LAJarACmyjAEoIBeCAbQDYAaABjvvoEYBdAbgChvRIA5uABi2NJEr5YcADK4wmHHkLESJTEQkA+CAG9uECKgDu2MAGMAFlPhy8ZfYYA+1AGZi8dCADpfyEHjsFDru4gYQAL48UbwAUqjewAD2AvhCYKLiNogoqGqcQA)

# Format The Current File Within Vim

I'm editing a `.re` file within Vim. I haven't yet wired up `refmt` to
something like [ALE](https://github.com/w0rp/ale) for automatic formatting
on save. By the time I'm done with my changes, indentation is a mess.

I can still take advantage of `refmt` to clean up my file.

```
:!refmt --in-place %
```

Running that command in Vim will cause the current file to be formatted.

How does it work?

It shells-out to `refmt` which does all the heavy lifting. The `--in-place`
flag means that the target file will be re-written by the formatted result.
The `%` is a handy Vim shorthand for the path and name of the current file.

# Generate A Native ReasonML Project With Pesy

[Pesy](https://github.com/jordwalke/pesy) is a CLI utility available from
NPM that you can use to generate a ReasonML project that is ready for native
compilation. It uses [`esy`](https://github.com/esy/esy) for the management
of `opam` packages. It uses [Dune](https://github.com/ocaml/dune) for
building your library code with the ReasonML and OCaml dependencies.

Assuming you already have `pesy` installed globally, create a directory for
your project and then run:

```bash
$ pesy
```

A project will be generated that is out-of-the-box ready to compile native
executables.

# Generate Starter Reason Projects

With the latest `bs-platform` installed, you should have access to the `bsb`
command which contains a number of options -- including `-themes`.

```bash
$ bsb -themes
Available themes:
basic
basic-reason
generator
minimal
node
react
```

This is a list of themes (read: templates) that can be used to generate a
starter project.

For example, if you'd like a basic project structure geared toward writing
Reason, run the following:

```bash
$ bsb -init my-project -theme basic-reason
```

Or if you'd like to get started with
[`reason-react`](https://reasonml.github.io/reason-react/), give this a try:

```bash
$ bsb -init my-reason-react-project -theme react
```

[source](https://bucklescript.github.io/docs/en/new-project.html)

# Helping The Compiler Help Us With Variants

[ReasonML](https://reasonml.github.io/) gives us something called a variant
which is similar to what other language call enums and union types. By
defining a variant, we give the compiler some information about exactly what
values a variable can take on -- its allowed variants.

Here we define the kinds of roles that users in our system can have as well
as a `user` type for representing individual users:

```reason
type userType =
  | Student
  | Teacher
  | Admin;

type user = { role: userType, id: int };
```

And here is how we might use it in some authorization code:

```reason
let canCreateClasses(u: user) {
  switch(u.role) {
  | Student => false
  | Teacher => true
  };
};
```

We've neglected to include `Admin` in our switch statement. The compiler
will inform us of this with a warning.

> this pattern-matching is not exhaustive. Here is an example of a value
> that is not matched: Admin

[source
code](https://reasonml.github.io/en/try.html?reason=C4TwDgpgBArgzhATgFXNAvAKClAPlAZWBgBMIA7YbPKZCAQwGMALJa-AQRIFsBLcgNyZQkWAkRR0UAN5REAewA2EAFxikqSABoovEmv7AoAXyGZlRxvXIBhRA2AQbi+nARwAFDDXwkAShlqOAB3XmAWLwA6BWUA6XZCYjJKSQA+KAAzekUEBLomVgl0dOBEGAhqU0wqgCk4SMV5AHMPK1t7ekdnV3cPWRjVRNIKYB09NQBGACYAZhM-PwEgA)

# Inline Component Styles With Reason React

If you've written much React.js, the following may look familiar:

```javascript
<span style={{
  width: "10px",
  height: "10px",
  backgroundColor: "rgb(200, 64, 128)"
}} />
```

This is how we do inline styles with JSX in JavaScript.

When it comes to doing inline styles with JSX in our ReasonML code, the best
approach for now is to use a `make` function for styles provided by the
React DOM bindings.

```reason
<span style=(
  ReactDOMRe.Style.make(
    ~width="10px",
    ~height="10px",
    ~backgroundColor="rgb(200, 64, 128)",
    ())
)/>
```

[source](https://reasonml.github.io/reason-react/docs/en/style.html)

# Is This A Directory Or A File?

When compiling [ReasonML](https://reasonml.github.io/) natively, we have access to a variety of
additional modules including the `Unix` module. We can interact with
directories and files using functions on `Unix`.

```reason
let current_dir = Unix.opendir(Unix.getcwd());
let first_file = Unix.readdir(current_dir);
/* is first_file a directory or a file? */
Unix.closedir(current_dir);
```

Here we open the current working directory, grab the first thing out of that
directory -- maybe it's a file, maybe it's a directory, maybe it is
something else. Lastly, we close the directory.

```reason
let current_dir = Unix.opendir(Unix.getcwd());
let first_file = Unix.readdir(current_dir);

switch(Unix.stat(first_file)) {
| Unix.stats({ st_kind: Unix.S_REG }) => print_endline("Regular File")
| Unix.stats({ st_kind: Unix.S_DIR }) => print_endline("Directory")
| Unix.stats({ st_kind: Unix.S_LINK }) => print_endline("Link")
| Unix.stats({ st_kind: Unix.S_SOCK }) => print_endline("Socket")
| _ => print_endline("Something else")
};

Unix.closedir(current_dir);
```

There are a variety of kinds of files to switch on. Here, we are switching
on _Regular Files_, _Directories_, _Links_, and _Sockets_. Everything else
falls through.

See the [`Unix` module docs](https://reasonml.github.io/api/Unix.html) for
more details.

# Making Things Mutable

In [ReasonML](https://reasonml.github.io/en/), things that we create with
`let` are immutable -- which means that we can't change them.

```reason
let num = 5;
```

Once `num` is _bound_ to `5` it is stuck with that value for the duration
of it's scope.

ReasonML doesn't completely restrict us to immutability though. The
`ref` construct allows us to bind a variable to a sort of box that holds a
value. We can then look in the box and change what is in the box.

```reason
let num = ref(5); /* put 5 in the box */

Js.log(num^); /* use `^` to look in the box */

num := 3; /* remove 5, put 3 in the box */
```

We use `ref` to bind our variable to a box with some initial value. The `:=`
assignment operator allows us to change what's in the box. Anytime we want
to refer to what's in the box, we postfix our variable with `^`.

Also of note: while `list` instances are not mutable, `array` instances are.

[source](https://reasonml.github.io/docs/en/mutation)

# Modifying A String With blit_string

[ReasonML's `Bytes` module](https://reasonml.github.io/api/Bytes.html) has a
function called
[`blit_string`](https://reasonml.github.io/api/Bytes.html#VALblit_string).
This function allows you to copy portions of a string into a destination
byte sequence. It is a fairly low-level operation, so you have to provide a
source string and provide an offset of that source string to start copying
from. You then have to provide a properly sized byte sequence as well as the
destination's starting offset and length of bytes to be copied.

Here is an example of how we can use `blit_string` to create a copy of the
string with the first character removed.

```reason
let remove_first_char = (str: string): string => {
  let copy_len = String.length(str) - 1;
  let dst = Bytes.create(copy_len);
  Bytes.blit_string(str, 1, dst, 0, copy_len);
  Bytes.to_string(dst);
};
```

Notice that once the byte sequence has been copied over, we then need to
convert it back into a string.

# Multi-Argument Functions As Syntactic Sugar

When writing a multi-argument function, like the following `adder` function:

```reason
let adder = (x, y) => x + y;

adder(2, 3); /* => 5 */
```

We are utilizing a syntactic sugar of the function syntax. The same function
can be written as such:

```reason
let adder = (x) => (y) => x + y;

adder(2, 3); /* => 5 */
```

As you can see, we can apply the function in the same way.

This is useful because it means we can partially apply (or _curry_) our
functions to create other functions.

```reason
let adder = (x, y) => x + y;
let twoAdder = adder(2);

twoAdder(5); /* => 7 */
```

[source
code](https://reasonml.github.io/en/try.html?reason=DYUwLgBAhgJjICcIF4IAoAeBKFA+dAnjsvhhANQQEDcAULQFIDOAdMAPYDmas8CaAFgA0EAKxYsdWqEhgA7uwCCcRCmgr+AJkn1mbLmnlKNacZKA)

# Pattern Match On Exceptions

[ReasonML](https://reasonml.github.io/) supports [powerful pattern
matching](https://reasonml.github.io/docs/en/pattern-matching.html) through
the `switch` statement.  This even includes pattern matching against
exceptions that may arise as a way of catching and handling those
exceptions.

```reason
let values: list(int) = [1,3,5,7,9];

let getValue = (list, index) => {
  switch (List.nth(values, index)) {
  | value => value
  | exception Failure("nth") => 0
  | exception Invalid_argument("List.nth") => 0
  };
};

getValue(values, 0); /* 1 */
getValue(values, 1); /* 3 */
getValue(values, 5); /* 0 */
getValue(values, -1); /* 0 */
```

The [`List.nth` docs](https://reasonml.github.io/api/List.html) detail what
happens in the two kinds of out of bounds scenarios that would raise an
error -- `Failure` and `Invalid_argument`. You can pattern match against
those by declaring the respective cases as exception instances and then
returning the desired values in response.

[source
code](https://reasonml.github.io/en/try.html?reason=DYUwLgBAbghsCuIDOAuCwCWSwAoMDswBKCAXggG0BGAGgGYaBWGgdhoE4BdAbgChfQkAObgAanERkIOTNhoQCAExAAPEqQB8EAN68IEJAHcMYAMYALaQBksYAHSFzOWAmTylqoiV36APtAkQMi0XRD0If1VTEAAHMAwAe3wIADEYDAQAJxAcACJHXPUtAAZwyJVouMTkgEl8FwxFAH0YTKF4AFsQQjybbAcwc0LgiFL9AF8+Sf4AKSQ7YAShHBEwcVdnQKR5Yq8+OYWllbFAzddtiCo93gPF5dX1xDPEC8Zr26OH09C3CABaK5EbhAA)

# Quickly Bootstrap A React App Using Reason

The ReasonML language and ecosystem is great for developing React apps. As
you might expect from the React community, there is a set of `reason-scripts`
for a ReasonML/React project which works similarly to the standard
[`create-react-app`](https://github.com/facebook/create-react-app) scripts.

First, you need to install the [BuckleScript
platform](https://github.com/BuckleScript/bucklescript) and this must be
done using `npm`.

```bash
$ npm install -g bs-platform
```

From there, it is a matter of using the [`yarn
create`](https://yarnpkg.com/lang/en/docs/cli/create/) command to generate a
React app that uses the aforementioned
[`reason-scripts`](https://yarnpkg.com/lang/en/docs/cli/create/).

```
$ yarn create react-app my-reason-react-app --scripts-version reason-scripts
```

Next steps from here are documented in the `README.md` and should be
familiar to anyone who has used `create-react-app` in the past.

# Seeding And Generating Random Integers

It is easy enough to generate a series of random numbers using the `Random`
module's `int` function.

```reason
Random.int(10);
```

This will generate a random integer between 0 and 9.

You may notice that the randomness is the same each time you run your
program. That is because you have fixed seed. To make sure you have a
different seed each time your program runs, you can initialize the random
number generator with something different at each run, such as the current
time.

```reason
Random.init(int_of_float(Js.Date.now()));
```

See a [live example
here](https://reasonml.github.io/en/try.html?reason=EoQwdgJg9gtgdASzAgLgCiSg+lAZl3AGyhHQCkBnOAEVIFM4woB3NASg4G4AobyuYgHM0oSLERh0ARgAMXPlSEjw0eJjSz5-JaNUTpctj21Rhu8es1GFA08rFrJGw5yA).

# Stream A File Line By Line

We can use the `Stream` module in [ReasonML](https://reasonml.github.io/en)
to read a file getting each line on demand. Doing this requires two key
insights. First, we can open a file as an _input channel_. Second, we can
turn an input channel into a _stream_ using `Stream.from`.

```reason
let file_in_channel = Pervasives.open_in('file.txt');

let file_stream =
  Stream.from(_i => {
    switch(Pervasives.input_line(file_in_channel)) {
    | line => Some(line)
    | exception(End_of_file) => None
    };
  });

file_stream |> Stream.iter(line => do_something(line));
```

The `Pervasives` module (which is open by default and is only prefixed above
so as to be explicit) allow us to open the named file as an input channel
with `open_in`. It also allows us to read lines off that file with
`input_line`. We use `Stream.from` to create a custom stream that consumes
the input channel line by line using `input_line`. We either get _some_ line
or we hit the end of the file. Lastly, we can do whatever we want with the
stream, such as iterate over it.

See the docs for
[`Pervasives`](https://reasonml.github.io/api/Pervasives.html) and
[`Stream`](https://reasonml.github.io/api/Stream.html) for more details.

# String Interpolation With Integers And Sprintf

ReasonML's [`Printf`](https://reasonml.github.io/api/Printf.html) module
comes with a number of functions for formatting values of various types. The
`sprintf` function allows for string interpolation.

```reason
let red = 64;
let green = 256;
let blue = 128;
let alpha = 1;

let color =
  Printf.sprintf("rbga(%i, %i, %i, %i)", red, green, blue, alpha);

Js.log(color);
```

It functions the same as `fprintf` but instead of outputting the result to
some channel, it returns a string. It enforces type checking as well -- the
`%i` is specifically for integers, so using that with a type other than an
integer will result in a compilation error.

See the [`Printf`](https://reasonml.github.io/api/Printf.html) docs for more
details.

[source code](https://reasonml.github.io/en/try.html?reason=DYUwLgBATiAmEF4IDYAsBuAUKSBzGIAdohAEwCsyWOEARsAK4gkCMpAHNeBAIbAAOACx6ss2bgGMA9sClREmCBAAKUAJaEwAMwB0AZ37rNWgBQAiKLVw8TAUjUAaCPacvnagJRmnMWE-wgRE70TE58QjweYgBSejqyuCbSslBRQA)

# String Interpolation With Quoted Strings

Stapling strings together with the `++` operator can be tedious and clunky.
If you have string variables that you'd like to interpolate, you can piece
them together much more easily using [quoted
strings](https://reasonml.github.io/docs/en/string-and-char.html#quoted-string).

We can get close to a solution with the standard quoted string syntax.

```reason
let greeting = (greetee) => {
  {|Hello, $(greetee)!|}
};

Js.log(greeting("World")); // => "Hello, $(greetee)!"
```

This isn't quite right though. We have to take advantage of a preprocessing
hook provided by
[Bucklescript](https://bucklescript.github.io/docs/en/common-data-types.html#interpolation).
The `j` hook supports unicode and allows variable interpolation.

```reason
let greeting = (greetee) => {
  {j|Hello, $(greetee)!|j}
};

Js.log(greeting("World")); // => "Hello, World!"
```

To use this pre-processor we have to include `j` in the quoted string like
so `{j|...|j}`.

See a [live example
here](https://reasonml.github.io/en/try.html?reason=DYUwLgBA5gTi4EsB2UIF4IApbzPAlOgHwQDeAUBGQFYA+AEiMMAPYA0EAJNnOAQIS1qAX3LCA3OXIApAM4A6VlB65kygEQB1FjGAATdfnzigA).

# Trying Out ReasonML In CodeSandbox

[CodeSandbox](https://codesandbox.io/) recently added support for a bunch of
new technologies.  Among these is [ReasonML](https://reasonml.github.io/).

To give ReasonML a try, visit this [template
link](https://codesandbox.io/s/reason).

This is a [`reason-react`](https://reasonml.github.io/reason-react/)
template which allows you to write a React web app using ReasonML.

# Two Ways To Find An Item In A List

The `List` module has the typical `find` function that you'd expect any
enumerable type to include. It has a very similar `find_opt` function as
well. The difference is in the return types.

When using `List.find` you'll have to deal with the possibility of a
`Not_found` exception.

```reasonml
switch (List.find(item => item.id == id, my_list)) {
| exception Not_found => print_endline("Not found!")
| item => print_endline("Found it: " ++ item.name)
}
```

The `List.find_opt` function has a more familiar interface that doesn't
require you to know the details of what exceptions could arise. All you want
to know is if it was found or _not_. This is achieved by having an
`option('a)` return type.

```reasonml
switch (List.find_opt(item => item.id == id, my_list)) {
| None => print_endline("Not found!")
| Some(item) => print_endline("Found it: " ++ item.name)
}
```

See the [`List` module](https://reasonml.github.io/api/List.html) for more
details.

# Using Optional Labeled Function Arguments

If you are constructing a function that takes some arguments, but one of
those arguments has a reasonable default value, then you can use an optional
labeled argument. Labeled arguments are those arguments prefixed with a `~`.
If you give the argument a default value, then it becomes optional.

```reason
let thing = (~a=1, b: int, c: int) => {
  a + b + c;
};
```

In this case `~a` is a labeled argument. It is also optional and will
default to `1` if not specified. The other two arguments, `b` and `c`, are
positional arguments and thus required in order for the function to
evaluate.

Here are two ways of using this function either by specifying `~a` or
excluding it so that it defaults to `1`.

```reason
thing(~a=2, 1, 1)
|> string_of_int
|> print_endline /* 4 */

thing(1, 1)
|> string_of_int
|> print_endline /* 3 */
```

See more details [here](https://reasonml.github.io/docs/en/function).

# Wrapping A Component For Use In JavaScript

Consider the following
[ReasonReact](https://reasonml.github.io/reason-react/en) component for
displaying a greeting.

```reason
let component = ReasonReact.statelessComponent("Hello");

let make = (~name, _children) => {
  ...component,
  render: _self =>
    <p> {ReasonReact.string("Hello, ")} {ReasonReact.string(name)} </p>,
};
```

If we will just be using this component in a ReasonML context, then that is
all we need.

If we want this component available for use in a JavaScript file, we have a
little more work to do. We need to define the shape of the component's props
using a bucklescript directive and then wrap the component so that it gets
appropriate exported for a JavaScript context.

Here is what that looks like.

```reason
[@bs.deriving abstract]
type jsProps = {name: string};

let default =
  ReasonReact.wrapReasonForJs(~component, jsProps =>
    make(~name=jsProps->nameGet, [||])
  );
```

Our only prop is `name` which is a `string`. The `wrapReasonForJs` function
and accompanying binding to `default` mean that we can import the compiled
JS-equivalent like so:

```javascript
import Hello from 'src/components/Hello.bs.js';
```

See the [docs](https://reasonml.github.io/reason-react/docs/en/interop) for
more details on Reason/JS interop.

