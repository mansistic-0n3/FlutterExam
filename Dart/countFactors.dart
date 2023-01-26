import 'dart:math';
void main() {
  int countFact(int n) {
    int count = 0;
    for (int i = 1; i <= sqrt(n); i++) {
      if (n % i == 0) {
        count++;
        if (n / i != i) {
          count++;
        }
      }
    }
    return count;
  }
  int num = 10;
  print("$num has ${countFact(num)} factors.");
}
