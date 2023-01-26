import 'dart:math';
void main() {
  List<int> primeFactors(int n) {
    List<int> factors = [];
    while (n % 2 == 0) {
      factors.add(2);
      n = n ~/ 2;
    }
    for (int i = 3; i <= sqrt(n); i += 2) {
      while (n % i == 0) {
        factors.add(i);
        n = n ~/ i;
      }
    }
    if (n > 2) {
      factors.add(n);
    }
    return factors;
  }
  int num = 30;
  print("${primeFactors(num)} is list of prime factors of $num");
}