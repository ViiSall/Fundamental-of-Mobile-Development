void main() {
  Point point = Point(1, 2);
  Point newPoint = point.translate(1, 1);
  print(newPoint.toString());
}

class Point {
  final int x, y;
  Point (this.x, this.y);

  @override
  String toString(){
    return "My new Point($x, $y)";
  }

  Point translate (int dx, int dy){
    return new Point(x + dx, y + dy);
  }
}