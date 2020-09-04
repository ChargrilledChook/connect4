# connect4
An assignment for the testing section of [The Odin Project's](https://www.theodinproject.com/courses/ruby-programming/lessons/testing-your-ruby-code#project-tdd-connect-four) ruby curriculum.

## About

A simple command line version of the classic game [Connect 4](https://en.wikipedia.org/wiki/Connect_Four) for two players. Press run on Replit to play. Originally designed with colour but doesn't work on replit, sorry. Get four in a row to win.

## Reflections

### Testing / TDD

The core focus of this project was writing tests and practicing TDD, which was simultaneously rewarding and frustrating. I began using a proper TDD approach with unit tests for the core logic of program, such as the various win conditions.

Parts I didn't TDD ended up being harder to test afterwards and harder to change - partly a design issue but also a pretty good insight into the strengths of TDD.

Things being hard to test were often a sign to refactor anyway, and were a good signal to change things up before they got too complicated or entangled.

I particularly enjoyed it for unit tests, lead to better code. Red green refactor is an incredibly satisfying and useful paradigm.

I struggled somewhat with mocking and stubbing, and knowing what and how to test when it came to 'outgoing command messages'. I'd have preferred to have gotten the state of some of these style of tests to a better level but it's time to learn the lessons and move on.

### Minitest

While the main focus of the Odin curriculum is on Rspec, I chose to experiment with minitest for a few reasons.
It's the number 2 framework and a little bit of familiarity with the two major options is useful, both if I see it in the wild and to choose the best option for my own purposes. Notably, it's used for exercism and codwars.

Secondly I got a bit stuck mentally with rspec and this was a good way out of it. Writing tests in plain ruby instead of the Rspec dsl helped me focus on testing concepts rather than learning the ins and outs of another mini language. Testing seemed to 'flow' better this way and was very good for the simple unit tests.

When I needed to begin mocking and stubbing, I found documentation and tutorials a bit lacking. This is probably a combination of my own inexperience and there being a smaller ecosystem for minitest.

Going forward I'll probably go back to rspec due to the higher level of support (both on Odin and more generally) but don't regret trying minitest out, and probably prefer it to rspec for testing small / simple things.


### Design

While far from perfect I think this was a good progression and improvement from earlier work.
I generally had shorter methods and classes, and tried a bit harder as I went along to keep things modular / extensible. This wasn't a complete success, especially when realising that some design choices were simply tradeoffs. Despite that it still feels easier to read, reason through and change than previous code. Main thing I would change is probably trying to tease apart the board, ref and game somewhat (board is currently referred to by both ref and game.)

### Core Problems

The main challenge unique to this project from a problem solving standpoint was checking diagonal win conditions. While in theory similar to Tic Tac Toe, the size of the board (6 x 7) with lines of 4 made solving these checks programatically much more complicated. In the end I opted for mapping the win conditions to constants, this lead to a reasonably simple / clean way to check wins, at the cost of only working for that specific size board. Changing the board size would necessitate updating the constants manually. Less than ideal but probably optimal for a bounded problem like this.


## Tricks

Small hack to run whole test suite (run on command line):

for file in test/*.rb; do ruby $file; done

Also added a rake file which can run the whole suite by typing rake in the console.

## Follow Up

Back to rspec for chess, might need to do a bit of a dive into rspec specifically. Attempt to get better at mocks and stubs. Try to keep TDDing where possible.
