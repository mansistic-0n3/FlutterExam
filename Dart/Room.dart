class Room {
  late int roomNo;
  late String roomType;
  late double roomArea;
  late bool hasAcMachine;
 
  void setData(int no, String type, double area, bool ac) {
    roomNo = no;
    roomType = type;
    roomArea = area;
    hasAcMachine = ac;
  }
 
  void displayData() {
    print("Room Number: $roomNo");
    print("Room Type: $roomType");
    print("Room Area: $roomArea sq.ft");
    print("AC Machine: $hasAcMachine");
  }
}
 
void main() {
  Room room1 = Room();
  Room room2 = Room();
 
  room1.setData(2089, "Single", 5500.0, false);
  room2.setData(1973, "Double", 3000.0, true);
 
  room1.displayData();
  print("\n");
  room2.displayData();
}
