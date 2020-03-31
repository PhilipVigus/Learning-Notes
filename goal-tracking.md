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
- Succeed with Process Workshops
	- Get a list of good katas I can practice by myself with
		- https://kata-log.rocks/bowling-game-kata	- Practice, recording my process and ask a coach to revew the video
	- Practice with a live partner, asking them to observe take notes and feed back
	- Go to more process workshops to use and reinforce what I have learned

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
	- Retrospective - I spoke to my coach and confirmed my understanding of both of these issues was sound, which was extremely encouraging. He agreed that you have to be careful about how you use the short-hand version of it blocks, and that in practice it comes down to a team decision as to which you use. He also confirmed that the issue with mocks and doubles exists and that it is handled by using integration tests to test the public interfaces between classes.
- Goal - Continue to improve my familiarity with TDD
	- Plan - complete the birthdays TTD exercise I started yesterday
	- Evidence - the completed repo
	- Retrospective - I completed this, although failed my reading comprehension as I missed one of the stages and had to do it last, out of order. I am very happy with the work I eventually produced though and feel I now have a much better understanding of TDD and how to practice it than I did at the beginning of the week.
- Goal - Look at basic OOP principles
	- Plan - work through [this](https://github.com/makersacademy/skills-workshops/tree/master/week-1/oop_1) general introduction and then [this](https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/encapsulation.md) exercise on encapsulation
	- Evidence - I was unable to complete this exercise as I ran out of time

	# Week 2
	
	## Overall
- Goal - Use all of week 1's skills (don't underestimate the importance of this)
	- Evidence - Definitely met this goal, and I found the weekend challenge relatively straightforward because of this
- Goal - Break one class into two classes that work together, while maintaining test coverage
 	- Evidence - working through the Gilded Rose project help me practice this a lot
- Goal - Unit test classes in isolation using mocking
	- Evidence - continual through the week. This skill came up repeatedly in the various tasks I completed
- Goal - Explain some basic OO principles and tie them to high level concerns (e.g. ease of change)
	- Evidence - This suprisinly felt more like revision for me. I seem to have retained a decent amount of previous knowledge in this area, and am reasonably confident around this. In our peer group we also discussed this too
- Goal - Review another person's code and give them meaningful feedback
	- Evidence - we had a go at this on Monday, and it seemed to go well. The feedback I got was a little limited though, so if this happens again next week I'll probably ask a coach to review my code for me too
- Goal - Be okay with not completing all of the end of week challenge
 	- Evidence - I managed to take the whole of Sunday off, which is wonderful. However, I still woke up at half-past four on Monday morning and couldn't get back to sleep, so more work is needed.
- Goal - Work goal-tracking into the regular hours
	- Evidence - I'm getting better at doing this, in particular updating goal progress as I do it rather than leaving it to the end of the day. I still need to practice though, as I'm not yet in the habit of doing it consistently
- Goal - Complete a blog entry for the week
	- Evidence - partially complete, to finish next week

- Retrospective - This was a difficult week for me on a personal level. I faced a number of blocks and worries that although not suprising, were still difficult to deal with. Luckily I had the support my my coach and peer group to help me through the worst of it. I feel like I made quite a lot of progress this week. The pair programming and guilded rose projects in particular were a lot of fun to complete, and quite challenging.
### Monday

- Goal - Practice code review for the first time
	- Evidence - It went okay, although my pair was unable to find much in my code to suggest changes for. My next step with this will be to ask a coach to review my code for me.
- Goal - Consolidate week 1 skills
	- Evidence - Pairing today went extremely well. After a slow start we made fast and effective progress, and both of our understanding of the material increased a great deal. Its also important to note that this is the third time I've received feedback stating that it was the best pairing session the other person had had so far, which is excellent evidence that I'm doing something right with the pairing aspect of things.

		I also spoke to my coach about my progress so far, and he recommended concentrating on a more challenging project in my self-directed time this week. It seems I was correct in thinking I need to be stretched a little more, and this is how he wants me to do it.
- Goal - Work out where to fit in goal tracking.
	- Evidence - I've thought about this, and the best approach I have is to update the goals as I go through the day, filling in evidence as and when I make progress. I'm going to try this for the rest of the week and see how it works. 

### Tuesday

- Goal - Start working on the Gilded Rose project as suggested by my coack
	- Evidence - Started a little bit of work on this
