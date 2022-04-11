### Category react

---

 - [A Component Is Just A Bag Of Data](#a-component-is-just-a-bag-of-data)
 - [Access The Latest Lifecycle Methods In An Old App](#access-the-latest-lifecycle-methods-in-an-old-app)
 - [Access Env Vars In create-react-app](#access-env-vars-in-create-react-app)
 - [Accessing Location Within @reach/router](#accessing-location-within-@reach/router)
 - [Allow md As An Extension With gatsby-mdx](#allow-md-as-an-extension-with-gatsby-mdx)
 - [Alter The Display Name Of A Component](#alter-the-display-name-of-a-component)
 - [Building A React App In The Browser](#building-a-react-app-in-the-browser)
 - [Check The Type Of A Child Component](#check-the-type-of-a-child-component)
 - [Conditionally Including Event Handler Functions](#conditionally-including-event-handler-functions)
 - [Create A Snowpack-Bundled React App](#create-a-snowpack-bundled-react-app)
 - [Create Dynamically Named Custom React Components](#create-dynamically-named-custom-react-components)
 - [create-react-app Comes With Lodash](#create-react-app-comes-with-lodash)
 - [create-react-app Has A Default Test Setup File](#create-react-app-has-a-default-test-setup-file)
 - [CSS !important Is Not Supported By Inline Styles](#css-!important-is-not-supported-by-inline-styles)
 - [Debug Jest Tests In create-react-app](#debug-jest-tests-in-create-react-app)
 - [Defining State In A Simple Class Component](#defining-state-in-a-simple-class-component)
 - [Destructure Variables As Props To A Component](#destructure-variables-as-props-to-a-component)
 - [Details Tags Are A Controllable Component](#details-tags-are-a-controllable-component)
 - [Dispatch Anywhere With Redux](#dispatch-anywhere-with-redux)
 - [Dynamically Add Props To A Child Component](#dynamically-add-props-to-a-child-component)
 - [Dynamically Create HTML Elements](#dynamically-create-html-elements)
 - [Enforce Specific Values With PropTypes](#enforce-specific-values-with-proptypes)
 - [Focus An Input With useRef Hook](#focus-an-input-with-useref-hook)
 - [Force A Component To Only Have One Child](#force-a-component-to-only-have-one-child)
 - [Forcing A Child Remount With The Key Prop](#forcing-a-child-remount-with-the-key-prop)
 - [Formik Connected Components](#formik-connected-components)
 - [Formik's Validation Schema As A Function](#formik's-validation-schema-as-a-function)
 - [Inactive And Active Component Styles With Radium](#inactive-and-active-component-styles-with-radium)
 - [Inline Style Attributes Should Be Camel Cased](#inline-style-attributes-should-be-camel-cased)
 - [Manage State In A Functional Component](#manage-state-in-a-functional-component)
 - [Mapping Over One Or Many Children](#mapping-over-one-or-many-children)
 - [Mock A Function That A Component Imports](#mock-a-function-that-a-component-imports)
 - [Navigate With State Via @reach/router](#navigate-with-state-via-@reach/router)
 - [Pairing A Callback With A useState Hook](#pairing-a-callback-with-a-usestate-hook)
 - [Pass A Function To A useState Updater](#pass-a-function-to-a-usestate-updater)
 - [Passing Props Down To React-Router Route](#passing-props-down-to-react-router-route)
 - [Prevent reach/router Redirect Error Screen In Dev](#prevent-reach/router-redirect-error-screen-in-dev)
 - [Proxy To An API Server In Development With CRA](#proxy-to-an-api-server-in-development-with-cra)
 - [Quickly Search For A Component With React DevTools](#quickly-search-for-a-component-with-react-devtools)
 - [@reach/router Renders To A Div](#@reach/router-renders-to-a-div)
 - [Read Only Input Elements](#read-only-input-elements)
 - [Rendering Multiple Nodes With Fragments](#rendering-multiple-nodes-with-fragments)
 - [Set The Type For A useState Hook](#set-the-type-for-a-usestate-hook)
 - [Specifying Dependencies Of A useEffect Hook](#specifying-dependencies-of-a-useeffect-hook)
 - [Spelunking Through Components With Enzyme's Dive](#spelunking-through-components-with-enzyme's-dive)
 - [Sync Your react-router State With Redux](#sync-your-react-router-state-with-redux)
 - [Test Files In create-react-app](#test-files-in-create-react-app)
 - [Test That Element Does Not Render In The Component](#test-that-element-does-not-render-in-the-component)
 - [Trigger Effect Only When The Component Mounts](#trigger-effect-only-when-the-component-mounts)
 - [Update Formik Initial Values When Props Change](#update-formik-initial-values-when-props-change)
 - [Upgrading To The Latest React In CodeSandbox](#upgrading-to-the-latest-react-in-codesandbox)
 - [Use A Ref To Autofocus An Input](#use-a-ref-to-autofocus-an-input)
 - [Use React 16 With Gatsby](#use-react-16-with-gatsby)
 - [Use withRouter To Pass Down React-Router History](#use-withrouter-to-pass-down-react-router-history)
 - [Visually Select A React Element For Inspection](#visually-select-a-react-element-for-inspection)
 - [Who Is Your Favorite Child?](#who-is-your-favorite-child?)
 - [Wrap The Root Of A Gatsby App In A Component](#wrap-the-root-of-a-gatsby-app-in-a-component)

---

# A Component Is Just A Bag Of Data

If you write enough React using JSX, it is easy to forget that you're not
working with markup. Everything -- `div`s, `h1`s, 3rd party components, your
components -- all get boiled down to JavaScript objects full of data.

Any given React component is really just a bag of data. Try doing a
`console.log` to see. Here is an example from an [earlier
post](https://github.com/jbranchaud/til/blob/master/react/dynamically-add-props-to-a-child-component.md).

```javascript
const ParentWithClick = ({ children }) => {
  return (
    <React.Fragment>
      {React.Children.map(children || null, (child, i) => {
        console.log(child);
        return <child.type {...child.props} key={i} onClick={handleClick} />;
      })}
    </React.Fragment>
  );
};

const App = () => (
  <div>
    <ParentWithClick>
      <span>Click this span</span>
    </ParentWithClick>
  </div>
);
```

Looking in the console, we see the following output:

```
Object {type: "span", key: null, ref: null, props: Object, _owner: Object…}
 type: "span"
 key: null
 ref: null
 props: Object
  children: "Click this span"
 _owner: Object
 _store: Object
```

It contains information about the component itself and because of the tree
structure of this data, you could potentially expand the `props` -->
`children` sections several times for certain components.

See a [live example here](https://codesandbox.io/s/l41pj382x7).

# Access The Latest Lifecycle Methods In An Old App

With [the release of React
16.3](https://reactjs.org/blog/2018/03/29/react-v-16-3.html) we have access
to some [new lifecycle
methods](https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html)
and are in the first phase of what will eventually result in the deprecation
and removal of `componentWillMount`, `componentWillReceiveProps`, and
`componentWillUpdate`.

You may not be ready to move your project to React 16.3, but that doesn't
mean you can't start migrating your lifecycle methods now. We'll need a
polyfill --
[react-lifecycles-compat](https://github.com/reactjs/react-lifecycles-compat).

```javascript
import React from 'react';
import { pollyfill } from 'react-lifecycles-compat';

class MyComponent extends React.Component {
  static getDerivedStateFromProps(nextProps, prevState) {
    // ...
  }

  render() { ... }
}
polyfill(MyComponent)

export default MyComponent;
```

For any of our class components for which we'd like to start using the new
lifecycle methods, we just need to import the polyfill function and then
transform the class component with the polyfill before exporting it.

[source](https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html#open-source-project-maintainers)

# Access Env Vars In create-react-app

Environment-specific configurations are an important part of most
applications. You can access environment variables in your create-react-app
code using `process.env`.

There are a couple built-in environment variables, such as `NODE_ENV`.
Anything custom that you want to provide must be prepended with
`REACT_APP_`. If it isn't, that environment variable will be ignored with no
warning.

The following line of code

```javascript
const base_api_url = process.env.REACT_APP_BASE_API_URL;
```

will have access to whatever that value is in the environment when the
server is started or the app is built.

Set that value inline like so:

```
REACT_APP_BASE_API_URL="https://api.my_app.com" yarn start
```

[source](https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#adding-custom-environment-variables)

# Accessing Location Within @reach/router

The API of [`@reach/router`](https://reach.tech/router) departs a bit from
[`react-router`](https://reacttraining.com/react-router/) in a couple ways.
The `location` prop which you may be used to having access to automatically
is instead available through the
[`Location`](https://reach.tech/router/api/Location) component.

```javascript
import React from 'react';
import { Location } from '@reach/router';

const MyComponent = () => {
  return (
    <Location>
      {({ location }) => {
        return <p>Current Location: {location.pathname}</p>;
      }}
    </Location>
  );
}
```

This is a contrived example, but you can imagine how you'd use it to access
`state` or even create an HOC similar to `withRouter`.

# Allow md As An Extension With gatsby-mdx

The [gatsby-mdx](https://github.com/ChristopherBiscardi/gatsby-mdx) plugin
allows you to create pages in a Gatsby project using `.mdx` files. If you
prefer the `.md` extension on your markdown files, then you can adjust the
plugin options to allow that.

```javascript
// gatsby-config.js
plugins: [
  {
    resolve: `gatsby-mdx`,
    options: {
      extensions: [".mdx", ".md"]
    }
  }
]
```

This tells `gatsby-mdx` to recognize both `.mdx` and `.md` extensions when
processing files.

# Alter The Display Name Of A Component

Components adopt their display name from the class or function that renders
them. A component's display name becomes important to know about as soon as
you start digging through the [React
devtools](https://github.com/facebook/react-devtools) interface -- whether
debugging or just perusing the component hierarchy, the display names of
components is what you'll see. In most circumstances, the display name is
good enough as is. If you want or need to, you can change it.

```javascript
const Hello = ({ name }) => {
  return (
    <h1>{name}</h1>
  );
};
Hello.displayName = "Hola";
```

By setting the `displayName` property on this component, you are able to
alter what name is used by React devtools.

This can be useful when bringing in a 3rd party library or
component that doesn't use a display name that you find helpful -- in
particular when using Higher Order Components.

# Building A React App In The Browser

There are a couple relatively new tools that give you just about everything
you need to build a React app in the browser.

The first is [CodeSandbox](https://codesandbox.io/). It has a couple
pre-configured environments for different technologies. The main one is
React. CodeSandbox describes itself as such:

> an online editor that helps you create web applications, from prototype to
> deployment.

The second, which just released out of beta, is
[Glitch](https://glitch.com/) which comes with projects like
[react-starter](https://glitch.com/~starter-react) so that you can jump into
a React project that is ready to roll. Glitch describes itself as:

> the friendly community where you'll build the app of your dreams

You can quickly build and publish React apps in either of these and share
them with the world.

# Check The Type Of A Child Component

There is a simple way to check the type of a child component.

```javascript
import React from 'react';

const Hello = () => <h1>Hello</h1>;

const Greeting = ({ children }) => {
  let hello;
  React.Children.forEach(children, child => {
    if(child.type === Hello) {
      hello = child;
    }
  });

  return hello;
};
```

This is a comparison of the child's type to the component constant we are
looking for.

This comparison is not the most robust. For instance, Gatsby does something
internally that throws off this comparison. Here is a more robust
comparison.

```javascript
if(child.type === Hello || child.type === <Hello />.type)
```

[source](https://github.com/gatsbyjs/gatsby/issues/3486)

# Conditionally Including Event Handler Functions

React makes a variety of [synthetic DOM
events](https://reactjs.org/docs/events.html) available to your component.
Events such as `onClick`, `onKeyPress`, `onSubmit`, etc. When specifying one of
these event handlers, you must supply a function.

To conditionally include an event handler, you may be tempted to do this:

```javascript
<Toggler
  onKeyPress={someCondition && handleKeyPress}
/>
```

This means that `onKeyPress` will receive `false` when `someCondition` is
`false`. That is a prop type violation. Instead, you should use a ternary
statement.

```javascript
<Toggler
  onKeyPress={someCondition ? handleKeyPress : undefined}
/>
```

If `someCondition` is `false`, then the prop will be set as `undefined` and
that prop won't be defined.

# Create A Snowpack-Bundled React App

> [Snowpack](https://www.snowpack.dev/) is a modern, lightweight toolchain for
> web application development.

You can get started using snowpack with this `npx` command.

```bash
npx create-snowpack-app my-app
```

This command uses a base template that is pre-configured to use the snowpack
defaults.

You can take this a step further by using a specialized template for React
apps.

```bash
npx create-snowpack-app react-client --template @snowpack/app-template-react
```

An advantage this has over
[create-react-app](https://github.com/facebook/create-react-app) is there is no
ejecting needed to do something like pull in [PostCSS](https://postcss.org/).

# Create Dynamically Named Custom React Components

A React element is as simple as a function that returns some valid JSX. Any
function will do.

```javascript
const CustomComponent = ({ children }) => {
  return (
    <React.Fragment>{children}</React.Fragment>
  );
};
```

This function provides us with a React component that has a fixed name --
`CustomComponent`. With the help of the [`displayName`
property](https://reactjs.org/docs/react-component.html#displayname), we can
create dynamically named components.

```javascript
const ComponentGenerator = ({ customName, children }) => {
  const CustomComponent = ({ children }) => {
    return (
      <React.Fragment>{children}</React.Fragment>
    );
  };
  CustomComponent.displayName = customName;

  return (
    <CustomComponent>{children}</CustomComponent>
  );
};

const App = () => {
  return (
    <ComponentGenerator customName="RandomComponentName">
      Hello!
    </ComponentGenerator>
  );
}
```

If we inspect the generated React tree, we will not see anything called
`<CustomComponent>`, but instead we will see our `<RandomComponentName>`
component.

Remember, React components need to have an uppercase name.

# create-react-app Comes With Lodash

[Lodash](https://lodash.com/) is already a dependency of
[create-react-app](https://github.com/facebook/create-react-app). If you
need one of those fancy Lodash functions, there's no need to `yarn add
lodash` to your project, all you need is an import statement.

```javascript
import chunk from 'lodash/chunk';
```

h/t Dillon Hafer

# create-react-app Has A Default Test Setup File

In [_Configure Jest To Run A Test Setup
File_](https://github.com/jbranchaud/til/blob/master/javascript/configure-jest-to-run-a-test-setup-file.md),
I pointed to a way of configuring Jest in either the `package.json` or
`jest.config.js` file with the `setupTestFrameworkScriptFile` value.

In a `create-react-app` project, this is not an option because
`setupTestFrameworkScriptFile` is not one of the permitted config values for
Jest.

There is a built-in value which happens to match what was recommended in the
above post -- `<rootDir>src/setupTests.js`.

This means that there is no configuration required. Instead, just create a
`setupTests.js` file in the `src` directory of your CRA project and add any
framework setup you need there. That file is already configured to run when
you invoke `yarn test`.

[source](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#initializing-test-environment)

# CSS !important Is Not Supported By Inline Styles

You can get pretty far with React's inline styling of components. There are
however a few limitations. One such limitation is that the `!important`
clause is not supported.

If you try applying `!important` to an inline style like so:

```jsx
<div style={{ color: "red !important" }}>
  My div
</div>
```

You'll be disappointed when you open up the browser and inspect that `div`
tag. The `color` rule will be ignored and excluded from the output html.

[source](https://github.com/facebook/react/issues/1881)

# Debug Jest Tests In create-react-app

When you put a `debugger;` statement in one of your Jest tests and
run `yarn test`, the test runner will ignore the debug statement and run to
completion. This is because Jest defaults to parallelizing tests which won't
mix well with manual debugging intervention.

If we want to be able to run our Jest tests through a debugger. We will need
two things. First, we need a debugging environment -- Chrome's devtools will
work well for this. Second, we need our tests to run in band. The
[`react-scripts`
documentation](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#debugging-tests)
recommends adding a second, debug-specific test command to your
`package.json`:

```javascript
"scripts": {
  "test:debug": "react-scripts --inspect-brk test --runInBand --env=jsdom"
}
```

You can now run `yarn test:debug` which will start a paused debug session.
Open chrome at `chrome://inspect` to access and open the debugging session
panel. Now, debug away.

# Defining State In A Simple Class Component

Most class components start off with a constructor which does some
initialization of the component including setting the components initial
state. It might look something like the following:

```javascript
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: true
    };
  }

  render() {
    if (this.state.loading) {
      return (
        <p>Loading...</p>
      );
    } else {
      // ...
    }
  }
}
```

If setting state is the only thing you need to do in the constructor,
then you can skip the constructor all together.

```javascript
class MyComponent extends React.Component {
  state = {
    loading: true
  };

  render() {
    if (this.state.loading) {
      return (
        <p>Loading...</p>
      );
    } else {
      // ...
    }
  }
}
```

This second example will work the same as the first, and it is a bit more
concise.

# Destructure Variables As Props To A Component

When passing down props, a redundant-feeling pattern can sometimes emerge.

```javascript
const MyComponent = ({ handleChange, handleBlur }) => {
  return (
    <div>
      <OtherComponent />
      <MySubComponent handleChange={handleChange} handleBlur={handleBlur} />
    </div>
  )
};
```

The typing feel duplicative, as if there ought to be a better way. One
option is to simply pass down all the props:

```javascript
<MySubComponent {...props} />
```

This approach may result in passing down props that we don't intend to pass
down and clutters the flow of data in our app.

Here is another approach:

```javascript
const MyComponent = ({ handleChange, handleBlur }) => {
  return (
    <div>
      <OtherComponent />
      <MySubComponent {...{handleChange, handleBlur}} />
    </div>
  )
};
```

Here we are taking advantage of two ES6 features. Since the naming is the
same, we can use [property
shorthands](http://es6-features.org/#PropertyShorthand). Then we immediately
use the [spread operator](http://es6-features.org/#SpreadOperator) to splat
it back out as the props to the component.

h/t Vidal Ekechukwu

# Details Tags Are A Controllable Component

HTML has a lovely, but little-used tag for summarizing a set of collapsed
details. These details can be expanded and recollapsed by clicking the summary.
This is the `<details>` tag and it can be controlled with the `open` prop and
`onToggle` handler.

```jsx
import React, { useState } from "react";

export default function Details({ summary, children, onToggle }) {
  const [open, setOpen] = useState(false);

  return (
    <details
      open={open}
      onToggle={() => {
        setOpen(prev => !prev);
        onToggle();
      }}
    >
      <summary>{summary}</summary>
      {children}
    </details>
  );
}
```

[live
example](https://codesandbox.io/s/loving-merkle-hxlut?file=/src/App.js:0-545),
[source](https://github.com/facebook/react/issues/15486)

# Dispatch Anywhere With Redux

Your React app is going to have a single top-level `store` which is
connected to the app with the `Provider` component. Most of the time, when
you create a connected component, you'll create prop functions that dispatch
on a redux action.

This isn't the only place you can dispatch though.

If you export your `store`, then it can be imported anywhere along with its
`dispatch` function.

```javascript
// src/index.js
export const store = createStore(rootReducer);
```

```javascript
// src/components/MyComponent.js
import { store } from '../index';
import { updateData } from '../actions';

// ...

  componentDidMount() {
    getData().then((json) => {
      store.dispatch(updateData(json));
    }
  }
```

See the [`dispatch`](https://redux.js.org/docs/api/Store.html#dispatch)
documentation for more details.

# Dynamically Add Props To A Child Component

If your component has an element nested in it, then it will receive a
`children` prop. There are a number of things you can do beyond simply
including the `children` as part of the rendered output of the component.
One thing you can do is put additional props on the child.

```javascript
const ParentWithClick = ({ children }) => {
  return (
    <children.type
      {...children.props}
      onClick={() => alert("You clicked me!")}
    />
  );
};
```

This `ParentWithClick` component will reconstitute its child component with
its given props and a new `onClick` prop.

Here is how it can be used:

```javascript
const App = () => {
  return (
    <ParentWithClick>
      <span>Hello!</span>
    </ParentWithClick>
  );
};
```

Click on `Hello!` and you'll see the alert.

Minor caveat: multiple children and a string child will need to be handled
differently.

See a [live example here](https://codesandbox.io/s/n0pyn61yop).

# Dynamically Create HTML Elements

An HTML element can be created with a string that matches a recognized
entity.

```javascript
const Paragraph = 'p';
return <Paragraph>Some paragraph content</Paragraph>
```

This means we can dynamically create HTML elements such as headers:

```javascript
const H = ({ level, ...props }) => {
  const Heading = `h${Math.min(level, 6)}`;
  return <Heading {...props} />;
};

return (
  <React.Fragment>
    <H level={1}>Header 1</H>
    <H level={2}>Header 2</H>
    <H level={5}>Header 5</H>
  </React.Fragment>
);
```

With some
[inspiration](https://medium.com/@Heydon/managing-heading-levels-in-design-systems-18be9a746fa3),
I've created a [live example here](https://codesandbox.io/s/3v202wmmy1).

# Enforce Specific Values With PropTypes

Being able to constrain our user interfaces to very specific values is
valuable. This makes our interfaces easier to reason about and easier to
test. PropTypes in general are one of the ways that we constrain our UIs. We
can go even further than simple type constraints by limiting a prop to a
specific set of values, an enum if you will.

```javascript
MyComponent.propTypes = {
  flavor: PropTypes.oneOf(['Vanilla', 'Chocolate', 'Strawberry']),
};
```

The docs say about `oneOf()`:

> You can ensure that your prop is limited to specific values by treating it
> as an enum.

If we use `MyComponent` with a value such as `Pistachio`, we'll have a
console warning to answer for.

[source](https://reactjs.org/docs/typechecking-with-proptypes.html)

# Focus An Input With useRef Hook

You can send focus to an input by calling
[`focus()`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLOrForeignElement/focus)
on it. To do this in a React context, you need to have a reference to the
underlying DOM node. You can get this reference with the [`useRef`
hook](https://reactjs.org/docs/hooks-reference.html#useref).

```jsx
import React, { useRef } from 'react';

const MyComponent = () => {
  const inputRef = useRef(null);

  const focusInput = () => {
    inputRef.current.focus();
  }

  return (
    <div>
      <input
        ref={inputRef}
        type="text"
        value=""
        {...otherProps}
      />
      <button onClick={focusInput}>Edit Input</button>
    </div>
  );
}
```

When this component mounts, the underlying `<input>` element will get tied to
`inputRef`. The `focusInput` handler that I've created can be used to send
focus to the corresponding `inputRef`. To demonstrate, I've passed it to the
`onClick` handler of the button. Clicking the button will focus the input.

# Force A Component To Only Have One Child

A component can normally have an arbitrary number of elements nested
directly inside it. React's `Children.only` function can be used to force it
to a single direct child.

```javascript
import React, { Children, Component } from "react";

class App extends Component {
  render() {
    return (
      <SingleChildContainer>
        <span>There can only be one!</span>
      </SingleChildContainer>
    );
  }
}

const SingleChildContainer = props => {
  return Children.only(props.children);
};

export default App;
```

The React docs describe the behavior of `Children.only` as such,
_"Returns the only child in children. Throws otherwise."_.

If you modify the `return` in `App` to contain the following JSX

```javascript
<SingleChildContainer>
  <span>There can only be one!</span>
  <div>What about me?!</div>
</SingleChildContainer>
```

then an error will be thrown (`React.Children.only expected to receive a
single React element child`).

The [`Provider`
component](https://github.com/reactjs/react-redux/blob/master/src/components/Provider.js#L36)
in [`react-redux`](https://github.com/reactjs/react-redux) is an example of
where this is used.

# Forcing A Child Remount With The Key Prop

There are a couple `prop` names that have reserved usage in React. One of
those is `key`. We generally use `key` when we are rendering a list of
things. It is a way of uniquely identifying each element in a list so that
React minimizes re-rendering when parts of the list change.

We can flip this on its head and utilize `key` as a way of forcing a remount
and re-render of a child component.

Imagine I have a component that does a number of things including rendering
a component with some internal state, such as a counter.

```javascript
class MyComponent extends React.Component {
  state = {
    remountKey: (new Date()).getTime(),
  }

  resetCounter = () => {
    this.setState({
      remountKey: (new Date()).getTime(),
    });
  }

  render() {
    return (
      <div>
        {/* some other stuff in my component */}

        <Counter key={this.state.remountKey} />
        <button onClick={this.resetCounter}>Reset Counter</button>
      </div>
    );
  }
}
```

I can force this `Counter` component to remount, thus resetting its state by
passing it a new `key` value. The `button` can trigger this by updating the
`remountKey` value.

# Formik Connected Components

Formik comes with a `connect()` HOC that uses the context API as a way of
connecting to disparate form elements. This means that form data, change
handlers, touched and error data, etc. can be easily accessed without a lot of
[prop drilling](https://kentcdodds.com/blog/prop-drilling).

Any component that lives somewhere downstream in the tree of a Formik form can
use `connect()`.

```javascript
import { connect, getIn } from "formik";

const Input = ({ type = "text", name, id, label, formik }) => {
  return (
    <React.Fragment>
      <label htmlFor={name}>{label}:</label>{" "}
      <input
        type={type}
        onChange={formik.handleChange}
        onBlur={formik.handleBlur}
        value={getIn(formik.values, name)}
        name={name}
        id={id}
      />
    </React.Fragment>
  );
};

export default connect(Input);
```

This `Input` component is wrapped in `connect` which means it gets the `formik`
prop which contains everything that we mentioned and more -- all the context
you'll need to make your form element work.

You can play around with it using this [live
example](https://codesandbox.io/s/quizzical-hill-7xlwi).

# Formik's Validation Schema As A Function

The most straightforward way to use
[Formik](https://jaredpalmer.com/formik)'s `validationSchema` is to provide
it with a [Yup](https://github.com/jquense/yup) object defining your form's
validations.

```javascript
const MyComponent = withFormik({
  // ...

  validationSchema: yup.object().shape({
    email: yup.string().required(),
    feedback: yup.string().required(),
  }),
  
  // ...
})(MyForm);
```

There may be a point at which you need access to the `props` being passed
to `MyComponent` in order to construct the proper set of validations.
Formik supports this by allowing `validationSchema` to be a function.

```javascript
const MyComponent = withFormik({
  // ...

  validationSchema: (props) => {
    let emailSchema;
    if(props.allowAnonymous) {
      emailSchema = yup.string();
    } else {
      emailSchema = yup.string().required();
    }

    return yup.object().shape({
      email: emailSchema,
      feedback: yup.string().required(),
    });
  },
  
  // ...
})(MyForm);
```

When `validationSchema` is a function, its first argument is the set of
props passed to that component.

# Inactive And Active Component Styles With Radium

[Radium](https://github.com/FormidableLabs/radium) is "toolchain for React
component styling" allowing you to do comprehensive inline styling with CSS.

Often times, especially in the case of a series of nav elements, there is a
need to style one element as _active_ while styling the rest as _inactive_.
This can be achieved with Radium by defining two groups of styles (`base`
and `active`) and then relying on props to conditionally apply the active
style.

```javascript
import React from 'react';
import Radium from 'radium';

const styles = {
  base: {
    textDecoration: "none",
    color: "gray",
  },
  active: {
    color: "black",
    backgroundColor: "lightgray",
  },
};

let NavItem = ({ label, path, active }) => {
  return (
    <a
      href={path}
      style={[
        styles.base,
        styles[active && 'active'],
      ]}
    >{label}</a>
  );
};

NavItem = Radium(NavItem);
```

With Radium, our `base` (_inactive_) styles always get applied. Then, the
`active` styles only get applied when the `active` prop is true. We produce
a Radium-ified version of our `NavItem` on the last line so that Radium can
handle all of the styling of the component.

# Inline Style Attributes Should Be Camel Cased

When adding a few quick styles to React components, you can add it directly
on the tags in the JSX. To do this, use the `style` tag with a plain old
JavaScript object of styles.

```javascript
<div style={{ padding: "1em", color: "#fff" }}>
```

If you are using a CSS attribute that is normally hyphenated like
`padding-top` or `background-color`, you'll need to camel case it in the
JSX.

```javascript
<div style={{ paddingTop: "1em", backgroundColor: "#fff" }}>
```

This is because our styles now need to conform to JavaScript syntax
rules since they are in the form of a POJO.

Read the [documentation](https://reactjs.org/docs/dom-elements.html#style)
for more details.

# Manage State In A Functional Component

Before the introduction of React 16.8, you had a couple options for declaring
and managing state in your components.

The first _class_ way was to create a class component and then [add local,
component state to
it](https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class).

If you already had a functional component, you could avoid the conversion to a
class component with custom HOCs and Render Prop components or any number of
third-party libraries such as [React
PowerPlug](http://rena.to/react-powerplug/#/docs-components-state) and
[Recompose](https://github.com/acdlite/recompose).

However, projects using React 16.8+ have
[Hooks](https://reactjs.org/docs/hooks-intro.html) at their disposal. The Hooks
API's base offering is a state hook --
[`useState`](https://reactjs.org/docs/hooks-state.html).

```javascript
import React, { useState } from "react";

const Toggler = () => {
  const [on, setOn] = useState(false);
  const [toggleCount, setToggleCount] = useState(0);

  const incrementToggleCount = setToggleCount(prev => prev + 1);
  const handleToggle = () => {
    setOn(prev => !prev);
    incrementToggleCount();
  };

  return (
    <React.Fragment>
      <Thing on={on} />
      <button onClick={handleToggle}>{on ? "ON" : "OFF"}</button>
      <p>Toggle Count: {toggleCount}</p>
    </React.Fragment>
  );
}
```

You can manage a variety of state values in a functional component with
`useState`. The `useState` function takes the initial state value as an
argument and returns a tuple with the current state value and an _setter_
function for updating that piece of state.

# Mapping Over One Or Many Children

In [Dynamically Add Props To A Child
Component](https://github.com/jbranchaud/til/blob/master/react/dynamically-add-props-to-a-child-component.md),
I talked about how a child element can be reconstituted with additional
props. The approach I showed will only work in the case of a single child
being nested in that component. What if you want your component to account
for one, many, or even children?

React comes with a built-in function for mapping that handles these cases.

```javascript
const ParentWithClick = ({ children }) => {
  return (
    <React.Fragment>
      {React.Children.map(children || null, (child, i) => {
        return <child.type {...child.props} key={i} onClick={handleClick} />;
      })}
    </React.Fragment>
  );
};
```

The [`React.Children.map`
function](https://reactjs.org/docs/react-api.html#reactchildrenmap) allows
mapping over one or many elements and if `children` is `null` or
`undefined`, it will return `null` or `undefined` respectively.

See a [live example here](https://codesandbox.io/s/kwj29y2j2r).

# Mock A Function That A Component Imports

You have a component that relies on an imported function,
`isAuthenticated()`.

```javascript
// MyComponent.js
import React from 'react';
import { isAuthenticated } from './authentication';

const MyComponent = (props) => {
  if (isAuthenticated()) {
    return (<div>{/* ... */}</div>);
  } else {
    return (<div>Not authenticated</div>);
  }
};
```

You'd like to test that component without having to manage the
authentication of a user. One option is to mock out that function. This can
be done with some help from [`jest.fn()` and the `mock.mockReturnValue()`
function](https://github.com/jbranchaud/til/blob/master/javascript/mock-a-function-with-return-values-using-jest.md).

```javascript
// MyComponent.test.js
// ... various testing imports

import * as authModules from './authentication';

it('renders the component', () => {
  authModules.isAuthenticated = jest.fn().mockReturnValue(true);

  const wrapper = shallow(<MyComponent />);
  expect(toJson(wrapper)).toMatchSnapshot();
});
```

By importing the same module and functions used by `MyComponent`, we are
then able to replace them (specifically, `isAuthenticated`) with a mocked
version of the function that returns whatever value we'd like. As
`MyComponent` is being rendered, it will invoked our mocked version of
`isAuthenticated` instead of the actual one.

You could test the other direction like so:

```javascript
authModules.isAuthenticated = jest.fn().mockReturnValue(false);
```

# Navigate With State Via @reach/router

With [@reach/router](https://reach.tech/router), you can programmatically
change your route using the
[`navigate`](https://reach.tech/router/api/navigate) function. This utilizes
the Context API, so its available anywhere nested under your router. To
provide some data to the destination location, include a `state` option in
the `navigate` call.

```javascript
const onSubmit = ({ data }) => {
  /* submit logic ... */

  navigate(nextPath, { state: { data }});
}
```

The component that renders in response to this navigation will have access
to this state.

```javascript
const NextComponent = ({ location }) => {
  const { data } = location.state;

  return (
    /* ... */
  )
}
```

# Pairing A Callback With A useState Hook

React's Class-based state management allowed you to update the state of your
component with a call to `this.setState()`. The first argument represents the
changes to the state. It also accepts a second argument; a callback that will
be invoked after the state has been updated.

```javascript
this.setState({ loading: true }, () => console.log("Loading..."));
```

If you've transitioned to Hooks-based state management, then you may have
noticed that the updaters generated by `useState` calls do not accept a second
callback argument.

If you want to update state and fire a callback in response to it, you can pair
`useState` with `useEffect`.

```javascript
import React, { useState, useEffect } from "react";

function App() {
  const [loading, setLoading] = useState(false);
  const toggleLoading = () => setLoading(prevLoading => !prevLoading);
  useEffect(() => {
    if(loading) {
      console.log("We are loading now");
    }
  }, [loading])

  return (
    <div>
      {loading && <p>Loading...</p>}
      <button onClick={toggleLoading}>{loading ? "Cancel" : "Save"}</button>
    </div>
  );
}
```

The `useState` acts on its own. It has no side-effects. We follow it with a
`useEffect` that responds to changes to the value of `loading` -- this is where
our _callback_ gets invoked.

See a [live example](https://codesandbox.io/s/clever-roentgen-kvzze).

# Pass A Function To A useState Updater

Let's say you have a component with a toggle state:

```javascript
const [toggle, setToggle] = useState(false);
```

You can change the state of the toggle by directly passing a value to
`setToggle`.

```javascript
setToggle(true);
console.log(toggle);
//=> true
```

Alternatively, you can pass a function to the updater. This is called a
[_functional
update_](https://reactjs.org/docs/hooks-reference.html#functional-updates). The
updater will call the function with the previous state value and update the
state to whatever the function returns.

```javascript
const handleToggle = (prevToggle) => {
  return !prevToggle;
}

console.log(toggle);
//=> true

setToggle(handleToggle);

console.log(toggle);
//=> false
```

# Passing Props Down To React-Router Route

When using [react-router](https://github.com/ReactTraining/react-router),
you'll often use the `component` prop to have a certain component rendered.

```javascript
<Route
  path="/my/path"
  component={MyComponent}
/>
```

If, however, you need to pass props down into `MyComponent`, then you'll
want to use the `render` prop with an inline function.

```javascript
<Route
  path="/my/path"
  render={(routeProps) => (
    <MyComponent {...routeProps} {...props} />
  )}
/>
```

The two spread operator statements are essential. They will pass down the
[route
props](https://reacttraining.com/react-router/web/api/Route/Route-props)
that `Route` would have passed down plus the additional set of props that
you want to pass down.

# Prevent reach/router Redirect Error Screen In Dev

When using [@reach/router's
`<Redirect>`](https://reach.tech/router/api/Redirect) with tools like
create-react-app and Gatsby, you'll get those tools' development-mode error
screen overlays whenever a redirect happens. This has to do with how
@reach/router utilizes `componentDidCatch` to change the path without a
render. That error screen overlay can get annoying though. Prevent it with
the `noThrow` prop.

```javascript
return (
  <Redirect to={anotherPath} noThrow />
);
```

# Proxy To An API Server In Development With CRA

[create-react-app](https://github.com/facebookincubator/create-react-app) is
a great way to bootstrap a React project, especially if you are building a
single-page app. When building an SPA, you more likely than not will have a
backend API that you interact with.

You can set up your React app to interact with that backend API server in
development using the `proxy` configuration in `package.json`.

```json
// package.json
  ...
  "proxy": "http://localhost:4000",
}
```

This will allow you to keep your API calls nice and clean.

```javascript
fetch("/api/session", ...
```

No need to manage some sort of _host URL_ environment variable.

Additionally, this will remove an CORS issues because the `webpackDevServer`
will be proxying any paths that it doesn't recognize to the host and port
that you've specified.

See [the `create-react-app`
docs](https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#proxying-api-requests-in-development)
for more details.

# Quickly Search For A Component With React DevTools

As the size of your React app grows, it can become challenging to track down
specific components within the [React
DevTools](https://github.com/facebook/react-devtools) extension. You opened
it up with the hopes of quickly inspecting the `props` being received by a
component, but find yourself navigating through the DOM structure instead.

The React DevTools extension provides a search bar that can be used to
quickly filter out most components.

![react devtools component search](https://i.imgur.com/dYd8SZD.gif)

The search bar is located at the top of the extension. Once you start typing
the results are immediate. Then, if you hover over any of the remaining
components, you'll get some visual feedback as they are highlighted in the
browser.

# @reach/router Renders To A Div

Check out the following snippet that uses
[`@reach/router`](https://reach.tech/router).

```javascript
import { Router } from '@reach/router';

const Home = () => <h1>Home</h1>;

const App = () => {
  return (
    <div className="main">
      <Router>
        <Home path="/home" />
      </Router>
    </div>
  );
}
```

When you visit '/home', this will render in the DOM as:

```html
<div class="main">
  <div tabindex="-1" role="group" style="outline: none;">
    <h1>Home<h1>
  </div>
</div>
```

Notice the extra `div` -- that is what `<Router>` renders to as part of
`@reach/router`'s accessibility features. This may throw off the structure
or styling of your app. This can be fixed. Any props that you give to
`<Router>` will be passed down to that `div`. For instance, you could remove
the most outer `div` and put `className="main"` on the `<Router>`.

[source](https://github.com/reach/router/issues/63#issuecomment-395988602)

# Read Only Input Elements

Here is an input element with a `value` and no `onChange` handler.

```javascript
const MyInput = ({ value }) => {
  return (
    <input value={value} />
  );
};
```

React will raise a warning regarding the `input` element because it has a
`value` without an `onChange` handler leaving React to wonder if it is
intended to be a _controlled_ or _uncontrolled_ component.

If our intention is to have the `value` set but not allow the user to
directly change it, we just need to let React know that.

```javascript
const MyInput = ({ value }) => {
  return (
    <input readOnly value={value} />
  );
};
```

The `readOnly` prop means we don't intend for the input to be modified by
user input. The React warning will now go away.

h/t Dillon Hafer

# Rendering Multiple Nodes With Fragments

When rendering, React expects a component to only return a single node. The
DOM hierarchy of most components will easily follow this rule, but what
about those components that do have multiple inline nodes?

The two solutions have been to either wrap the inline nodes in an outer
`div` or to return them as a comma separated array of nodes. With React 16,
we can avoid the deficiencies of both of these approaches by using a
fragment.

Just wrap your inline nodes with a `React.Fragment` node. React will
understand your JSX without wrapping the output DOM in a superfluous `div`.

```javascript
render() {
  return (
    <React.Fragment>
      <p>Name: {firstName} {lastName}</p>
      <p>Email: {email}</p>
      <p>Age: {age}</p>
    </React.Fragment>
  );
}
```

See the [docs on fragments](https://reactjs.org/docs/fragments.html) for
more details.

# Set The Type For A useState Hook

TypeScript can often infer the type of a `useState` hook. For instance, in the following example, TypeScript infers a type of `boolean`:

```typescript
const [open, setOpen] = React.useState(false);
```

If we have a `useState` hook that can be `null` or a string:

```typescript
const [error, setError] = React.useState(null);

setError('There was an error');
// Argument of type 'string' is not assignable
// to parameter of type 'SetStateAction<null>'
```

then we'll get a TypeScript warning when we violate the inferred type of
`SetStateAction<null>`.

The `useState` can be appropriate typed for this situation like so:

```typescript
const [error, setError] =
  React.useState<null | string>(null);
```

[source](https://www.carlrippon.com/typed-usestate-with-typescript/)

# Specifying Dependencies Of A useEffect Hook

The `useEffect` hook is all about performing side-effects. For instance,
you'll want to place API calls within `useEffect` hooks.

The dependency array -- the second argument to `useEffect` -- is where you
declare all of the values that are depended on within the `useEffect`. If
you're making an API call, this array is likely made up of parameters passed to
that call.

Here is a contrived example of what that could look like:

```javascript
const apiCall = (opts) => Promise.resolve(opts);
const [param1, param2, param3] = [1,2,3];

useEffect(() => {
  const handleApiCall = async () => {
    apiCall({ param1, param2, param3 })
      .then((data) => {
        // do something with the data
      })
      .catch((error) => {
        // do something with the error
      });
  }

  handleApiCall();
}, [param1, param2, param3]);
```

If you don't specify all of the values used in the body of the `useEffect`, you
are opening yourself up to potentially incorrect code. It is safer to specify
all of them. The [`exhaustive-deps`
rule](https://www.npmjs.com/package/eslint-plugin-react-hooks) can help.

[This
section](https://overreacted.io/a-complete-guide-to-useeffect/#what-happens-when-dependencies-lie)
of Dan Abramov's "A Complete Guide to useEffect" does an excellent job of
showing how things can go wrong when you lie to React about your dependencies.

# Spelunking Through Components With Enzyme's Dive

Most of the components we write have other components nested in them.

```javascript
const Hello = ({ name }) => <h1>Hello {name}!</h1>;

const HelloContainer = (props) => (
  <div>
    <Hello {...props} />
  </div>
);
```

If we are to [shallow render the above component using
Enzyme](http://airbnb.io/enzyme/docs/api/ShallowWrapper/shallow.html), we'll
only see things one layer deep:

```javascript
const wrapper = shallow(<HelloContainer name="World" />);
// wrapper ~= <div><Hello name="World" /></div>
```

If we'd like to explore a particular child of the rendered component
further, we can do a little
[`find`](http://airbnb.io/enzyme/docs/api/ReactWrapper/find.html) and
[`dive`](http://airbnb.io/enzyme/docs/api/ShallowWrapper/dive.html).

```javascript
const wrapper = shallow(<HelloContainer name="World" />);
const helloWrapper = wrapper.find(Hello).dive();
expect(helloWrapper.text()).toEqual("Hello World!");
```

This allows us to make pinpoint assertions about how our components render
without mounting the entire thing.

See a [live example here](https://codesandbox.io/s/y236wr1kn1).

h/t Vidal Ekechukwu

# Sync Your react-router State With Redux

If you are building a React app that uses both `redux` and `react-router`,
you'll find that you are managing app state in two places. Most of your app
state is in `redux`. The router-specific state is component-state in the
`Router`.

You can unify it all in `redux` with
[`react-router-redux`](https://github.com/ReactTraining/react-router/tree/master/packages/react-router-redux).

You'll need to apply some middleware, combine `routerReducer` with the rest
of your reducers, and then swap out your `BrowserRouter` with a
`ConnectedRouter`. You can read about the details
[here](https://github.com/ReactTraining/react-router/tree/master/packages/react-router-redux).

# Test Files In create-react-app

Any `.js` files placed in the `__tests__` directory will be treated as tests
by Jest when running `yarn test`. If you don't want to place all of your
files in that directory and especially if you want to co-located your test
files with the source files, you can name them with the `.test.js` or
`.spec.js` suffixes.

Any files in your create-react-app project ending in these suffixes will be
treated by Jest as test files and included in test runs.

There are [more
details](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#running-tests)
in the docs.

# Test That Element Does Not Render In The Component

With
[`react-testing-library`](https://testing-library.com/docs/react-testing-library/intro),
you can render a component and make assertions about the different parts of the
component that get rendered.

You can also make assertions that certain things _don't_ get rendered. To do that, first render the component:

```javascript
import { render, screen } from '@testing-library/react'
import '@testing-library/jest-dom/extend-expect'

import MyComponent from '../MyComponent'

test('renders component without Click Me button', () => {
  render(<MyComponent />)
})
```

Then add a `not` expectation with a `query*`-style matcher:

```javascript
  expect(screen.queryByText('Click Me')).not.toBeInTheDocument()
```

You'll get an immediate test failure if you try to directly select for the element using a `get*`-style matcher:


```javascript
  // ❌ will fail on `getByText` before the rest of the
  // assertion can be evaluated.
  expect(screen.getByText('Click Me')).not.toBeInTheDocument()
```

[source](https://kentcdodds.com/blog/common-mistakes-with-react-testing-library#using-query-variants-for-anything-except-checking-for-non-existence)

# Trigger Effect Only When The Component Mounts

With `useEffect`, you generally want to values used in the function to also be
included in the _dependency list_. This ensures the effect is triggered
whenever any of those values change.

But what if you only want the effect to be triggered when the component first
mounts?

This can be done by including an _empty_ dependency list.

```javascript
import React, { useState, useEffect } from "react";

function App() {
  const [count, setCount] = useState(0);
  const incrementCount = () => {
    setCount(prevCount => prevCount + 1);
  };

  useEffect(() => {
    console.log("The count is:", count);
  }, []);

  return (
    <div>
      <button onClick={incrementCount}>+</button>
      <p>Count: {count}</p>
    </div>
  );
}
```

In this example, we will see `The count is: 0` get logged when the component
first mounts. As we hit the button to increment the count, nothing else will be
logged.

See the [live example](https://codesandbox.io/s/mystifying-currying-l2rw2).

# Update Formik Initial Values When Props Change

When a [Formik](https://jaredpalmer.com/formik/) form mounts, whatever the
initial values are set to is what they will be. Even if the initial values are
computed from props, those props changing will not affect `initialValues` after
mount.

```javascript
const ZipForm = ({ currentZip }) => {
  return (
    <Formik
      initialValues={{ zip: currentZip }}
      onSubmit={(values, actions) => {
        // do stuff
      }}
      ...
```

If we are fetching the user's saved zip code asynchronously from a server while
the form is first being rendered, then `currentZip` will start as an empty
value. Once the async request comes back and `currentZip` is set, we won't see
the form update the `zip` field.

There was a time when you would have to jump through some hoops to make sure
the freshest prop value made it into the form. Now, Formik provides a handier
mechanism -- the `enableReinitialize` prop.

```javascript
const ZipForm = ({ currentZip }) => {
  return (
    <Formik
      initialValues={{ zip: currentZip }
      enableReinitialize
      onSubmit={(values, actions) => {
        // do stuff
      }}
      ...
```

By setting `enableReinitialize` to true, we are telling Formik that any prop
changes that flow into the `initialValues` object should cause those values to
be _reinitialized_.

See a [live example](https://codesandbox.io/s/sad-mendeleev-4dbbp).

# Upgrading To The Latest React In CodeSandbox

At the time of writing this, the latest version of React is 16.3.1. Opening
up [CodeSandbox](https://codesandbox.io/) and starting a new React project
has us working with React 16.2.

![Defaults to React 16.2](https://i.imgur.com/AmgyfGc.png)

By clicking on the _circular arrow_ upgrade icon next to `react` and
`react-dom`, we will have upgraded each to 16.3.1.

![Upgrade to React 16.3.1](https://i.imgur.com/0DPLOY2.png)

# Use A Ref To Autofocus An Input

When creating highly interactive interfaces with React, we are trying to
make the user's experience of our app as smooth as possible. This means that
when an edit button reveals an input field, we want that field to be in
focus so that the user can immediately start typing.

This is a great use for React's `ref` prop. When you supply your component
with a function as the `ref` prop, that function will be called with a
reference to itself on mount and with `null` on unmount.

```javascript
class MyAutofocusInput extends React.Component {
  focusInput = (component) => {
    if (component) {
      component.focus();
    }
  };

  render() {
    return (
      <input
        ref={this.focusInput}
        value={this.props.value}
        onChange={this.props.onChange}
      />
    );
  }
}
```

When this component gets rendered, the input will be focused via our
`focusInput` function.

Note: refs only work with class components, so don't try to use it with a
functional component.

See [Refs and the DOM](https://reactjs.org/docs/refs-and-the-dom.html) in
React's documentation for more details.

# Use React 16 With Gatsby

[Gatsby](https://www.gatsbyjs.org/), the blazing fast static site generator
for React, is tied to React 15.6. If you've been using React 16+ for a
while, then this may come as a bit of a buzzkill.

Fortunately, there is a Gatsby plugin that let's you use React 16 with a
Gatsby v1 site --
[gatsby-plugin-react-next](https://github.com/gatsbyjs/gatsby/tree/master/packages/gatsby-plugin-react-next).

Add it the plugin as a dependency:

```bash
$ yarn add gatsby-plugin-react-next
```

Then add it to the list of plugins in `gatsby-config.js`:

```javascript
plugins: [`gatsby-plugin-react-next`];
```

[source](https://twitter.com/gatsbyjs/status/990806495959826432)

# Use withRouter To Pass Down React-Router History

A standard way to navigate with
[react-router](https://github.com/ReactTraining/react-router) besides using
the `Link` component is to call `history.push`. Components that are directly
rendered by a `Route` will have access to this and other router props. But
what about other components?

The `withRouter` HOC gives us direct access to a `history` prop.

```javascript
import React from 'react';
import { withRouter } from 'react-router';

const SpecialButton = withRouter(({ history, path, text }) => {
  return (
    <Button
      onClick={() => { history.push(path); }}
    >
      {text}
    </Button>
  )
});
```

This special button component is given the `history` prop via the
`withRouter` HOC along with any props that we directly pass it. With that
we are able to directly invoke a route change using `history.push()`.

# Visually Select A React Element For Inspection

Similar to the _Elements_ tab of Chrome devtools, the [React devtools
extension](https://github.com/facebook/react-devtools) provides a visual
element selector to make it easier to inspect an element you can see in the
browser.

![select and inspect a react component](https://i.imgur.com/cGgSZfN.gif)

Open the React devtools, click the crosshair icon, hover around the browser
until the element you are looking for is visually highlighted, and then
click. The React component hierarchy will be expanded to reveal that
element. You can now inspect it or quickly navigate to nearby elements.

# Who Is Your Favorite Child?

When we put some content inside the open and close tags of one of our
components, we get access to it as the `children` prop.

```javascript
const Parent = ({children}) => {
  return (
    <React.Fragment>
      <p>These are my favorites:</p>
      {children}
    </React.Fragment>
  );
}

const App = () => (
  <div>
    <Parent>
      Greg and Marsha
    </Parent>
  </div>
);
```

What happens if we also provide an explicit `children` prop to `Parent`?

```javascript
const App = () => (
  <div>
    <Parent children={"Jan and Peter"}>
      Greg and Marsha
    </Parent>
  </div>
);
```

Which will take precedence when we destructure `children` in the parent
component?

In the example above, we'll still see `Greg and Marsha` rendered. The
content placed inside the tags will take precedence over the explicit
`children` prop.

See a [live example here](https://codesandbox.io/s/kmo5lk2lr5).

# Wrap The Root Of A Gatsby App In A Component

Each component that is defined in the `pages` directory of a
[Gatsby](https://www.gatsbyjs.org/) app will be generated into a separate
static page. Each of these pages is meant to stand on its own. Nevertheless,
there is still a behind-the-scenes root component above all of these pages.
There are cases where'd you like to wrap this root component with some other
component, such as a Redux `Provider`.

This can be done using the `wrapRootElement` hook from the Browser API in
the `gatsby-browser.js` file.

```javascript
// gatsby-browser.js
import React from 'react';
import { Provider } from 'react-redux';

import store from './src/store';

export const wrapRootElement = ({ element }) => {
  return (
    <Provider store={store}>{element}</Provider>
  );
}
```

Each page and each component in your Gatsby app will now be downstream from
a Redux provider meaning that they can connect to the Redux store as needed.
You can use this technique for any top-level component that need to be
wrapped around the entire app.

[source](https://www.gatsbyjs.org/docs/browser-apis/#wrapRootElement)

