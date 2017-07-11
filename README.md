# Assignments

The workspace created contains 3 projects, which are used to solve the puzzles given in adventofcode.com, Here I choose to solve the puzzles 1,4 and 10.

Each puzzle will have two parts to resolve, a breif description on each puzzle is listed below:

# Note:
- Every puzzle's respective input is stored in file "Input.txt" and linked to respective project.
- Unit tests are added
- Here solving the puzzle is the motive and hence no UI is required, but to make UI somehow usable I just put the output on the UI.

# Puzzle 1:
Part 1 of the puzzle is to find the shortest path to the destination.

The input and descriprion in the website, indicates that you should start at the given coordinates (where you just landed) and face North. Then, follow the provided sequence: either turn left (L) or right (R) 90 degrees, then walk forward the given number of blocks, ending at a new intersection.

Part 2 of the puzzle is to find the distance that has been revisisted.

Example:
Input will be given as R2, L3
Sum of the number of blocks given in the instruction will give the shortest path, which is 5 for the above example.
So, input must be parsed and summed up to find the shortest path.


# Puzzle 4:
Here the input given is a list of rooms, the list is encrypted anf full of decoy data.
Instructions are provided on how to decrypt and find whether the room is a real room or not.

Example:
aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are a (5), b (3), and then a tie between x, y, and z, which are listed alphabetically.

In checksum, Most used letter must be in the first index and then the rest of letters follow, if the 2 letters have same count, then they should be alphabetical, as in the case of x,y and z above. If the checksum is valid then room is real.


Part 1 of the puzzle is to find the sum of sector ids of real rooms
Part 2 of the puzzle is to decrpyt using shift-ciper and find the room which has "north pole" in it.

# Puzzle 10:
Puzzle 10 is about robots. Inorder to work, a robot needs two micro-chips. once it does the job, it gives the chip to other robots or puts in a marked output bin.

Example of how input looks like:
"value 5 goes to bot 2
bot 2 gives low to bot 1 and high to bot 0
value 3 goes to bot 1
bot 1 gives low to output 1 and high to bot 0
bot 0 gives low to output 2 and high to output 0
value 2 goes to bot 2"

Initially, bot 1 starts with a value-3 chip, and bot 2 starts with a value-2 chip and a value-5 chip.
Because bot 2 has two microchips, it gives its lower one (2) to bot 1 and its higher one (5) to bot 0.
Then, bot 1 has two microchips; it puts the value-2 chip in output 1 and gives the value-3 chip to bot 0.
Finally, bot 0 has two microchips; it puts the 3 in output 2 and the 5 in output 0.

In the end, output bin 0 contains a value-5 microchip, output bin 1 contains a value-2 microchip, and output bin 2 contains a value-3 microchip. 
In this configuration, bot number 2 is responsible for comparing value-5 microchips with value-2 microchips.

Part 1 is to find the responsible bot for value 61 and 17 microchips for the give input.
Part 2 is to multiply the values present in output bin marked 0, 1 and 2.




