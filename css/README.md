### Category css

---

 - [Add Fab Icons To Your Site With FontAwesome 5](#add-fab-icons-to-your-site-with-fontawesome-5)
 - [Animate Smoothly Between Two Background Colors](#animate-smoothly-between-two-background-colors)
 - [Apply Multiple Box Shadows To Single Element](#apply-multiple-box-shadows-to-single-element)
 - [Apply Styles Based On Dark-Mode Preferences](#apply-styles-based-on-dark-mode-preferences)
 - [Apply Styles To The Last Child Of A Specific Type](#apply-styles-to-the-last-child-of-a-specific-type)
 - [Change The Orientation Of An Image](#change-the-orientation-of-an-image)
 - [Circular Icons With A Massive Border Radius](#circular-icons-with-a-massive-border-radius)
 - [Clean Up Repetition With :is() Pseudo-Class](#clean-up-repetition-with-:is()-pseudo-class)
 - [Conditional Styling For Unsupported CSS Features](#conditional-styling-for-unsupported-css-features)
 - [Create A Pulsing Background With CSS Animation](#create-a-pulsing-background-with-css-animation)
 - [Define CSS Custom Properties With SCSS Variables](#define-css-custom-properties-with-scss-variables)
 - [Define HSL Colors With Alpha Values](#define-hsl-colors-with-alpha-values)
 - [Display Responsive iframe Maintaining Aspect Ratio](#display-responsive-iframe-maintaining-aspect-ratio)
 - [Dry Up SCSS With Mixins](#dry-up-scss-with-mixins)
 - [Give Elements The Same Width With Flexbox](#give-elements-the-same-width-with-flexbox)
 - [Let Pointer Events Pass Through An Element](#let-pointer-events-pass-through-an-element)
 - [Lighten And Darken With CSS Brightness Filter](#lighten-and-darken-with-css-brightness-filter)
 - [Lighten And Darken With SCSS](#lighten-and-darken-with-scss)
 - [Make A Block Of Text Respect New Lines](#make-a-block-of-text-respect-new-lines)
 - [Parameterized SCSS Mixins](#parameterized-scss-mixins)
 - [:root Has Higher Specificity Than html](#:root-has-higher-specificity-than-html)
 - [Style A Background With A Linear Gradient](#style-a-background-with-a-linear-gradient)
 - [Using Maps In SCSS](#using-maps-in-scss)

---

# Add Fab Icons To Your Site With FontAwesome 5

Check out the latest version of [FontAwesome](https://fontawesome.com/).

> Version 5 has been re-written and re-designed completely from scratch.

One part of the rewrite is that _brand_ icons have been organized into their
own collection. Whether you are using the full suite or just the brands
bundle, you'll be referencing these icons with the `fab` class name.

```html
<i class="fab fa-react" />
```

This will give you a React icon.

Check out all the different [_brand_ icons
here](https://fontawesome.com/icons?d=gallery&s=brands).

# Animate Smoothly Between Two Background Colors

CSS animations allow you to set up simple rules that the rendering engine
can then apply to create smooth transitions between style states.

To smoothly transition between two background colors, we can create a
keyframes at-rule with a fitting name (e.g. `pulse`).

```css
@keyframes pulse {
  0% {
    background-color: red;
  }
  50% {
    background-color: blue;
  }
  100% {
    background-color: red;
  }
}
```

Over the course of a single animation, this set of rules will start the
background color at red, transition to blue 50% of the way through, and then
back to red again.

We can then apply this animation within any of our CSS class definitions.

```css
.square1 {
  animation: pulse 2s infinite;
  width: 100px;
  height: 100px;
}
```

Anything with a class of `square1` will have a width and height of `100px`
as well as a pulsing background color.

# Apply Multiple Box Shadows To Single Element

Multiple box-shadows can be applied to the same DOM element. The `box-shadow`
property accepts a comma-separated list of `box-shadow` directives.

Here is a pretty nasty looking example from the [MDN
docs](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow#Syntax):

```css
/* Any number of shadows, separated by commas */
box-shadow: 3px 3px red, -1em 0 0.4em olive;
```

Here is a more practical [example](https://codepen.io/jbranchaud/pen/GRReaxo):

```css
box-shadow: 0 0 0 2px #4caf50,
  0 3px 5px 0 rgba(0,0,0,0.5);
```

This gives the effect of a solid border with some shadow for depth.

Multiple shadows has [pretty robust browser
support](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow#Browser_compatibility).

[source](https://stackoverflow.com/questions/8556604/is-there-a-way-to-use-two-css3-box-shadows-on-one-element/8556627)

# Apply Styles Based On Dark-Mode Preferences

There is a CSS media query for whether a user prefers a Dark-Mode or Light-Mode
color scheme. If you're site is able to provide styling for both modes, then
you can hook into those preferences like so:

```css
@media (prefers-color-scheme: dark) {
  /* dark-mode styles */
  /* perhaps changing some custom properties */
}

@media (prefers-color-scheme: light) {
  /* light-mode styles */
  /* perhaps changing some custom properties */
}
```

As of this writing,
[`prefers-color-scheme`](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)
is still in a draft state, but it already has decent browser support.

[source](https://24ways.org/2019/interactivity-and-animation-with-variable-fonts/)

# Apply Styles To The Last Child Of A Specific Type

The
[`:last-child`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child)
pseudo-class is a way of specifying styling that will only be applied to an
element if it is the last child among its siblings. What if we have elements
that are declared amongst elements of another type? This can complicate that
styling.

The styling

```css
span:last-child {
  color: red;
}
```

won't take effect on our last `span` here

```html
<div>
  <span>One</span>
  <span>Two</span>
  <span>Three</span>
  <div>Something unrelated</div>
</div>
```

because amongst its siblings it isn't the last.

One way of getting around this is with the
[`:last-of-type`](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
pseudo-class.

```css
span:last-of-type {
  color: red;
}
```

See a [live example here](https://codepen.io/jbranchaud/pen/JLEyLP).

# Change The Orientation Of An Image

A single-line CSS transform is all it takes to change the orientation of an
image (or any DOM element, really).

For instance, if I have an image that is _on its side_, I can use the following
[`rotate`
transform](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate)
to orient it correctly.

```css
img {
  transform: rotate(90deg);
}
```

It takes an angle which can be specified in degrees. Here I use `90deg`. If I
was going for a different effect, I could do something like `45deg`.

# Circular Icons With A Massive Border Radius

Elements by nature are rectangular. By adding some `border-radius`, you can
soften the edges a bit. If you add a massive amount of `border-radius`, you
effectively make the element round.

```css
div.circle {
  border-radius: 50000px;
}
```

Here is a [live example](https://codepen.io/jbranchaud/pen/bGGJKJW).

# Clean Up Repetition With :is() Pseudo-Class

You can use the [`:is()`](https://developer.mozilla.org/en-US/docs/Web/CSS/:is)
pseudo-class to match on a number of different selectors in a concise way. For
instance, here is how you can make some CSS shorter and more readable:

```css
/* before */
h1.text--bold, h2.text--bold, h3.text--bold, h4.text--bold, h5.text--bold {
  font-weight: 500;
}

/* after */
:is(h1, h2, h3, h4, h5).text--bold {
  font-weight: 500;
}
```

Here is how [CSS-tricks](https://css-tricks.com/almanac/selectors/i/is/)
describes it:

> :is() is the current name for the "Matches-Any" pseudo-class in the CSS4
working draft. The goal of the "Matches Any" selector (with all of it's names)
is to make complex groupings of selectors easier to write.

It still has limited browser support, so use it sparingly.

# Conditional Styling For Unsupported CSS Features

As much as possible, you should aim to use CSS features that have broad browser
support. Sometimes browsers lag behind or you'd like to take advantage of a
draft feature in browsers that support it.

For these situations, you can provide conditional styling using the
[`@supports`
at-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/@supports).

Here is an example of conditionally using `display: grid` if it is supported:

```css
@supports (display: grid) {
  div {
    display: grid;
  }
}
```

In [this
article](https://24ways.org/2019/zs-still-not-dead-baby-zs-still-not-dead/)
there is an example of using `background-blend-mode` and falling back to
`background-image` if it isn't supported.

```css
@supports not (background-blend-mode: normal) {
  body {
    background-image: url(fallback.png); 
  }
}
```

# Create A Pulsing Background With CSS Animation

You can create a smoothly pulsing background effect with CSS animations. This
can be achieved by defining a set of keyframes that start at one background
color, transitions to another color, and then transitions back to the original
color.

```css
@keyframes pulse {
  0%, 100% {
    background-color: #f56a3f;
  }
  50% {
    background-color: #9e42b0;
  }
}
```

At the beginning (`0%`) and end (`100%`) we declare the background color to be
`#f56a3f`. Halfway through (`50%`) it should be `#9e42b0`. The browser will
animate everything in between.

This can then be applied infinitely with a lengthy duration to give it a real
smooth feel.

```css
body {
  animation: pulse 20s infinite;
}
```

Here is a [live example](https://codepen.io/jbranchaud/pen/vYYqQjO).

[source](https://css-tricks.com/almanac/properties/a/animation/)

# Define CSS Custom Properties With SCSS Variables

It doesn't work to directly declare a CSS custom property using SCSS variables
like this:

```css
$primary-action: #057A5B;

.btn-primary {
  --button-color: $primary-action;
}
```

After SCSS pre-processing, the resulting CSS will look like this:

```css
.btn-primary {
  --button-color: $primary-action;
}
```

Instead of the variable being translated into its declared value (`#057A5B` in
this case), it is left as is.

This is because CSS custom property syntax is unusual enough that it gets
processed literally. The only way to incorporate a variable is with
_interpolation_.

```css
$primary-action: #057A5B;

.btn-primary {
  --button-color: #{$primary-action};
}
```

Wrapping the SCSS variable in interpolation syntax (`#{ ... }`) will do the
job.

[source](https://sass-lang.com/documentation/style-rules/declarations#custom-properties)

# Define HSL Colors With Alpha Values

HSL is a more intuitive option for defining colors in CSS.

It is an acronym which stands for Hue, Saturation, and Lightness which are the
three components of an HSL value. It is also possible to include a fourth
value: Alpha for the amount of transparency of the color.

The modern syntax allows you to use `hsl` with or without an alpha value, and
no need to use comma separators. If the alpha value is included, it must be
separated from the other three values with a forward slash.

```css
.modern-hsl {
  background-color: hsl(340deg 100% 50%);
}
.modern-hsla {
  background-color: hsl(340deg 100% 50% / 0.75);
}
```

If you need IE-support, then you'll have to use the older syntax. This version
of `hsl` requires comma separators, and to apply an alpha value you have to
switch to `hsla`.

```css
.old-hsl {
  background-color: hsl(340deg, 100%, 50%);
}
.old-hsla {
  background-color: hsla(340deg, 100%, 50%, 0.75);
}
```

You can see it in action and play around with the value in this [live
example](https://codepen.io/jbranchaud/pen/gOLVzjx?editors=1100).


See [Can I Use? on HSL](https://caniuse.com/?search=hsl) for more details on
browser support.

h/t to [Josh Comeau](https://twitter.com/JoshWComeau) and his excellent [CSS
for JS Developers course](https://css-for-js.dev/)

# Display Responsive iframe Maintaining Aspect Ratio

Generally when rendering an iframe, you'll specify the `width` and `height`
properties to give it a fixed display size.

You can make the iframe responsively expand to the full width of its parent
while maintaining its aspect ratio using a little CSS.

First, remove the `width` and `height` properties.

Second, add a wrapping iframe container:

```html
<div class="iframe-container">
  <iframe src="https://www.youtube.com/embed/7LDlUMMbv6k" ...></iframe>
</div>
```

Third, sprinkle on a little CSS to make it responsive:

```css
.iframe-container {
  position: relative;
  overflow: hidden;
  /* 16:9 aspect ratio */
  padding-top: 56.25%;
}

.iframe-container iframe {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  border: 0;
}
```

Ben Marshall has a whole [guide to responsive
iframes](https://www.benmarshall.me/responsive-iframes/).

# Dry Up SCSS With Mixins

If you have a similar chunk of styling that is being duplicated across your
CSS, you'd probably like to dry it up to reduce the pain of maintaining it.
Mixins provide one way of dealing with this problem.

First, declare a named mixin of the styles that you are trying to dry up.

```css
@mixin navigation {
  nav {
    display: flex;
    justify-content: space-around;

    ul {
      list-style: none;

      li a {
        text-decoration: none;
      }
    }
  }
}
```

Then, this mixin can be _included_ wherever it is needed.

```css
div.base-nav {
  @include navgation;
  background-color: #fff;
  color: #444;

  nav ul {
    li a:hover {
      color: #222;
    }
  }
}

div.admin-nav {
  @include navgation;
  background-color: #000;
  color: #fff;

  nav ul {
    li a:hover {
      color: #ddd;
    }
  }
}
```

Any subsequent changes to the core navigation styling only need to be made
in one place, the mixin.

[source](http://sass-lang.com/guide)

h/t Dorian Karter

# Give Elements The Same Width With Flexbox

By default, a row of elements in a basic flex container are going to have
dynamic widths that accommodate their contents. This may not be desirable if
you're going for a uniform look. You could give all child elements a fixed
width (e.g. `width: 100px`), but that loses out on the _flexibility_ of a
flexbox layout.

You can instead give all child elements a uniform and flexible width using the
`flex` property.

```css
.flex-container {
  display: flex;
}

.flex-child {
  flex: 1;
}
```

This value is a relative ratio. If all children of the flex container have the
same `flex` value (i.e. `1`), then they will all be equally sized and that size
will adjust as the width of the flex container changes.

[source](https://css-tricks.com/the-thought-process-behind-a-flexbox-layout/)

# Let Pointer Events Pass Through An Element

A graphical element can absorb a click event preventing your preferred target
from recieving it. And nothing will happen. If the element is purely for visual
effect, then there is some CSS you can add so that the underlying element will
receive the click event.

```css
.ignore-clicks {
  pointer-events: none;
}
```

The [`pointer-events`](https://developer.mozilla.org/en-US/docs/Web/CSS/pointer-events) property specifies if and how an element "can become the target of pointer events."

> In addition to indicating that the element is not the target of pointer
> events, the value none instructs the pointer event to go "through" the
> element and target whatever is "underneath" that element instead.

[source](https://bradfrost.com/blog/post/overcomplicatin/)

# Lighten And Darken With CSS Brightness Filter

CSS has a `filter` property that can be used with a variety of filter
functions. One of them is the `brightness()` filter. By feeding a percentage
less than `100%` to `brightness()`, the target element will be made darker.
Inversely, feeding a percentage greater than `100%` to `brightness()` will
make the element brighter.

```css
.brighter-span {
  filter: brightness(150%);
}

.darker-span {
  filter: brightness(50%);
}
```

![brighter, regular, and darker spans](https://i.imgur.com/q4oy1d0.png)

See this [CSS Tricks Article on the `filter`
property](https://css-tricks.com/almanac/properties/f/filter/) for more
details. Check out the browser support story
[here](http://caniuse.com/#feat=css-filters).

# Lighten And Darken With SCSS

With SCSS, a color can be lightened or darkened by a certain percentage
using the
[`lighten`](http://sass-lang.com/documentation/Sass/Script/Functions.html#lighten-instance_method)
and
[`darken`](http://sass-lang.com/documentation/Sass/Script/Functions.html#darken-instance_method)
functions, respectively.

For instance, given the following HTML

```html
<div class='one'></div>
<div class='two'></div>
<div class='three'></div>
```

I can style `div.two` with the original color and then style `div.one` with
a lightened version and `div.three` with a darkened version.

```scss
$box-color: #0074d9;

.two {
  background: $box-color;
}
.one {
  background: lighten($box-color, 20%);
}
.three {
  background: darken($box-color, 20%);
}
```

The result looks something like this:

![](http://i.imgur.com/SaeTL8H.png)

# Make A Block Of Text Respect New Lines

Generally when we fill a `div` tag full of text, it will display it one long
strand irrespective of any line breaks that are included. This is a great
default, but not necessarily what we want when we are displaying text from
another source, such as our users.

We can convince a block of text to respect new lines by adding a couple CSS
properties.

```css
.multiline-text {
  word-wrap: break-word;
  white-space: pre-line;
}
```

The first rule, `word-wrap: break-word`, ensures that long lines of text
uninterrupted by new lines respect the boundaries of our wrapping element.
The second rule, `white-space: pre-line`, handles squashing of extra white
space and respecting of new lines.

See a [working example here](https://codepen.io/anon/pen/bQpKyv).

# Parameterized SCSS Mixins

A mixin can be made to be much more versatile by parameterizing it. If you
need variations of a block of CSS, then move the parts that vary out into
parameters to the mixin.

```css
@mixin navigation($background-color, $color, $link-color) {
  nav {
    display: flex;
    justify-content: space-around;
    background-color: $background-color;
    color: $color;

    ul {
      list-style: none;

      li a {
        text-decoration: none;
        color: $link-color;
      }
    }
  }
}

div.base-nav {
  @include navgation(#fff, #444, #222);
}

div.admin-nav {
  @include navgation(#000, #fff, #ddd);
}
```

The mixin can now easily be used to customize different segments of your
app's styling.

# :root Has Higher Specificity Than html

The `:root` CSS pseudo-selector and `html` will target the same element --
`<html>`, but `:root` has higher specificity. That means the property rules
declared under `:root` will take precedence over those under `html`.

```css
:root {
  background: red;
}

html {
  background: blue;
}
```

In the case of the above code, the `<html>` element's background color will
be `red`.

[source](https://developer.mozilla.org/en-US/docs/Web/CSS/:root)

# Style A Background With A Linear Gradient

The
[`linear-gradient`](https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient)
function in its simplest form can be used to style the background of an
element with a vertical, linear gradient between two colors.

![gradient example](https://i.imgur.com/Jybn4MB.png)
See the Pen <a href='https://codepen.io/jbranchaud/pen/pQpypW/'>pQpypW</a> by Josh Branchaud (<a href='https://codepen.io/jbranchaud'>@jbranchaud</a>) on <a href='https://codepen.io'>CodePen</a>.

Here is what the CSS looks like:

```css
.container {
  background: linear-gradient(#00449e, #e66465);
}
```

The background of any element with the `container` class will be styled with
a linear gradient that transitions from `#00449e` to `#e66465`.

# Using Maps In SCSS

You can collect a set of like values into a
[map](https://sass-lang.com/documentation/values/maps) with the following SCSS
syntax:

```scss
$backgrounds: (
  "gray": #AAAAAA,
  "red": #FF4136,
  "blue": #0074D9,
);
```

You can then access a value from the map using the [`map-get`
function](https://sass-lang.com/documentation/values/maps#look-up-a-value):

```scss
.boxA {
  background-color: map-get($backgrounds, "gray");
}

.boxB {
  background-color: map-get($backgrounds, "red");
}

.boxC {
  background-color: map-get($backgrounds, "blue");
}
```

See a [live example here](https://codepen.io/jbranchaud/pen/WVJrgp).

