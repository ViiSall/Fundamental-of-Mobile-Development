// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
}

enum windowColor { red, green, blue, yellow, gray, cyan }

extension WindowColorStringConverter on windowColor {
  String get stringColor {
    switch (this) {
      case windowColor.red:
        return 'Red';
      case windowColor.green:
        return 'Green';
      case windowColor.blue:
        return 'Blue';
      case windowColor.yellow:
        return 'Yellow';
      case windowColor.gray:
        return 'Gray';
      case windowColor.cyan:
        return 'Cyan';
    }
  }
}

// Window
class Window {
  String material;
  windowColor color;
  double size;
  int panel;

  Window({
    required this.material,
    required this.color,
    required this.size,
    required this.panel,
  });
}

// Door
class Door {
  String material;
  String color;
  double size;
  String type;
  Door({
    required this.material,
    required this.color,
    required this.size,
    required this.type,
  });
}

// Roof
class Roof {
  String material;
  String color;

  Roof({
    required this.color,
    required this.material,
  });
}

// Chimney
class Chimney {
  String material;
  String color;
  double height;
  Chimney({
    required this.color,
    required this.material,
    required this.height,
  });
}

// Class House
class House {
  String address;
  List<Tree> trees = [];
  List<Door> doors = [];
  List<Window> windows = [];
  List<Roof> roofs = [];
  List<Chimney> chimneys = [];

  House(this.address);

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  void addDoor(Door newDoor) {
    this.doors.add(newDoor);
  }

  void addRoof(Roof newRoof) {
    this.roofs.add(newRoof);
  }

  void addChimney(Chimney newChimney) {
    this.chimneys.add(newChimney);
  }

  void addWindow(Window newWindow) {
    this.windows.add(newWindow);
  }

  @override
  String toString() {
    return '----\nMy house has:\n address: $address \n Roof: ${roofs.length}\n Door: ${doors.length} \n Chimney: ${chimneys.length}, \n Tree: ${trees.length} \n Window: ${windows.length}\n----';
  }
}

void main() {
  // First house
  final House myHouse = House('315st, Phnom Penh');

  myHouse.addChimney(Chimney(color: '#f4f4f4', material: 'Tile', height: 100));
  myHouse.addDoor(
      Door(color: '#303030', material: 'Wood', size: 90, type: 'Sliding Door'));
  myHouse.addWindow(
      Window(material: 'Glass', color: windowColor.blue, size: 110, panel: 4));
  myHouse.roofs.add(Roof(color: '#909090', material: 'Concrete'));
  myHouse.addTree(Tree('Palm', 15.0));
  print(myHouse);

  // Second house
  final House myHouse2 = House('231st, Kampot');

  myHouse2
      .addChimney(Chimney(color: '#121212', material: 'Brick', height: 120));
  myHouse2.addDoor(
      Door(color: '#505050', material: 'Steel', size: 95, type: 'Handle Door'));
  myHouse2.addWindow(Window(
      material: 'Tinted Glass', color: windowColor.blue, size: 150, panel: 3));
  myHouse2.addWindow(Window(
      material: 'Lime Glass', color: windowColor.cyan, size: 140, panel: 1));
  myHouse2.addWindow(Window(
      material: 'Solid Glass', color: windowColor.green, size: 160, panel: 1));
  myHouse2.roofs.add(Roof(color: '#707070', material: 'Clay'));
  myHouse2.addTree(Tree('Oak', 10.0));
  print(myHouse2);

  // Third house
  final House myHouse3 = House('45st, NewYork');

  myHouse3
      .addChimney(Chimney(color: '#929292', material: 'Marble', height: 130));
  myHouse3.addWindow(Window(
      material: 'Fiber Glass', color: windowColor.yellow, size: 170, panel: 2));
  myHouse3.addWindow(Window(
      material: 'Reinforced Glass',
      color: windowColor.yellow,
      size: 190,
      panel: 2));
  myHouse3.addWindow(Window(
      material: 'Stained Glass',
      color: windowColor.yellow,
      size: 140,
      panel: 3));
  myHouse3.addWindow(Window(
      material: 'Solid Glass', color: windowColor.yellow, size: 180, panel: 1));
  myHouse3.roofs.add(Roof(color: '#a0a0a0', material: 'Slate'));
  myHouse3.addTree(Tree('Pine', 18.0));

  // print(windowColor.cyan.stringColor);
  print(myHouse3);
}