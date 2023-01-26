void main() {
  binaryEq(18);
  binaryEq(5);
}
void binaryEq(int num){
  final binaryNumber = num.toRadixString(2);
  print("Binary equivalent of $num is $binaryNumber");
}