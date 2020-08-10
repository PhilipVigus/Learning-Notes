# Redux

Manages global state. Most useful in the following circumstances:

- when you have large amounts of data required in many places
- state is frequently updated over time
- the logic to update state is complex
- you have a large codebase being worked on by many people

## Immutability

Redux expects ALL state updates to be done immutably. This means that state MUST be copied and changed rather than just changed.

## Terminology

### Actions

A plain JS object with a type field and optional payload. e.g.

```javascript
const addTodoAction = {
  type: "todos/todoAdded",
  payload: "Buy milk",
};
```

### Action creators

Action factories. Functions that create and return an action object, so you don't have to write the action out by hand each time you want one. e.g.

```javascript
const addTodo = (text) => {
  return {
    type: "todos/todoAdded",
    payload: text,
  };
};
```

### Reducers

Functions that accept actions and current state, and decided how to update the current state if necessary, returning the new state.

They have some specific rules:

- must only use the action and current state to decide what to do
- must not modify existing state, making immutable updates instead
- must not use asynchronous logic, random values or other side effects

Typical logic:

1. Do I care about this action?
2. If I do, make a copy of the state and update it as appropriate
3. If I don't, return the state unchanged

e.g.

```javascript
const initialState = { value: 0 };

function counterReducer(state = initialState, action) {
  // Check to see if the reducer cares about this action
  if (action.type === "counter/increment") {
    // If so, make a copy of `state`
    return {
      ...state,
      // and update the copy with the new value
      value: state.value + 1,
    };
  }
  // otherwise return the existing state unchanged
  return state;
}
```

### Store

Where the current Redux state lives. Created by passing in a reducer, and has a method, getState, that returns the current state.

### Dispatch

`store.dispatch(actionObject)` is the only way of updating the current state of the store.

Dispatching an action effectively triggers an event in the application. Action creators are typically called to dispatch the right action.

### Selectors

Functions that extract specific pieces of information from the store.

```javascript
const selectCounterValue = (state) => state.value;

const currentValue = selectCounterValue(store.getState());
console.log(currentValue);
// 2
```

## Redux dataflow

### Initialisation

1. Create a store using a root reducer function
2. Store calls the reducer once, setting the initial state
3. The UI is rendered for the first time
   - components access store state to decide what to render
   - components subscribe to updates to they know if the state changes

### Updates

1. Something happens in the app, e.g. the user clicks a button
2. App code dispatches an action to the store
3. Store runs the reducer against the previous state and the current action, saving the return value in the new state
4. Store notifies all subscribed components of the state change
5. Components see if the part of the state they're interested in has changed
6. If it has, the component rerenders
