void main() {
  int number = 11023;
  String reversedNumber =
      int.parse(number.toString().split('').reversed.join()).toString();
  print("Reverse of $number is $reversedNumber");
}