- Goal - Complete my goal-tracking before 6pm today so there is none left over for tomorrow morning
	- Unable to complete 
- Goal - Brainstorm some blog ideas
	- Unable to complete 
- Goal - Look at OO principles
	- Evidence - I wrote up an overview of a number of OO concepts - encapsulation, abstraction, dependency injection, coupling and cohesion

	Overall, I had a lot less time today than I anticipated due to morning workshop overrunning
	
### Wednesday

- Goal - Continue working on the Gilded Rose project as suggested by my coach
	- Evidence - Made quite a lot of progress with this today. The code is looking a lot cleaner, and I've managed to refactor much of it into separate methods
- Goal - Complete my goal-tracking before 6pm today so there is none left over for tomorrow morning
	- Evidence - Completing the goal tracking
- Goal - Brainstorm some blog ideas
	- Evidence - This didn't get done
- Goal - Look at OO principles (polymorphism, inheritance and composition
	- Evidence - This didn't get done
- Goal - Attend process workshop
	- Evidence - I attended, but really struggled. Initially there were technical problems with my first partner, so we had to give up. I eventually paired with someone else, but we didn't have much time. When I started, I went completely off the rails and my brain froze. I got into a deadend and didn't know how to get out. I got discouraged, anxious and eventually had to stop. I don't know how to get past the block, and will ask to work through a problem with a coach tomorrow.

### Thursday

- Goal - work through one of the process workshop questions with a coach
	- After discussing with my coach, we agreed this step was unnecessary. They advised to move straight to recording myself doing exercises and then them reviewing them instead, which I'll do tomorrow.
- Goal - brainstorm some blog ideas
	- Evidence - Working through the apocalypse, a personal guide to taking the Makers course remotely while you're partner is also at home working. 
- Goal - OO principles
	- Evidence - I went through inheritence, composition and polymorphism, adding notes to my learning notes as appropriate. We also discussed concepts during our peer meeting at the start of the day, which really helped to confirm everyone's understanding.
- Goal - Gilded rose
	- Made some progress with refactoring, and have now split the main logic into nice, small methods. However, I'm stuck on using stubs with dependency injection in order to test the ItemInterface class without any dependencies on Item. I've created a pull request and pinged Josh as he requested, and will now wait to hear what he has to say about the code and whether there's anything I can do to improve it.
- Goal - Think about my approach to pairing and the way I set myself up mentally beforehand
	- I discussed this with a coach and we agreed it would be helpful to bring up my reflection with the group as a whole as part of the retrospective 

### Friday

- Goal - complete one of the process workshop tests independently and record the result. Send it to a coach for review
	- Evidence - I have the completed video sat on my desktop at the moment, but have been unable to find a coach able to review it at this point
- Goal - Write a blog
	- Evidence - blog started, will continue writing early next week
- Goal - Continue with Gilded Rose, implementing Dependency Injection properly
	- Evidence - I continued working on this and implemented DI successfully using doubles. I've now run into a bug, which is next on my list of things to work on with this project
- Goal - Feedback on self-reflection during retrospective
	- Evidence - this was a little underwhelming. I added something related to this to the retrospective board, but it didn't come up in conversation. It think I'm just going to trust that now people have seen someone raised the issue, it will self-correct rather than having to be discussed specifically.

# Week 3

## Overall

- Goal - Build a simple web app
- Goal - Follow an effective debugging process for web applications
- Goal - Explain the basics of how the web works (e.g. request/response, HTTP, HTML, CSS)
- Goal - Explain the MVC pattern
- Goal - Get one of the coaches to review my takeway challenge code
- Goal - Continue building confidence with process workshops
	- 

### Monday

- Goal - Build a simple web app
	- Evidence - work through https://github.com/makersacademy/skills-workshops/blob/master/practicals/servers_and_clients/servers.md
	- Evidence - work through https://github.com/makersacademy/skills-workshops/blob/master/practicals/servers_and_clients/clients.md
		- Both of the above completed and working well
	- Evidence - write up a blog article explaining what you've learned
		- Not done. I had some meetings that overran, and attended a workshop instead

### Tuesday

- Goal - Review Josh's feedback on process recording and update process accordingly
- Goal - Write a blog
- Goal - https://github.com/makersacademy/skills-workshops/blob/master/practicals/servers_and_clients/http_servers.md