### Category vercel

---

 - [Add Web Server Layer Redirects](#add-web-server-layer-redirects)
 - [Deploy An App Without Pushing An Empty Commit](#deploy-an-app-without-pushing-an-empty-commit)
 - [Naming Of The Vercel Config File](#naming-of-the-vercel-config-file)
 - [Share Development Environment Variables Via CLI](#share-development-environment-variables-via-cli)

---

# Add Web Server Layer Redirects

People create links and bookmark URLs. Content, for a variety of reasons, has
to move from one place to another. For everyone's sake, you don't want to break
the URLs that people have come to rely on.

You need to setup some
[redirects](https://vercel.com/docs/configuration#project/redirects).

Though a [Next.js](https://nextjs.org/) app is just frontend code, when
distributed through [Vercel](https://vercel.com/), you can include some
configuration of the web server layer.

Add the `vercel.json` file to the top-level directory of your Next.js project
and then include any needed redirect rules.

```json
{
  "redirects": [
    {
      "source": "blog/old-blog-post-name",
      "destination": "blog/new-blog-post-name"
    },
    {
      "source": "/store",
      "destination": "store.example.com"
    }
  ]
}
```

In the first rule, one path is redirected to another for the same domain. In
the second rule, the path is redirected to an external URL.

By default, these redirects get a [308 status
code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/308).

# Deploy An App Without Pushing An Empty Commit

The [Vercel CLI](https://vercel.com/docs/cli) allows you to make updated
deployments of an app right from the command line.

Many providers require you to push a new commit to the main branch to trigger a
deployment. If there are changes, you can trigger a deployment by pushing
these. If there aren't changes, but you want to re-deploy what is already
there, then you have to create an empty commit and push that.

With the [Vercel CLI](https://vercel.com/docs/platform/deployments#vercel-cli),
you can re-deploy your app without pushing commits. You do this by including
the `--force` flag.

To re-deploy the preview environment:

```bash
$ vercel --force
```

To re-deploy the production environment:

```bash
$ vercel --prod --force
```

# Naming Of The Vercel Config File

[Vercel](https://vercel.com/), the company/service, used to be called Now. With
any renaming comes some consistency challenges, even at the level of software.

The naming of the file for configuring your project used to be `now.json`. It
is _now_ `vercel.json`.

For [backwards compatibility
reasons](https://vercel.com/docs/platform/frequently-asked-questions#conflicting-configuration-files),
you can still use either. You cannot and should not have both though.

If you're working with an existing project that uses `now.json`. It is fine to
continue with that naming. It may eliminate some future confusion if you are to
rename it to `vercel.json`. If you're starting a new project, I'd recommend
using `vercel.json`. All the documentation you'll read uses this newer naming
convention.

# Share Development Environment Variables Via CLI

[Vercel](https://vercel.com/)'s web UI as well as it's CLI make it easy to
store and manage environment variables for your different environments. It is
also safe because it encrypts them.

You and your team can safely access the environment variables for the
development environment with the following CLI command.

```
$ vercel env pull
```

Assuming you have already connected with and authenticated yourself for the
current project, this command will fetch the env vars and write them to the
`.env` file.

If the env vars are ever updated, you can run the command again and it will
rewrite the local file.

