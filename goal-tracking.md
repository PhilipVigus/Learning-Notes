[Main TOC](../README.md)

# Goal tracking

## Values

- Independence
- Personal and team growth
- Physical and mental health
- Enjoyment

# Long-term goals

- Get a job as a software engineer
- Maintain a healthy work/life balance

# Course goals

- Gain self-belief that I can do this
- Gain skills required to be a software engineer
	- Build anything
	- Help my team succeed
	- Be able to continue learning and growing after the course completes
- Enjoy myself
- Make software
	- TDD anything
	- Program fluently
	- Debug anything
	- Model anything
	- Refactor anything
	- Have a methodical approach to solving problems
- Be equipped for long term growth
	- Manage my own wellbeing
	- Learn anything for myself
- Help my teams succeed
	- Use agile product development
	- Write code that's easy to change
	- Justify the way I work
	- Grow collaboratively

# Week 1

- Test-drive a simple program using objects and methods. A specific weakness I have is breaking a problem down into individual tests and working out the order in which to implement those tests
- Pair using the driver-navigator style
- Follow an effective debugging process
- Describe some basic OO principles like encapsulation, SRP
- Become familiar with remote-working

### Plan

- Work through Boris Bike challenge. Concentrate on the navigator/driver dynamic
- Follw the debugging procedure that we learnt on day 2 rigidly until it becomes second nature
- Work through the practicals relating to TTD
- Revise OO principles from previous learning

### Evidence

- TODO

### Daily - Wednesday

- Goal - Become more comfortable with debugging
	- Plan - Work through the Debugging Approaches practical
	- Evidence - Exercise completed with screencap videos
	- Retrospective - The exercise definitely helped, and by the end I was much more comfortable with the process and taking my time to understand the code rather than plowing in and making semi-random changes
- Goal - Practice TDD
	- Plan	- Work through TDD exercises
	- Evidence - Still need to complete test driving 1
	- Retrospective - TODO

### Daily - Thursday

- Goal - Clarify outstanding issues from yesterday
	- Plan - ask other students and/or Josh about
		- process for branching when working with new pair partners
		- clarify use of red-green-green in Boris Bikes challenge and whether to also swap roles after writing a test and making it fail
		- what does the be_working RSpec method do?
			
			```ruby
			it 'releases working bikes' do
              bike = subject.release_bike
              expect(bike).to be_working
          end
			```
	- Evidence - will write up answers as/when I get them
	- Retrospective - I managed to clarify all of these questions by asking one of the coaches and checking my understanding with other students.
		- branching doesn't solve the problem of ending up with multiple versions of a repo at the end of the week, but it does help us practice a technique we will use when working professionally.
		- [This](https://tanzu.vmware.com/content/blog/what-s-the-best-way-to-pair) link explores different strategies for swapping roles while pairing, and it's worth exploring what does and doesn't work for you
		- be\_working is a 'magic' rspec function. More generally be\_function-name will exercise that function on the instance specified as the argument to expect. In this case, working returns true, so the test passes 
- Goal - practice TDD
	- Plan - complete the following exercises
		- [test driving 1](https://github.com/makersacademy/skills-workshops/blob/master/practicals/test_driving.md)
		- [birthdays TTD exercise] (https://github.com/makersacademy/birthdays) 
	- Evidence - github repo for each completed exercise
	- Retrospective 
		- The test driving 1 exercise was relatively straightforward to complete. Following some misunderstandings when working through Boris Bikes with my pair partner yesterday, I took the opportunity to extend the code for this exercise and implement it as a full class. I found this much easier to do this time around, and am pleased that I seem to be understanding the concepts involved more.
		- I started the birthdays exercise but was unable to finish it as the TTD workshop overran. The part I started seemed to go smoothly though, and I felt I understood the process of what I was doing a lot more

### Daily - Friday

- Goal - Clarify issues from previous day
	- Plan - get answers to the following questions
		- When and why would you use the shorthand form of it blocks given that they reduce the self-documenting nature of test code?
		- How do you deal with mocking and the fact that separating units in testing means you have to maintain the mocks separately when you change a unit's public interface
	- Evidence - write up in learning notes
	- Retrospective - TODO
- Goal - Continue to improve my familiarity with TDD
	- Plan - complete the birthdays TTD exercise I started yesterday
	- Evidence - the completed repo
	- Retrospective - TODO
- Goal - Look at basic OOP principles
	- Plan - work through [this](https://github.com/makersacademy/skills-workshops/tree/master/week-1/oop_1) general introduction and then [this](https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/encapsulation.md) exercise on encapsulation