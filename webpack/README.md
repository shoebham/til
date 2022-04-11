### Category webpack

---

 - [Better Module Imports With Aliases](#better-module-imports-with-aliases)
 - [Debugging With Full Source Maps](#debugging-with-full-source-maps)
 - [Run ESLint As A Preloader](#run-eslint-as-a-preloader)
 - [Specify Port Of CRA's Webpack Dev Server](#specify-port-of-cra's-webpack-dev-server)
 - [Use A Specific Config File](#use-a-specific-config-file)

---

# Better Module Imports With Aliases

Depending on how your JavaScript project is structured, you can end up with
import statements that look like this:

```javascript
import SomeComponent from 'app/assets/javascripts/components/SomeComponent.jsx';
```

or this:

```javascript
import SomeComponent from '../components/SomeComponent.jsx';
```

The first is simply too long and the second is both ugly and brittle to
changes in file location. This can all be _resolved_ with a
[Webpack](https://webpack.github.io/) alias.

```javascript
// webpack.config.js
resolve: {
  alias: {
    components: "app/assets/javascripts/components",
  },
},
```

Webpack will use this `alias` when resolving module imports like the
following updated example:

```javascript
import SomeComponent from 'components/SomeComponent.jsx';
```

See the
[`resolve.alias`](https://webpack.github.io/docs/configuration.html#resolve-alias)
section of the Webpack docs for more details.

h/t Vidal Ekechukwu

# Debugging With Full Source Maps

After Webpack runs your JavaScript through various loaders, it no longer
looks like the code you were writing in your editor. This can make debugging
difficult when you inspect the source of an error in the browser's devtools.
Fortunately, Webpack makes it easy to enhance debugging with full source
maps of your code. Just add the following option to your Webpack config:

```javascript
{
  devtool: "source-map",
  ...
}
```

This will generate a full source map with a filename that is something like
`bundle.js.map`.

Note: this will slow down the webpack build process a bit.

Read more about the `devtool` configuration and all the possible options in
the [Webpack
docs](https://webpack.github.io/docs/configuration.html#devtool).

# Run ESLint As A Preloader

You may already be running [ESLint](http://eslint.org/) manually or as a
script command via `npm`.  You can also include it as part of the Webpack
build process. By adding it as a *preloader*, Webpack will lint your
JavaScript files before running other loaders. The results of
linting will be reported in the terminal. Assuming you've already installed
`eslint` and set up your `.eslintrc` file, all you need to do is `npm
install --save-dev eslint-loader` and then add something like the following
to your `webpack.config.js` file:

```javascript
module: {
  preLoaders: [
    {
      test: /\.js$/,
      loaders: ['eslint'],
      exclude: /node_modules/,
    }
  ],
  ...
}
```

Running something like `webpack -w` will now lint your JavaScript before
running other loaders.

Depending on your project, you may also want to include `babel-eslint` and
`eslint-plugin-react` with your setup.

# Specify Port Of CRA's Webpack Dev Server

[`create-react-app`](https://github.com/facebookincubator/create-react-app)
gives you a set of scripts, one of which allows you to start a development
server that bundles and serves your javascript. This is handled under the
hood via `webpack-dev-server`. By default it attempts to serve from port
`3000`. If port `3000` is taken it will attempt to connect to another
sequential port.

Alternatively, you can just specify the port when starting the development
server. This can be done with the `PORT` env var.

```bash
$ PORT=3333 yarn start
```

# Use A Specific Config File

When running `webpack`, the default config file that it looks for is
`webpack.config.js`. If you have a project that uses different webpack
config files for different environments, you will need to specify which
config file webpack should use. The `--config` flag can be used with
`webpack` to specify that file. For instance, if you want to use your
production webpack config, run a command like the following:

```
$ webpack --config webpack.config.production.js
```

