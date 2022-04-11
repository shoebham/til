### Category heroku

---

 - [Deploy A Review App To A Different Stack](#deploy-a-review-app-to-a-different-stack)
 - [Diagnose Problems In A Heroku Postgres Database](#diagnose-problems-in-a-heroku-postgres-database)
 - [Set And Show Heroku Env Variables](#set-and-show-heroku-env-variables)
 - [SSH Into Heroku Server Hosting App](#ssh-into-heroku-server-hosting-app)

---

# Deploy A Review App To A Different Stack

Heroku has different stacks for deploying apps. As newer versions of Linux
distros (such as Ubuntu) come out and software packages need patching and
updating, Heroku releases new stacks. And deprecates older ones.

Before upgrading a production app to a new stack, you should test it out first.
The recommended way to test this out is with a Review App.

If you need to bump the Ruby version or make any other changes, do that first.

Then add or update your `app.json` file. This is a Heroku-specific file that
tells Heroku what stack to use when creating a new app or review app.

```json
{
  "stack": "heroku-18"
}
```

Let's say my app is currently on the Heroku-16 stack. I can set the `stack` to
be `heroku-18` in `app.json`. Then I can push up a branch with all these
changes and turn it into a PR. From the Heroku dashboard, I can click the
Heroku Button that builds a Review App from the PR.

Once it it finishes building and deploying, Heroku will give me a custom URL
for visiting the app so that I can manually evaluate it.

[source](https://devcenter.heroku.com/articles/upgrading-to-the-latest-stack#testing-an-app-on-a-new-stack)

# Diagnose Problems In A Heroku Postgres Database

Heroku keeps track of all kinds of diagnostics on the performance of your app's
database. From long running queries and transactions to index cache hit rates
to unused indexes to tables with bloat.

Running the `pg:diagnose` command for your Heroku app will surface all of these
details in the terminal.

```bash
$ heroku pg:diagnose -a APP_NAME
```

The report will start with the biggest problem areas which it color codes in
red. If your app is experiencing degraded performance, the list of red items
would be a good place to start investigating.

The report will then list less urgent problem areas. Those will be color coded
yellow. Though Heroku has deemed these less serious, you may still want to deal
with these.

All the other areas of diagnose will fall into the _green_ bucket. Meaning
Heroku doesn't see any issues in those areas.

# Set And Show Heroku Env Variables

The `heroku` CLI includes the `config` command which will show all the env
variables for the current app.

```bash
$ heroku config
=== my-app Config Vars

```

At this point I have none set.

I can set one with the `config:set` command and a key-value parameter.

```bash
$ heroku config:set PUBLIC_NEXT_URL=http://localhost:1235
Setting PUBLIC_NEXT_URL and restarting ⬢ my-app... done, v3
PUBLIC_NEXT_URL: http://localhost:1235
```

I can see the value that this specific variable is set to by calling it with
`config:get`.

```bash
$ heroku config:get PUBLIC_NEXT_URL
http://localhost:1235
```

[source](https://devcenter.heroku.com/articles/config-vars#using-the-heroku-cli)

# SSH Into Heroku Server Hosting App

Heroku hosts and deploys your app on a remote server. One of Heroku's primary
offerings is that it abstracts away the details of that server. You generally
don't need to think about it. Instead you can use the Heroku CLI to interact
with it indirectly.

There will inevitably be a time when you need to access that server directly.
Heroku gives you a way to do this with their CLI through
[`ps:exec`](https://devcenter.heroku.com/articles/exec).

```bash
$ heroku ps:exec --app my-app
```

This will connect you to an SSH session with the server that the app is running
on.

