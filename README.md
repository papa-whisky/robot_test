## Toy Robot Simulator

### Instructions
- From command line type `ruby main.rb` to start.
- Enter commands, separated by spaces. Valid commands are:
  - `PLACE [x-coordinate],[y-coordinate],[bearing]` to set initial position.
  - `MOVE` to move forward one step in current direction.
  - `RIGHT` to turn 90° right.
  - `LEFT` to turn 90° left.
  - `REPORT` to print present location in format `[x-coordinate],[y-coordinate],[bearing]`
- X and Y coordinates should be between `0` and `4` (inclusive).
- Bearing should be `NORTH`, `EAST`, `SOUTH`, or `WEST`.
- Input is case insensitive.

### Example Inputs/Outputs
- Input: `PLACE 0,0,NORTH MOVE REPORT` Output: `0,1,NORTH`.
- Input: `PLACE 0,0,NORTH LEFT REPORT` Output: `0,0,WEST`.
- Input: `PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT` Output: `3,3,NORTH`.
- Input: `PLACE 4,2,SOUTH MOVE REPORT RIGHT MOVE MOVE REPORT LEFT LEFT REPORT` Output: `4,1,SOUTH 2,1,WEST 2,1,EAST`.
- Input: `PLACE 1,1,NORTH MOVE REPORT PLACE 3,0,EAST MOVE RIGHT REPORT` Output: `1,2,NORTH 4,0,SOUTH`.
