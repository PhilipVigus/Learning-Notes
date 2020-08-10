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

### Slices

A slice is a collection of redux reducer logic, actions, selectors etc that relate to a single feature in the app, e.g.

```javascript
import { createSlice } from "@reduxjs/toolkit";

export const counterSlice = createSlice({
  name: "counter",
  initialState: {
    value: 0,
  },
  reducers: {
    increment: (state) => {
      // Redux Toolkit allows us to write "mutating" logic in reducers. It
      // doesn't actually mutate the state because it uses the immer library,
      // which detects changes to a "draft state" and produces a brand new
      // immutable state based off those changes
      state.value += 1;
    },
    decrement: (state) => {
      state.value -= 1;
    },
    incrementByAmount: (state, action) => {
      state.value += action.payload;
    },
  },
});

export const { increment, decrement, incrementByAmount } = counterSlice.actions;

export default counterSlice.reducer;
```

createSlice automatically generates action creators and reducer functions:

```javascript
console.log(counterSlice.actions.increment());
// {type: "counter/increment"}

const newState = counterSlice.reducer(
  { value: 10 },
  counterSlice.actions.increment()
);

console.log(newState);
// {value: 11}
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

## Asynchronous logic and thunks

Thunks are redux functions that can contain asynchronous logic. A thunk is made up of an inner and outer function.

The inner function accepts dispatch and getState as arguments, typically calling dispatch.
The outer function returns the inner function, passing in the payload to be passed into the inner function's dispatch call. e.g.

```javascript
export const incrementAsync = (amount) => (dispatch) => {
  setTimeout(() => {
    dispatch(incrementByAmount(amount));
  }, 1000);
};
```

They can then be called in the same way as an action creator:

```javascript
store.dispatch(incrementAsync(5));
```

An example that fetches data:

```javascript
// the outside "thunk creator" function
const fetchUserById = (userId) => {
  // the inside "thunk function"
  return async (dispatch, getState) => {
    try {
      // make an async call in the thunk
      const user = await userAPI.fetchById(userId);
      // dispatch an action when we get the response back
      dispatch(userLoaded(user));
    } catch (err) {
      // If something went wrong, handle it here
    }
  };
};
```

## useSelector

A hook that extracts data from the store. All you need to do is pass in a selector function and it does the rest. The reason it's needed is that you can't pass the store directly into the component.

```javascript
const countPlusTwo = useSelector((state) => state.counter.value + 2);
```

IMPORTANT - useSelector is the hook the 'subscribes' a component to the store, allowing it to check whether to rerender when the state changes.

## useDispatch

A hook that gives the component the dispatch method from the store, allowing it to dispatch actions.

## The Provider component

Gives components access to the store.

```javascript
import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
import store from "./app/store";
import { Provider } from "react-redux";

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById("root")
);
```
