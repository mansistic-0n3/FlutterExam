import 'dart:math';
 
void main() {
  bool isPrime(int n) {
    if (n <= 1) {
      return false;
    }
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }
  int num = 13;
  print(isPrime(num) ? "$num is PRIME" : "$num is NOT PRIME");
}
 void Prime(int num){

 }