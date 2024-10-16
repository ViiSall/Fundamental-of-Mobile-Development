void main() {
  Shape shape = Shape(Point(4, 1), Point(2, 3));
  print(shape.toString());
  print("height: ${shape.height}");
  print("width: ${shape.width}");
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  Point translate(double dx, double dy) {
    return Point(x + dx, y + dy);
  }

  @override
  String toString() {
    return "Point($x, $y)";
  }
}

class Shape {
  Point rightTop;
  Point leftBottom;

  Shape(this.rightTop, this.leftBottom);

  get width {
    return (rightTop.x - leftBottom.x).abs();
  }

  get height {
    return (rightTop.y - leftBottom.y).abs();
  }

  @override
  String toString() {
    return "(${rightTop.x}, ${rightTop.y}), (${leftBottom.x}, ${leftBottom.y})";
  }
}
