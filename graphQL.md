# GraphQL

An alternate interface to access and mutate data on a server. Compared to RESTful APIs, GraphQL reduces the number of individual requests required, as a page can effectively roll many 'traditiona' REST queries into a single GraphQL query.

There is usually only a single server endpoint when using GraphQL. A query to that endpoint might look like this:

```graphql
query GetPetsByShelter {
  shelters {
    name
    pets {
      name
      photoURL
    }
  }
}
```

which describes the shape of the data the client wants to receive from the server. It is the server's responsibility to fulfil this request, returning the exact data the client is asking for. This often reduces payload sizes from server to client, as the server doesn't have to send unneeded data to the client.

## Schema

Defines the types of data a graph includes. eg:

```graphql
type Book {
  title: String
  author: Author
}

type Author {
  name: String
  books: [Book]
}
```

The schema represents the interface between the front and back end parts of the application.

### Object types

Represent a type of object an application client might have to deal with. eg:

```grapql
type Launch {
  id: ID!
  site: String
  mission: Mission
  rocket: Rocket
  isBooked: Boolean!
}
```

The Launch type is made up of fields, each with their own type. Scalar types are primitive, eg ID, String, Boolean, and resolve to a single value. It is possible to define custom scalar types.

The ! after id and isBooked means that value can never be null.

mission and rocket refer to other object types:

```graphql
type Rocket {
  id: ID!
  name: String
  type: String
}

type User {
  id: ID!
  email: String!
  trips: [Launch]!
}

type Mission {
  name: String
  missionPatch(size: PatchSize): String
}

enum PatchSize {
  SMALL
  LARGE
}
```

[] means an array of that type. []! means it can be empty but not null.

missionPatch accepts an argument, which can be used by the server to alter the data being returned.

### Queries

Queries define actions clients can execute against the data graph. eg:

```graphql
type Query {
  launches: [Launch]!
  launch(id: ID!): Launch
  me: User
}
```

defines 3 queries that can be executed and the types returned from those queries.

### Mutations

Mutations define actions that allow clients to modify the data on the server. eg:

```graphql
type Mutation {
  bookTrips(launchIds: [ID]!): TripUpdateResponse!
  cancelTrip(launchId: ID!): TripUpdateResponse!
  login(email: String): String # login token
}
```

defines 3 mutations, the arguments for each specifying the data provided by the client. A mutation's response type is user-definable, but it is usually best practice to define a specific type. eg:

```graphql
type TripUpdateResponse {
  success: Boolean!
  message: String
  launches: [Launch]
}
```

It is best practice for a mutation to return the objects it modifies so the client can update its cache and UI without having to make a followup query.
