# Toy Robot Challenge

To view the toy robot game requirements, please view the PROBLEM.md file.

# Install and build

To clone from Github please use:
`git@github.com:kaitlinw/toy_robot.git`

Dependencies:
 `gem install bundler`
 
`bundle install`

## Run the program

Simply type: `ruby start.rb` to get started!

## Run the tests

Please type: `rspec`

## Play (and user test) the game

You must start with the command
`PLACE` followed by X and Y coordinates and a direction it is facing. So type as follows:

`PLACE 2 1 SOUTH` 

Type `MOVE` to move one place.

Type `REPORT` to view where your robot is located.

Type `MOVE` again, to see an error message suggesting you can not move off the board.

Type `RIGHT` to turn to face WEST.

Type `REPORT` to view where your robot is located.

Type `MOVE` to move one place.

Type `MOVE` to move one place.

Type `MOVE` again, to see an error message suggesting you can not move off the board.

Type `HELP` if you get stuck.

Type `EXIT` to exit the game at any time.

## Program structure

The `start.rb` file begins the game loop.
The **Conductor** class manages the game play.
The **Robot** class will manage itself.
The **Board** class will determine the size of the board and if the requested move is legal.
