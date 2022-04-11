### Category react-testing-library

---

 - [Check That A Component Renders As Null](#check-that-a-component-renders-as-null)
 - [findBy\* Queries Have Async Built In](#findby\*-queries-have-async-built-in)
 - [Pretty Print Some DOM To Debug A Test](#pretty-print-some-dom-to-debug-a-test)
 - [Test A Component That Uses React Portals](#test-a-component-that-uses-react-portals)

---

# Check That A Component Renders As Null

Consider a component that sometimes renders as `null`.

```javascript
const HiddenMessage = ({ message, hidden }) => {
  if (hidden) return null;

  return <span>{message}</span>;
};
```

How can we test the version of this component that renders as `null` when
`hidden` is `true`?

When
[react-testing-library](https://testing-library.com/docs/react-testing-library/intro)
renders a component, it wraps the whole thing in a surrounding `<div>`. Knowing
this, we can check if a component renders to `null` by checking the contents of
the wrapping `<div>` container.

```javascript
import React from "react";
import { render } from "@testing-library/react";
import "@testing-library/jest-dom/extend-expect";

test("renders as null", () => {
  const { container } = render(
    <HiddenMessage hidden message="You can't see me!" />
  );

  expect(container.firstChild).toBeNull();
});
```

The component renders as `null`, so the `firstChild` of the RTL `container`
will be `null`.

# findBy\* Queries Have Async Built In

The `getBy*` queries provided by [DOM Testing
Library](https://testing-library.com/docs/dom-testing-library/api-queries)
allow you to find an element by various criteria in the rendered component.
These queries are synchronous. If you need to find an element in response to an
async event, you'll have to wrap it in a `waitFor` call.

DOM Testing Library also provides a set of `findBy*` queries as a convenience
which have essentially wrapped the corresponding `getBy*` calls in `waitFor`
calls  under the hood.

You can use these with async/await:

```javascript
test("displays validation warnings for required fields", async () => {
  render(<MyFormComponent />);

  fireEvent.click(screen.getByText("Submit"));

  // validation on Name field
  const nameValidation = await screen.findByTestId("error-name");
  expect(nameValidation.innerHTML).toBe("Required");
});
```

[source](https://twitter.com/davidcrespo/status/1296639929376792577?s=20)

# Pretty Print Some DOM To Debug A Test

Our test's assertions can help guide what needs to change in the code.
Sometimes those test failures can be too opaque to be helpful.

It'd be easier if we could just take a peek at how the component is rendering.

```javascript
import { render, screen } from "@testing-library/react";
import { prettyDOM } from "@testing-library/dom";
import "@testing-library/jest-dom/extend-expect";

import MyComponent from "../MyComponent";

test("renders MyComponent", () => {
  const { container } = render(<MyComponent />);

  console.log(prettyDOM(container));

  const nameInput = screen.getByLabelText("Name");

  console.log(prettyDOM(nameInput));

  // some expectations
});
```

Passing the rendered container or elements that we've queried for to the
[`prettyDOM`](https://testing-library.com/docs/dom-testing-library/api-helpers#prettydom)
utility creates a formatted, syntax-highlighted version of that part of the
virtual DOM (without all the React Internal noise). This can then be logged out
for debugging purposes.

# Test A Component That Uses React Portals

When using
[react-testing-library](https://testing-library.com/docs/react-testing-library/intro)
to render a component that uses
[Portals](https://reactjs.org/docs/portals.html), you'll probably run into an
issue with your `Portal` code. When trying to set up the portal, it will fail
to find the portal's root element in the DOM.

```javascript
const portalRoot =
  global.document && global.document.getElementById("portal-root");
// portalRoot is null 😱
```

There are [a number of
solutions](https://github.com/testing-library/react-testing-library/issues/62).
[One
solution](https://github.com/testing-library/react-testing-library/issues/62#issuecomment-438653348),
recommended by KCD, is to add the portal's root element to the document if it's
not already there.

```javascript
let portalRoot =
  global.document && global.document.getElementById("portal-root");

if (!portalRoot) {
  portalRoot = global.document.createElement("div");
  portalRoot.setAttribute("id", "portal-root");
  global.document.body.appendChild(portalRoot);
}
```

By solving this issue directly in the portal's source code, you are making it
more reliable and don't have to add extra boilerplate to your test setup.

[source](https://github.com/testing-library/react-testing-library/issues/62#issuecomment-438653348)

