void main() {
  Point point = new Point(x: 1, y: 3);
  point.translate(2, 4);
  print(point.toString());
}

class Point {
  int x, y;
  Point ({required this.x, required this.y});

  @override
  String toString(){
    return "x = $x, y = $y";
  }

  void translate (int dx, int dy){
    this.x += dx;
    this.y += dy;
  }
}