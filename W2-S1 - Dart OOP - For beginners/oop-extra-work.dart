// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
}

enum windowColor { red, green, blue, yellow, black, cyan , white, grey }

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
      case windowColor.black:
        return 'Black';
      case windowColor.cyan:
        return 'Cyan';
      case windowColor.white:
        return 'White';
      case windowColor.grey:
        return 'Grey';
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

// Floor
class Floor {
  String material;
  String floor;
  double area;
  Floor({required this.material, required this.area, required this.floor});
}

// Class House
class House {
  String address;
  List<Tree> trees = [];
  List<Door> doors = [];
  List<Window> windows = [];
  List<Roof> roofs = [];
  List<Chimney> chimneys = [];
  List<Floor> floor = [];

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

  void addFloor(Floor newFloor) {
    this.floor.add(newFloor);
  }

  @override
  String toString() {
    return '----\nMy house has:\n address: $address \n Roof: ${roofs.length}\n Door: ${doors.length} \n Chimney: ${chimneys.length}, \n Tree: ${trees.length} \n Window: ${windows.length}\n Floor: ${floor.length} \n ----';
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
  myHouse.addRoof(Roof(color: 'White', material: 'Concrete'));
  myHouse.addTree(Tree('Palm', 15.0));
  myHouse.addFloor(Floor(material: 'Glass', area: 24.0, floor: 'Ground Floor'));
  myHouse.addFloor(Floor(material: 'Wood', area: 24.0, floor: 'First Floor'));
  print(myHouse);

  // Second house
  final House myHouse2 = House('Plov Krus red, Kampot');
  
  myHouse2.addChimney(Chimney(color: 'gray', material: 'Tile', height: 120));
  myHouse2.addDoor(Door(material: 'Wood', color: 'Black', size: 80, type: 'Sliding Door'));
  myHouse2.addWindow(Window(material: 'Glass', color: windowColor.red, size: 60, panel: 4));
  myHouse2.addWindow(Window(material: 'Glass', color: windowColor.black, size: 60, panel: 4));
  myHouse2.addWindow(Window(material: 'Glass', color: windowColor.green, size: 60, panel: 4));
  myHouse2.addWindow(Window(material: 'Glass', color: windowColor.grey, size: 60, panel: 4));
  myHouse2.addRoof(Roof(color: 'Gray', material: 'Concrete'));
  myHouse2.addTree(Tree('Coconut', 12.0));
  myHouse2.addTree(Tree('Mango', 6.0));
  myHouse2.addTree(Tree('Banana', 4.0));
  myHouse2.addFloor(Floor(material: 'Glass', area: 24.0, floor: 'Ground Floor'));
  myHouse2.addFloor(Floor(material: 'Wood', area: 24.0, floor: 'First Floor'));
  print(myHouse2);
}
