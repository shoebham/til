### Category tailwind

---

 - [Base Styles For Text Link](#base-styles-for-text-link)
 - [Specify Paths For Purging Unused CSS](#specify-paths-for-purging-unused-css)
 - [Use Tailwind Typography Prose In Dark Mode](#use-tailwind-typography-prose-in-dark-mode)

---

# Base Styles For Text Link

[Tailwind CSS](https://tailwindcss.com/)'s base styles directive includes a CSS
reset called [Preflight](https://tailwindcss.com/docs/preflight). It normalizes
styling inconsistencies between browsers, and in the process it wipes out a
bunch of default styles you might be expecting.

A notable one is styling for a text link (`<a href ...>link</a>`). These tend
to be blue with an underline, use the _pointer_ cursor, and sometimes change
color slightly when you hover or _activate_ them.

Breaking from that mold a little, here is a reasonable base style for a text
link:

```html
<a
  className="underline text-purple-600 cursor-pointer hover:text-purple-800"
  href="https://twitter.com/jbrancha"
>
  twitter
</a>
```

This adds the `text-decoration: underline`, some color, the `cursor: pointer`,
and a slightly darker color on hover.

And for a slight variation, I'll make the `underline` text decoration appear
only on hover:

```css
<a
  className="hover:underline text-purple-600 cursor-pointer hover:text-purple-800"
  href="https://twitter.com/jbrancha"
>
  twitter
</a>
```

# Specify Paths For Purging Unused CSS

Tailwind CSS is a full-featured utility class CSS framework. It has just about
everything you need. It also has a bunch of things you probably don't need. And
there is no need to ship the CSS you don't need to the client. Tailwind is able
to exclude the unused CSS through a mechanism called _purging_.

To turn on purging (for _production_) and for Tailwind to know what can be
safely purged, you need to specify one or more _purge paths_ in your
`tailwind.config.js` file. This is a listing of all the places where you use
Tailwind utility classes.

Specify it with an array at the `purge` key:

```javascript
module.exports = {
  purge: [
    "./src/components/**/*.jsx",
    "./pages/**/*.js"
  ],
  darkMode: false,
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
```

Notice that globbed paths can be used as a way of specifying files located in a
nested directory structure. Above I've stated that any `jsx` files located
anywhere under `src/components/` as well as any `js` files located anywhere
under `pages/` should be checked.

[source](https://tailwindcss.com/docs/optimizing-for-production#basic-usage)

# Use Tailwind Typography Prose In Dark Mode

Tailwindcss can be set up to provide styled defaults for both standard (light)
mode and dark mode. Once this is set up, you can add a toggle mechanism to
switch between light and dark mode. [This
post](https://egghead.io/blog/tailwindcss-dark-mode-nextjs-typography-prose)
goes into all those details.

This can even be used with [Tailwind's
typography](https://github.com/tailwindlabs/tailwindcss-typography) plugin.
`typography` provides default styling which is great if you don't control the
markup that is being rendered or if you want to provide some defaults to a
chunk of markup.

A chunk of markup that uses typography will minimally look something like this:

```jsx
<div className="prose">
  <h1>{title}</h1>
  {markdownAsHtml}
</div>
```

To give this reasonable dark mode defaults, you'll need to add a `dark`-mode
class as well. Using the `dark` prefix, you can apply the `prose-dark` class to
the top-level div.

```jsx
<div className="prose dark:prose-dark">
  <h1>{title}</h1>
  {markdownAsHtml}
</div>
```

