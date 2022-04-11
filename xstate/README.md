### Category xstate

---

 - [Always Use Inline Functions With Assign](#always-use-inline-functions-with-assign)
 - [Custom Jest Matcher For XState Machine States](#custom-jest-matcher-for-xstate-machine-states)
 - [Define Event That Does Internal Self Transition](#define-event-that-does-internal-self-transition)
 - [Events Stop Propagating Once Handled](#events-stop-propagating-once-handled)
 - [Inline Actions vs Actions In Machine Options](#inline-actions-vs-actions-in-machine-options)
 - [Make Immediate And Delayed Transitions](#make-immediate-and-delayed-transitions)
 - [Simple States And Composite States](#simple-states-and-composite-states)
 - [Start A Machine In A Specific State](#start-a-machine-in-a-specific-state)
 - [Use An XState Machine With React](#use-an-xstate-machine-with-react)

---

# Always Use Inline Functions With Assign

The [`assign`
action](https://xstate.js.org/docs/guides/context.html#assign-action) allows
you to update the context of the state machine.  There are a couple ways to use
`assign`, but you should prefer the inline function style.

Technically `assign` can be passed an object literal like so to set a static
value:

```javascript
{
  actions: {
    resetCount: assign({
      count: 0
    })
  }
}
```

However, this causes confusion for the TypeScript compiler and can create
surprising and unrelated type errors in the parts the code that use the
machine.

To keep the compiler happy, you should instead use inline functions. Either
like this:

```javascript
{
  actions: {
    resetCount: assign((_context) => {
      return {
        count: 0
      }
    })
  }
}
```

or like this:

```javascript
{
  actions: {
    resetCount: assign({
      count: (_context) => 0
    })
  }
}
```

# Custom Jest Matcher For XState Machine States

Here is a custom matcher for asserting the current state of an XState machine
for Jest-based tests. I made some adaptations to it, but it was mostly
developed by [Nick
Nisi](https://discord.com/channels/795785288994652170/809564635614150686/897559009077362738).

```typescript
import {State} from 'xstate'

declare global {
  namespace jest {
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    interface Matchers<R> {
      toMatchState(state: string): CustomMatcherResult
    }
  }
}

expect.extend({
  toMatchState(state: State<unknown>, value: string) {
    return {
      pass: state.matches(value),
      message: () =>
        `Expected
  "${JSON.stringify(state.value)}"
state to match
  "${JSON.stringify(value)}"`,
    }
  },
})
```

To make this available to your tests, place it in your `setupTests.ts` (or
`.js`) file, assuming that is configured in your `jest.config.js`.

It can be used in your tests like so:

```javascript
test("it transitions to open and back to closed", async () => {
  const service = interpret(confirmationMachine);

  service.start();

  service.send({
    type: "OPEN_DIALOG",
    doubleConfirmText: "taco",
    action: jest.fn()
  });

  expect(service.state).toMatchState({ open: "idle" })

  service.send({ type: "CANCEL" });

  expect(service.state).toMatchState("closed")
});
```

Notice you can pass either a string or object representation of the state, if
there is nesting.

What is nice about this custom matcher is the informative failure messaging.

# Define Event That Does Internal Self Transition

An XState `state` can contain a state transition in the `on` object that
represents a [_self
transition_](https://xstate.js.org/docs/guides/transitions.html#self-transitions).
A self transition means that the state points to itself. In response to that
event, it will transition directly to itself, instead of to another state node.

An
[_internal_](https://xstate.js.org/docs/guides/transitions.html#internal-transitions)
self transition is one in which the transition occurs, but it never _exits_ its
state node. That means `entry` and `exit` actions won't be triggered.

The parent state node can transition directly to itself or to a child node.
Here are a couple ways to define internal self transitions directly to the
parent node.

1. Implicit

```
states: {
  counting: {
    on: {
      INCREMENT: {
        actions: ['incrementCount'],
      },
    },
  },
},
```

No `target` is declared for `INCREMENT`, so an internal, self-transition is
implicit.

2. Explicit

```
states: {
  counting: {
    on: {
      INCREMENT: {
        internal: true,
        actions: ['incrementCount'],
      },
    },
  },
},
```

This says that the transition should be an `internal` one.

3. Undefined Target

```
states: {
  counting: {
    on: {
      INCREMENT: {
        target: undefined,
        actions: ['incrementCount'],
      },
    },
  },
},
```

An undefined target is an internal, self-transition.

[source](https://dev.to/jbranchaud/1-7-gui-tasks-with-react-and-xstate-counter-4l9i)

# Events Stop Propagating Once Handled

In a hierarchical (or nested) XState machine, events are sent to the inner most sub-state of
the current state. If that state handles the event, then it won't propagate up
to parent states. If a state receives an event that it doesn't handle, that
event will propagate up to parent states until it is handled or there is
nothing to handle it.

Let's look at an example.

```javascript
{
  initial: "active",
  context: { count: 0 },
  states: {
    active: {
      on: {
        COUNT: {
          actions: "changeCount",
        },
      },
      initial: "increment",
      states: {
        increment: {
          on: {
            SWITCH_COUNT_DIRECTION: "decrement",
          },
        },
        decrement: {
          on: {
            SWITCH_COUNT_DIRECTION: "increment",
            COUNT: {
              actions: 'logEvent'
            },
          },
        },
      },
    },
  },
};
```

This machine starts in the `active.increment` state.

If I send the `COUNT` event, it will first go to the `active.increment` state.
It isn't handled there, so it will propagate up to `active` where it is
handled.

Now let's say I transition to `active.decrement`. If I send the `COUNT` event,
it will first go to `active.decrement` where it is handled. The `logEvent`
action happens and then the event stops. The `active` state does not receive
nor handle the `COUNT` event.

[source](https://twitter.com/jbrancha/status/1418269852398129152?s=20)

# Inline Actions vs Actions In Machine Options

When first spec'ing out a machine, I find it easiest to add my on-transition
actions directly inline.

```javascript
const countingMachine = createMachine({
  initial: "counting",
  context: { count: 0 },
  states: {
    counting: {
      on: {
        INCREMENT: {
          actions: assign({
            count: (context) => context.count + 1,
          }),
        },
      },
    },
  },
});
```

This is not what the XState docs recommend once you move beyond prototyping
your machine.

> It is not recommended to keep the machine config like this in production
> code, as this makes it difficult to debug, serialize, test, and accurately
> visualize actions.

When you're ready, you can refactor this by referencing the action by name and
then moving the action declaration to the `actions` object of the machine
options (second argument to `createMachine`).

```javascript
const countingMachine = createMachine({
  initial: "counting",
  context: { count: 0 },
  states: {
    counting: {
      on: {
        INCREMENT: {
          actions: 'incrementCount',
        },
      },
    },
  },
},
{
  actions: {
    incrementCount: assign({
      count: (context) => context.count + 1,
    }),
  },
});
```

When the machine interpreter sees `'incrementCount'`, it knows to look for an
action by that name in the machine options.

[source](https://xstate.js.org/docs/guides/actions.html)

# Make Immediate And Delayed Transitions

An [XState](https://xstate.js.org/docs/) state can define an `on` key with an
object. The object can define one or more events that the state listens for and
transitions in response to. In addition to transitioning in response to an
event, you can have a state do both _immediate_ and _delayed_ transitions.

Here is an example state machine.

```javascript
export const loadingSpinner = createMachine(
  {
    initial: 'pending',
    context: {},
    states: {
      pending: {
        always: [
          { target: 'loading' }
        ]
      },
      loading: {
        after: {
          5000: { target: 'done' }
        }
      },
      done: {
        final: true
      }
    }
  }
);
```

This machine will start in the `pending` state. The `always` object will
immediately fire which will trigger a transition to the `loading` state. There
the `after` object will schedule a transition to the `done` state to happen in
5 seconds (5000ms).

The
[`always`](https://xstate.js.org/docs/guides/transitions.html#eventless-always-transitions)
is the immediate transition. The
[`after`](https://xstate.js.org/docs/guides/delays.html#delayed-transitions) is
the delayed transition.

The "eventless" `always` transition, in practice, is more useful when combined
with a condition. That allows you to define an immediate transition that only
takes place if some condition has already been met (e.g. does the `context`
already contain the thing we were about to look up?).

# Simple States And Composite States

XState allows you to build [hierarchical state
machines](https://xstate.js.org/docs/guides/hierarchical.html). A hierarchical
state machine is one where there are substates nested under states.

States with nothing nested under them are _simple states_. States that have
substates are _composite states_.

```javascript
const machine = createMachine({
  // Starting State
  initial: "active",
  // Starting Context
  context: { count: 0 },
  // States
  states: {
    inactive: {
      always: { target: "active" },
    },
    active: {
      on: {
        SWITCH_COUNT_DIRECTION: {
          actions: ["logSwitch", "consoleLogSwitch"],
        },
        COUNT: {
          actions: "changeCount",
        },
      },
      initial: "increment",
      states: {
        increment: {
          on: {
            SWITCH_COUNT_DIRECTION: "decrement",
          },
        },
        decrement: {
          on: {
            SWITCH_COUNT_DIRECTION: "increment",
          },
        },
      },
    },
  },
});
```

- The `inactive` state is a _simple state_. There is nothing nested under it.
- The `active` state is a _composite state_. There are two substates
  (`increment` and `decrement`) nested under it.
- The `increment` and `decrement` states are both _simple states_. Nothing is
  nested under them.

# Start A Machine In A Specific State

For testing (or debugging) purposes, it can be handy to get an XState machine
running from a specific state.

Let's say a machine has an initial state of `green` and the other states it can
be in are `yellow` and `red`. And `yellow` has sub-states of `walk` and
`hurry`.

By default, a machine will start in the specified initial state.

```javascript
const service = interpret(trafficLightMachine);

service.start();

service.state.value; //=> 'green'
```

We can tell the traffic light service to start in the `red` state instead.

```javascript
service.start('red');

service.state.value; //=> 'red'
```

We can even tell it to start in a sub-state (nested state) of a particular
state.

```javascript
service.start({ yellow: 'hurry' });

service.state.value; //=> { yellow: 'hurry' }
```

[source](https://xstate.js.org/docs/guides/interpretation.html#starting-and-stopping)

# Use An XState Machine With React

There are a bunch of well-constructed XState machines available to directly
copy into your project from [XState Catalogue](https://xstate-catalogue.com/).
For instance, I can grab the [Confirmation Dialog
machine](https://xstate-catalogue.com/machines/confirmation-dialog) and paste
it into `confirmMachine.js`. Then I can grab
[`@xstate/react`](https://xstate.js.org/docs/packages/xstate-react/) which
comes with a `useMachine` hook.

```javascript
import * as React from "react";
import { useMachine } from "@xstate/react";
import confirmMachine from "./confirmMachine";
import Dialog from "./dialog";

export default function App() {
  const [current, send] = useMachine(confirmMachine);

  const deleteAction = () => { /* ... */ };

  const showDialog = current.value !== "closed";
  const open = () => {
    send({ type: "OPEN_DIALOG", action: deleteAction });
  };
  const close = () => {
    send("CANCEL");
  };
  const confirm = () => {
    send("CONFIRM");
  };

  return (
    <div className="App">
      <Dialog
        message="Are you sure you want to delete something?"
        handleConfirm={confirm}
        handleClose={close}
        showDialog={showDialog}
        errorMessage={current.context.errorMessage}
      />
      {/* other stuff */}
    </div>
  )
}
```

The `useMachine` call both interprets and starts up the machine service. The
`current` value is everything about the _current_ state of the machine. The
`send` is a function for dispatching transitions between machine states.

