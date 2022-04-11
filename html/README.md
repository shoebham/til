### Category html

---

 - [Adding Alt Text To An Image](#adding-alt-text-to-an-image)
 - [Disable Auto-Completion For A Form Input](#disable-auto-completion-for-a-form-input)
 - [Prevent Search Engines From Indexing A Page](#prevent-search-engines-from-indexing-a-page)
 - [Render Text As Superscript](#render-text-as-superscript)
 - [Submit A Form With A Button Outside The Form](#submit-a-form-with-a-button-outside-the-form)

---

# Adding Alt Text To An Image

Images on their own are not accessible to anyone using a screen reader. As the
people putting content on the web, we can make images more accessible by
providing _alternative_ text. This is such a standard that linters not only
flag `<img />` tags that are missing the `alt` attribute, they also admonish
you for unhelpful description text like "image."

You can appease the linter and make your content accessible with some
descriptive text:

```html
<img src="some/image.jpg" alt="a graph with lines trending up" />
```

When appropriate, you can also choose to include the `alt` attribute with a
blank value.

> If an image is purely decorative, then we add alt="" to let screen readers
> know that it’s not important. But if an image is informative, then we need to
> be supplying a text alternative that describes the picture for anyone who’s
> using a screen reader or isn’t able to see the image.

Part of accessibility is not putting a bunch of noise in front of your users.
If the image isn't part of the content, use `alt=""`.

[source](https://24ways.org/2019/twelve-days-of-front-end-testing/)

# Disable Auto-Completion For A Form Input

The browser wants to be helpful by making informed suggestions about what
should be auto-filled into form inputs.

We may not want this behavior. It could be a source of data entry mistakes, an
annoyance, or just not something we want our users to experience.

We can turn this off at an individual field level with the `autocomplete`
attribute:

```html
<input type="email" id="email" name="email" autocomplete="off">
```

Note: It is `off` and not something like `false`.

[source](https://developer.mozilla.org/en-US/docs/Web/Security/Securing_your_site/Turning_off_form_autocompletion)

# Prevent Search Engines From Indexing A Page

The `robots.txt` file is commonly used to tell (well-behaved) crawlers, such as
search engines, to not visit a page. If another page links to your page, it
will still be indexed. To instruct search engines to not index a given page,
robot meta tags need to be used.

> If you want to reliably block a page from showing up in the search results,
> you need to use a meta robots `noindex` tag. That means that, in order to
> find the `noindex` tag, the search engine has to be able to access that page,
> so don’t block it with `robots.txt`.
> [source](https://yoast.com/ultimate-guide-robots-txt/)

To prevent indexing, add the following meta tag to the `<head>` section of any
relevant pages.

```html
<meta name="robots" content="noindex">
```

[source](https://developers.google.com/search/docs/advanced/crawling/block-indexing)

# Render Text As Superscript

There is an [HTML
tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/sup) that
tells browser engines to render text as superscript -- like when you need an
exponent.

```
<p>Render this text as <sup>superscript</sup>!</p>
```

Here is what the above would look like:

<p>Render this text as <sup>superscript</sup>!</p>

Check out this [codepen example](https://codepen.io/jbranchaud/pen/GzoyXe)
to play around with it.

# Submit A Form With A Button Outside The Form

You can tie a submit button to a form that the button doesn't live inside
of. The trick is to give the form an `id` and then reference that `id` with
the button's `form` property.

```html
<div>
  <form id="my-form">
    <label for="name">Name:</label>
    <input type="text" name="name"></input>
  </form>

  <!-- ... -->

  <button type="submit" form="my-form">Submit</button>
</div>
```

With this setup, clicking the _Submit_ button will cause the form to be
submitted.

See the [MDN Button
docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button) for
more details.

