### Category nextjs

---

 - [Create Files And Directories For Dynamic Routes](#create-files-and-directories-for-dynamic-routes)
 - [Define URL Redirects In The Next Config](#define-url-redirects-in-the-next-config)
 - [Push A Route With A URL Object](#push-a-route-with-a-url-object)
 - [Remove A Query Param From The URL](#remove-a-query-param-from-the-url)
 - [Ship Public Assets With A Next.js App](#ship-public-assets-with-a-next.js-app)

---

# Create Files And Directories For Dynamic Routes

[Next.js](https://nextjs.org/) allows you to go beyond static, predefined pages
and routes with [dynamic
routing](https://nextjs.org/docs/routing/dynamic-routes).

The common example is a `posts` route that includes a _slug_ to dynmically
reference a particular post. The template for that page can be defined at
`pages/posts/[slug].js`. Notice the square brackets around the slug, that tells
Next that it is a dynamic route and whatever matches against the slug should be
included in `router.query` as `slug`.

Let's try to create that file:

```bash
$ touch pages/posts/[slug].js
zsh: no matches found: pages/posts/[slug].js
```

That failed. To create this kind of file from the command-line, you are going
to need to escape the square brackets:

```bash
$ touch pages/posts/\[slug\].js
```

You can do the same if you use dynamic routing in your directory structure:

```bash
$ mkdir -p pages/posts/\[year\]/\[month\]/\[day\]
```

And now we have the following structure:

```bash
$ exa --tree pages/posts
pages/posts
├── [slug].js
└── [year]
   └── [month]
      └── [day]
```

# Define URL Redirects In The Next Config

In [Add Web Server Layer Redirects](vercel/add-web-server-layer-redirects.md),
I explained how to define URL redirects to your [Vercel](https://vercel.com/)
configuration for a [Next.js](https://nextjs.org/) app. Because these redirect
rules are defined in `vercel.json` which is processed at the time of deployment
on the Vercel platform, you are unable to experience these redirects with your
local dev instance of the app. That could be misleading and cause confusion
during development.

Instead, you can define your redirects in `next.config.js` as part of the
Next.js app's configuration. When locally running the Next dev server, these
redirects will be processed and active.

Here is an example of these redirects in `next.config.js`:

```javascript
const nextConfig = {
  async redirects() {
    return [
      {
        source: "blog/old-blog-post-name",
        destination: "blog/new-blog-post-name",
        permanent: true,
      },
      {
        source: "/store",
        destination: "store.example.com"
        permanent: true,
      },
    ]
  },
}
```

These will be 308 Permanent Redirects because of `permanent: true`. You can
change that to `false` to make them into 307s.

# Push A Route With A URL Object

There are two ways of using the Next.js router to transition to another route
using
[`push`](https://nextjs.org/docs/api-reference/next/router#with-url-object).

The first, and perhaps more common, is by passing it a string.

```javascript
router.push('/search?tag=react')
```

This is great for simple routes. When routes require query params, this can
lead to error-prone string interpolation. That's where the second way comes in.

The second is to use a [URL
Object](https://nextjs.org/docs/api-reference/next/router#with-url-object)
instead of a string.

```javascript
router.push({
  pathname: '/search',
  query: { tag: 'react' }
})
```

Here we are working with an object. I find objects a bit easier to work with,
than strings, when doing programmatic things. Especially when it comes to
adding and removing query params.

# Remove A Query Param From The URL

Let's say you have a Next.js app. Sometimes users visit the app with special
query params. You want to extract the value of those query params, do something
with them, and then remove them from the URL.

This can be done with
[`next/router`](https://nextjs.org/docs/api-reference/next/router).

Let's say this component loads while the app URL is `/home?code=123`.

```javascript
import React, { useEffect } from "react";
import {useRouter} from "next/router";

function SomeComponent() {
  const router = useRouter();

  useEffect(() => {
    // extract the value from the query params
    const { code, ...updatedQuery } = router.query;

    if (!!code) {
      // do something with the extract query param
      doSomethingWithCode(code);

      // create an updated router path object
      const newPathObject = {
        pathname: router.pathname,
        query: updatedQuery
      }

      // update the URL, without re-triggering data fetching
      router.push(newPathObject, undefined, { shallow: true });
    }
  }, [])

  return (
   ...
  );
}
```

After the mount, the URL will read `/home` and the code will have done
something with the code value.

This is accomplished by destructuring the target query param apart from the
rest, constructing a new router path object with the rest of the query params,
and then [pushing that route update
_shallowly_](https://nextjs.org/docs/routing/shallow-routing) so that data
doesn't get refetched.

# Ship Public Assets With A Next.js App

A Next.js project includes a top-level `public` directory. Anything in this
directory at build time will be publicly available.

This is handy for things like a logo, cover image, or favicon.

If I create an `images` directory in `public` and then place an SVG in it:

```bash
$ ls public/images
logo.svg
```

Then I can reference that image in the HTML or JSX of my app pages, such as in
a `header.jsx` component.

```jsx
const Header = () => {
  <div>
    {/* a bunch of header and nav content */}
    <img className="logo" src="/images/logo.svg" />
  </div>
}
```

Notice it is publicly available at `/images/logo.svg`.

You can do this with other files as well. For instance, some kind of company
brochure PDF could be placed in `public` and you could link to it as a
download.

[source](https://nextjs.org/docs/basic-features/static-file-serving)

