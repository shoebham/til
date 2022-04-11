### Category go

---

 - [Access Go Docs Offline](#access-go-docs-offline)
 - [Build For A Specific OS and Architecture](#build-for-a-specific-os-and-architecture)
 - [Not So Random](#not-so-random)
 - [Replace The Current Process With An External Command](#replace-the-current-process-with-an-external-command)
 - [Sleep For A Duration](#sleep-for-a-duration)
 - [Upgrading From An Older Version On Mac](#upgrading-from-an-older-version-on-mac)

---

# Access Go Docs Offline

The Go language has a wonderfully comprehensive standard library. There is
documentation for all of it. You can access that documentation anytime if
you have an internet connection via
[https://golang.org/doc/](golang.org/doc/).

If you are without an internet connection, you're still in luck. Go has a
built-in feature for serving the documentation locally _offline_. Just run
the following command:

```
$ godoc -http=:6060
```

and then visit `localhost:6060`.

[source](http://www.andybritcliffe.com/post/44610795381/offline-go-lang-documentation)

# Build For A Specific OS and Architecture

Go programs can run anywhere, but you've got to create builds specific to
each operating system and architecture. This can be done when building by
specifying the `GOOS` and `GOARCH` environment variables.

For example, if you'd like to build a 32-bit Linux distribution:

```bash
GOOS=linux GOARCH=386 go build -o linux_386_build
```

The `GOOS` value specifies the operating system as Linux and the `GOARCH`
value of `386` specifies a 32-bit architecture.

The plethora of `GOOS` and `GOARCH` options can be found
[here](https://golang.org/doc/install/source#environment).

# Not So Random

Go's `rand` package makes it easy to generate all sorts of pseudo-random
numbers. So if you write a program like so:

```go
package main

import "fmt"
import "math/rand"

func main() {
    stuff := []string{
        "one",
        "two",
        "three",
        "four",
    }
    fmt.Println(stuff[rand.Intn(len(stuff))])
}
```

and then run it, you will get output like:

```
three
```

and any subsequent runs of the program will continue to produce `three`. This
is because the default seed for global functions in `math/rand` is 
[specified](https://golang.org/pkg/math/rand/#Seed) as `1`.

If you want your program to be a little less predictable, you will want to
seed it yourself, perhaps with the current time, instead of `1`. Try adding
the following to the beginning of the `main` function:

```go
rand.Seed(time.Now().UTC().UnixNano())
```

You'll also want to import the `time` package.

Things should *appear* to be a bit more random now.

source: [Jake Worth](https://twitter.com/jwworth) and
[Stackoverflow](http://stackoverflow.com/questions/12321133/golang-random-number-generator-how-to-seed-properly)

# Replace The Current Process With An External Command

Go's `syscall.Exec` function can be used to execute an external program.
Instead of forking a child process though, it runs the external command in
place of the current process. You need to give the function three pieces of
information: the location of the binary, the pieces of the command to be
executed, and relevant environment. Here is a simple example.

```go
package main

import "fmt"
import "os"
import "syscall"

func main() {
    // get the system's environment variables
    environment := os.Environ()

    // get a slice of the pieces of the command
    command := []string{"tmux", "new-session", "-s", "burrito"}

    err := syscall.Exec("/usr/local/bin/tmux", command, environment)
    if err != nil {
        fmt.Printf("%v", err)
    }
}
```

When this program is executed, it will replace itself with a new tmux
session named *burrito*.

# Sleep For A Duration

Many languages allow you to sleep for a certain number of milliseconds. In
those languages, you can give `500` or `1000` to the sleep function to
sleep for half a second and a second respectively. In Go, the duration of a
call to [`time.Sleep`](https://golang.org/pkg/time/#Sleep) is in
nanoseconds. Fortunately, there are constants that make it easy to sleep in
terms of milliseconds.

For example, you can sleep for a half a second (500 milliseconds) like so:

```go
package main

import (
    "time"
)

func main() {
    time.Sleep(500 * time.Millisecond)
}
```

Other available time constants are `Nanosecond`, `Microsecond`, `Second`,
`Minute`, `Hour`.

# Upgrading From An Older Version On Mac

To upgrade from an older version on Mac, there are a couple manual steps
that you need to take. For starters, download the latest installer for Mac
from [Go Lang Downloads](https://golang.org/dl/).

While this is downloading, you'll need to delete the older version of Go
that is installed on your machine.

First, remove the existing Go installation directory:

```bash
$ sudo rm -rf /usr/local/go
```

Second, clean up the Go `bin` directory from your `PATH` environment
variable:

```bash
$ sudo rm /etc/paths.d/go
```

Now, you can double click on the downloaded installer dmg and follow the
prompt instructions.

When its all said and done, check `go version` from the command line to see
that you are now working with the latest.

