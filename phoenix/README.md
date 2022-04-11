### Category phoenix

---

 - [Bypass Template Rendering](#bypass-template-rendering)
 - [Check The Installed Version](#check-the-installed-version)
 - [Generate New App Without Brunch](#generate-new-app-without-brunch)
 - [Render A Template To A String](#render-a-template-to-a-string)
 - [Serve Static Assets From Custom Directory](#serve-static-assets-from-custom-directory)
 - [Specifying The Digest Directory](#specifying-the-digest-directory)
 - [Specifying The Server Port](#specifying-the-server-port)

---

# Bypass Template Rendering

Generally when rendering a response to a request in a Phoenix app, the
controller will make a render call that targets a specific template. If it
suits our needs, we can skip writing a template and bypass the template
portion of the response pipeline by implementing our own `render` function
directly in the view module.

Consider the following route and controller action:

```elixir
# web/router.ex
get "/hello", UserController, :hello

# web/controllers/user_controller.ex
def hello(conn, _params) do
  render(conn, "hello.html")
end
```

The render call would normally trigger a corresponding template function,
but we bypass it by adding the following function to our view module:

```elixir
# web/views/user_view.ex
def render("hello.html", _assigns) do
  "Hello, World!"
end
```

Visiting `/hello` will render a page with the view's layout and the words
"Hello, World!".

# Check The Installed Version

Check what the installed version of Phoenix is with the `-v` flag.

```bash
$ mix phoenix.new -v
Phoenix v1.2.0
```

[source](http://shorts.jeffkreeftmeijer.com/2015/find-the-currently-installed-phoenix-version-number/)

# Generate New App Without Brunch

By default when you create a new Phoenix app using `phx.new`, a set of files
and configurations will be generated for [Brunch](http://brunch.io/). Though
the Phoenix team decided to use Brunch, you don't have to. You may not want
Phoenix to handle asset building or you may just prefer another tool. Either
way, if you'd like to opt out, you can include the `--no-brunch` flag when
generating the project.

```bash
$ mix phx.new --no-brunch my_app
```

If you have an existing project that you'd like to remove Brunch from, there
is some information in [Phoenix's Static Assets
documentation](http://phoenixframework.org/blog/static-assets).

# Render A Template To A String

Templates in a [Phoenix](http://www.phoenixframework.org/) application
ultimately get compiled to functions that can be quickly rendered with the
necessary data. We can take a look at how a template will be rendered using
[`Phoenix.View.render_to_string/3`](https://hexdocs.pm/phoenix/Phoenix.View.html#render_to_string/3).

First, we need a template:

```elixir
# user.html.eex
<h1><%= @user.first_name %></h1>
<h5><%= @user.username %> (<%= @user.email %>)</h5>
```

We can then render that template for the view with some user:

```elixir
> user = %User{first_name: "Liz", last_name: "Lemon", username: "llemon", email: "lizlemon@nbc.com"}
%MyApp.User{...}

> Phoenix.View.Render_to_string(MyApp.UserView, "user.html", user: user)
"<h1>Liz</h1>\n<h5>llemon (lizlemon@nbc.com)</h5>\n"
```

# Serve Static Assets From Custom Directory

When you new up a Phoenix project, an `endpoint.ex` file will be generated.
This file is full of different plugs for handling incoming traffic. The
`Plug.Static` declaration specifies how your application will handle and
serve requests for static files.

```elixir
  plug Plug.Static,
    at: "/", from: :my_app, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
```

The `from` options declares where these static files are located. In this
case it references our application (`:my_app`) as the target which will
translate to its `priv/static` directory.

If you instead want to serve your files from a different, custom directory,
you can replace it with the path to that directory.

```elixir
  plug Plug.Static,
    at: "/", from: "priv/my_frontend/static", gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
```

[source](https://hexdocs.pm/plug/Plug.Static.html)

# Specifying The Digest Directory

By default, Phoenix targets `priv/static` when preparing digested assets for
production. This process happens when running `mix phx.digest`.

If you are doing some custom work with your assets such that they are in a
different location, you'll need to tell Phoenix where to look. To do this,
just include an optional path argument.

```bash
$ mix phx.digest path/to/my/assets
```

The digests will be put in that target directory. If you'd like to specify a
different output directory, such as `priv/static`, include the `-o` flag.

```bash
$ mix phx.digest path/to/my/assets -o priv/static
```

# Specifying The Server Port

Running `mix phx.server` for a Phoenix project with the default settings
will attach the server to port `4000`.

If you'd like to use a different port in development, you can change it in
`config/dev.exs`.

```elixir
config :my_app, MyApp.Web.Endpoint,
  http: [port: 4444],
  ...
```

Alternatively, you can allow it to be configurable from the command line
with an environment variable and a fallback port.

```elixir
config :my_app, MyApp.Web.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  ...
```

Running

```bash
$ PORT=4444 mix phx.server
```

will launch the server on port `4444`.

