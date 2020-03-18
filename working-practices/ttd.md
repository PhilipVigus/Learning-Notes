[Main TOC](../README.md) / [Working Practices TOC](./working-practices-TOC.md)

# Test driven development

## User stories

User stories are simple descriptions of a feature from the perspective of the person who wants it:

```
As a <user_type>, I want <goal> so that <reason>
```

They can be written in varying levels of detail, covering large or small amounts of functionality. When they cover large amounts, they tend to be called 'epics', eg:

```
As a user, I can backup my entire hard drive
```

Epics tend to be split down into smaller stories, as they are usually too large to be worked on in one agile iteration. Doing this effectively adds detail to the story.

Another way of adding detail is by providing conditions of satisfaction, eg:

```
As a vice-president of marketing, I want to select a holiday season to be used 
when reviewing the performance of past advertising campaigns so that I can 
identify profitable ones.
- Make sure it works for major retail holidays
- Support holidays that span two calender years
- Holiday seasons can be set from one holiday to another
- Holiday seasons can be set to a number of days prior to the holiday
```

## Domain modelling

A domain model is an abstraction of an area of interest, and give a high-level overview of the entities that make up a aprticualr area of interest and the links between them. It is not intended to be a fully-detailed logical description of a system.

Models change over time as a system is developed.

Objects tend to be the nouns in user stories, while messages tend to be a combination of verbs and the object the verb is acting on.

Examples:

```
As a user, so I can find customers, I want to search for my customer by their surnames.
```

Becomes:

| Object | Message |
| ------ | ------- |
| User | - |
| Customer | find-by-surname |

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

```

Becomes:

| Object | Message |
| ------ | ------- |
| Person | - |
| Docking Station | release-bike |
| Bike | are-you-working? |

## Feature tests

A feature test is how your objects and messages are going to communicate in code. 
