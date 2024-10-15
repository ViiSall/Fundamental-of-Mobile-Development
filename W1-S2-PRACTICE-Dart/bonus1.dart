/**
 * An orientation to control the robot. We also provide the methods to turn left or right.
 */
enum Orientation {
  UP,
  RIGHT,
  DOWN,
  LEFT;

  Orientation turnRight() {
    return switch (this) {
      Orientation.UP => RIGHT,
      Orientation.RIGHT => DOWN,
      Orientation.DOWN => LEFT,
      Orientation.LEFT => UP,
    };
  }

  Orientation turnLeft() {
    return switch (this) {
      Orientation.UP => LEFT,
      Orientation.RIGHT => UP,
      Orientation.DOWN => RIGHT,
      Orientation.LEFT => DOWN,
    };
  }
}

class Robot {
  /**
   * Create a Robot, given its start X, Y position and orientation
   */
  Robot(this._x, this._y, this._orientation) {}

  Orientation _orientation;
  int _x;
  int _y;

  @override
  String toString() {
    return "position ($_x, $_y)  - orientation : $_orientation";
  }

  goForward() {
    switch (_orientation) {
      case Orientation.UP:
        _y++;
        break;
      case Orientation.RIGHT:
        _x++;
        break;
      case Orientation.DOWN:
        _y--;
        break;
      case Orientation.LEFT:
        _x--;
        break;
    }
    ;
  }

  turnLeft() {
    _orientation = _orientation.turnLeft();
  }

  turnRight() {
    _orientation = _orientation.turnRight();
  }
}

main() {

  Robot myRobot = Robot(7, 2, Orientation.UP);
  print(myRobot);

  // Robot actions as a list of character, see instructions for specifications
  String actions = "AARAARALA";
  for (String action in actions.split("")) {
    switch (action) {
      case "R":
        myRobot.turnRight();
        break;
      case "L":
        myRobot.turnLeft();
      case "A":
        myRobot.goForward();
      default:
        throw Exception("unexpected case : $action");
    }
  }

  print(myRobot);
}