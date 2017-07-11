# Assignments

The workspace created contains 3 projects, which are used to solve the puzzles given in adventofcode.com, Here I choose to solve the puzzles 1,4 and 10.

Each puzzle will have two parts to resolve, a breif description on the puzzle is listed below:

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




