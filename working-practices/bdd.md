[Main TOC](../README.md) / [Working Practices TOC](./working-practices-TOC.md)

# Behaviour-driven development

BDD is closely related to TDD and relates acceptance or feature tests to unit tests. Feature tests describe high-level behaviour, often deriving from user stories.

It is an iterative process, where you move from a user story to a feature test, then to unit tests and finally to the features that allow the code to pass the unit tests. You then start the cycle again with the next feature.

BDD reduces over-engineering, keeying you focused on features that the users need to make the software do what it needs to and no more.

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

An important stage in BDD is to order user stories by importance, choosing the key stories to focus on and turn into feature tests. These stories are described as delivering the **key value**

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

## Tests

Tests are written for a number of reasons:
- They force you to think about what you want out of your program
- They check the functionality of the program against expected behaviour
- They ensure what you're building is still working after you make changes in the future

We write them before we write code because:
- it forces you to break down what you want to achieve into smaller chunks
- it forces you to think about what the program is going to do first rather than how to do it
- it helps avoid writing tests to justify the program rather than fitting user requirements

### Feature tests

A feature (or acceptance) test describes how a high-level feature in your app/program will operate. 

### Unit tests

Unit tests test a single component in a system, ideally in isolation from other components. After a feature test is devised, it is implemented as a series of unit tests, often following TDD. Each cycle of TDD results in a single, implemented unit test.

(It's worth noting that there is another type of test, an integration test, that falls somewhere between feature and unit tests. These test interactions between sub-sets of individual components in more complex systems)

The rough proportion of tests in a more complex system might be 10% feature tests, 20% integration tests and 70% unit tests. Feature and integration tests tend to run more slowly due to their complexity, and are generally not run every time you change your code.

## TDD

TDD is the process by which an individual feature test is made to pass.

Three rules

- only ever write production code if it is to make a failing test pass
- only write enough of a unit test to make the test fail
- only write enough production code to make a single unit test pass

The four phases of a unit test

- Setup - sets up the system under test, eg by creating the relevant class, object etc
- Exercise - execute the system under test
- Verify - make sure the results of the test match your expectations
- Teardown - reset the system to the pre-setup state

## Red-Green-Green

Both BDD and TDD follow the same general pattern:
- Write the test and watch it fail (Red)
- Make the test pass (Green)
- Refactor if necessary (Green)

## Doubles, mocks and stubs

A double is a simplified object that takes the place of another in a test. It can have fake methods called stubbs added, which tell the double how to respond to method calls. Stubs can also be added to real objects to override/guarantee responses to method calls. They can:

- Act as a placeholder for an object that doesn't exist
- Replace random behaviour with predictable for the purpose of testing
- Simplify the set-up phase of a test
- Ensure tests are fast by avoiding having to use code that is slow and complex

A mock is a stub with a built-in expection to be satisfied during the test.

A complete example:

```ruby
context '#buy' do
  let(:user) { User.create }
  let(:book) { double('fake book') }	# A simple double

  context 'when book is digital' do
    before do
      # Adding a stub to the double
      allow(book).to receive(:ebook?).and_return(true)
    end

    it 'does not call decrease_count_on_hand' do
      
      # This is a mock, as you set an expectation 
      # that decrease_count_on_hand will not be called
      expect(book).not_to receive(:decrease_count_on_hand)

      user.buy(book, 1)
    end
  end

  context 'when book is not digital' do
    before do
      allow(book).to receive(:ebook?).and_return(false)
    end

    it 'calls decrease_count_on_hand' do
    
      # This is also a mock, as you set an expection
      # that decrease_count_on hand will be called with
      # with a specific argument and return a specific value
      expect(book).to receive(:decrease_count_on_hand).with(1).and_return(true)

      user.buy(book, 1)
    end
  end
end
```




You have to be extremely careful using these techniques. They can lead to the following situations:

- You have a stubbed double that represents an object that doesn't exist yet the associated tests that use it pass. This can lead to a false sense of security about the confidence you have in your code.
- You have an isolated units test that utilises doubling to remove a dependency on another class. When the public interface to that class changes, the test will still work because the doubles haven't changed. However, a feature test using the two classes together would fail. This is why you should ensure you have integration/feature tests.