### Category typescript

---

 - [Add Types To An Object Destructuring](#add-types-to-an-object-destructuring)
 - [Compiler Checks For Unused Params And Variables](#compiler-checks-for-unused-params-and-variables)
 - [Interfaces With The Same Name Are Merged](#interfaces-with-the-same-name-are-merged)
 - [Re-Export An Imported Type](#re-export-an-imported-type)
 - [Type Narrowing With Similarly Shaped Objects](#type-narrowing-with-similarly-shaped-objects)
 - [Use An Array Check For Type Narrowing](#use-an-array-check-for-type-narrowing)
 - [Zero-Config Environments For Trying Out Types](#zero-config-environments-for-trying-out-types)

---

# Add Types To An Object Destructuring

Let's say I'm building a form component that asks the user for their first name
and email address. I then want to submit these values to some server endpoint
to subscribe the user to a newsletter.

Now, what if I want to type the destructuring of the form values?

The standard syntax for doing this with TypeScript conflicts with the
destructured renaming ES6 feature:

```javascript
const { firstName: string, email: string } = formValues;
```

This won't work.

Rather than typing the individual values in the destructuring, you'll need to
type the destructured object itself.

```typescript
const {
  firstName,
  email,
}: { firstName: string; email: string } = formValues;
```

[source](https://flaviocopes.com/typescript-object-destructuring/)

# Compiler Checks For Unused Params And Variables

There are a number of linter-esque checks that you can tell the TypeScript
compiler to make when it is checking your code. There are two that prevent
values from going unused: one for parameters and the other for variables.

The [`noUnusedLocals`](https://www.typescriptlang.org/tsconfig#noUnusedLocals)
config, which defaults to `false`, can be set to `true`. This will cause the
compiler to fail if a locally declared variable goes unused.

```typescript
function printItem(item: any, index: number) {
  const indexedItem = `${index}: ${item}`;
  //    ^^^ 'indexedItem' is declared but its value is never read.

  console.log(item);
}
```

The
[`noUnusedParameters`](https://www.typescriptlang.org/tsconfig#noUnusedParameters)
config, which also defaults to `false`, can be set to `true`. This will cause
the compiler to fail if a function param goes unused.

Fixing the previous error could then result in this one.

```typescript
function printItem(item: any, index: number) {
  //                          ^^^
  // 'index' is declared but its value is never read.

  console.log(item);
}
```

Here is what the `tsconfig.json` would look like:

```json
{
  "compilerOptions": {
    "noUnusedLocals": true,
    "noUnusedParameters": true,
  }
}
```

# Interfaces With The Same Name Are Merged

Here is the declartion of an interface in TypeScript.

```typescript
interface Person {
  name: string
}
```

What if I were to add a separate interface declaration with the same name,
`Person`?

```typescript
interface Person {
    age: number
}
```

TypeScript performs declaration merging. So the types of the two interfaces
would be combined. So, a variable of type `Person` can have an `name` and an
`age`.

```typescript
const person: Person = {
    age: 22,
    name: 'Bob'
}
```

See a [live
example](https://www.typescriptlang.org/play?ssl=12&ssc=2&pln=5&pc=1#code/JYOwLgpgTgZghgYwgAgArQM4HsTIN4BQyxyIcAthAFzIZhSgDmBAvgQaJLIiulNrkIlkcRtVIBXcgCNordghx1kAB0w4afAcgC8+IiVHiATMYA0B4mUo0A5ACEs02-IJr+OAHRGgA)
in the TS Playground.

This is different from how object type declarations handle it. If I were to try
to define two separate `type`s with the same name, that would result in a type
error.

[source](https://www.typescriptlang.org/docs/handbook/declaration-merging.html#merging-interfaces)

# Re-Export An Imported Type

I have a TypeScript module that is defining an XState machine. Among other
things, it imports the `DoneEventObject` type from `xstate`. I want to
re-export that type so that any modules using this machine have access to that
type definition.

This can be done a couple of ways. One way to import it under an aliased name
and then assign + export it using the original name.

```typescript
import {Machine, DoneEventObject as _DoneEventObject} from 'xstate'

export type DoneEventObject = _DoneEventObject
```

This works, but adds some potential indirection and confusion through the
double assignment.

Another way of doing this is to reference the type off the import statement as
part of an assignment.

```typescript
import {Machine} from 'xstate'

export type DoneEventObject = import('xstate').DoneEventObject
```

This imports, assigns, and exports the type in a single statement.

[source](https://github.com/microsoft/TypeScript/issues/28481#issuecomment-552938424)

# Type Narrowing With Similarly Shaped Objects

Let's say we have a type with several properties and a variable of that type.

```typescript
type User = {
  firstName: string
  lastName: string
  age: number
  email: string
}

const liz: User = {
  firstName: 'Liz',
  lastName: 'Lemon',
  age: 38,
  email: 'liz@example.com'
}
```

We can use variables of this type in _narrower_ contexts as long as the
properties that are present have aligning types.

For instance, we can pass a `User` to this `sendNewsletter` function. Even
though the types don't match exactly, the type of `sendNewsletter`'s parameter
is a subset of `User`.

```typescript
const sendNewsletter = ({
  firstName,
  email,
}: {
  firstName: string;
  email: string;
}) => {
  console.log(`Sending newsletter to ${firstName} at ${email}`);
};

sendNewsletter(liz);
// "Sending newsletter to Liz at liz@example.com"
```

This is a form of [_type
narrowing_](https://www.typescriptlang.org/docs/handbook/2/narrowing.html)
through [structural
subtyping](https://www.typescriptlang.org/docs/handbook/type-compatibility.html).

# Use An Array Check For Type Narrowing

If you are typing a concatenation function for melding two values together into
a single array, you may end up with a function signature like this:

```typescript
type ConcatFunction = (value: any | any[], array: any[]) => any[];
```

That first argument can be an individual value or an array of values. You'll
need to handle both scenarios in the function implementation. Using the
[`Array.isArray`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray)
function as a _type guard_, you can check differentiate between those two
cases.

```typescript
const concat: ConcatFunction = (value, array) => {
    if(Array.isArray(value)) {
        return [...value, ...array];
    } else {
        return [value, ...array];
    }
}

concat(true, [1,2,3]);
// [true, 1, 2, 3]

concat([1,2,3], ['a', 'b', 'c'])
// [1, 2, 3, 'a', 'b', 'c']
```

This is a form of [type
narrowing](https://www.typescriptlang.org/docs/handbook/2/narrowing.html).

# Zero-Config Environments For Trying Out Types

I've found a few zero-config environments for trying out TypeScript. These are
environments where you can write out type definitions, use them in code, and
see type errors as they arise. These are great if you are following along with
an article as opposed to working with an existing project.

1. [The TypeScript Playground](https://www.typescriptlang.org/play)

This is the quickest environment to jump into. Though TS settings can be
configured, it is just a playground. It is to grab a link to share.

2. [Codesandbox's ts.new](https://ts.new)

This URL shortcut will spin up a brand-new Vanilla TypeScript codesandbox
project. This is a more full-fledged development environment for a TypeScript
project, though still in the bowser. It is also easy to share, and you can
download/export the code.

3. [TSDX](https://tsdx.io/)

This is a zero-config CLI for generating a TypeScript project for package
development. It can generate Vanilla and React TypeScript projects. This lets
you develop on your machine, rather than in a browser.  You'll now need to push
the code to somewhere like GitHub to share it.

[source](https://twitter.com/jbrancha/status/1375876670234722306?s=20)

