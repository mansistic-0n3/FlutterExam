void main() {
  List<int> factors(int n) {
    List<int> factors = [];
    for (int i = 1; i <= n; i++) {
      if (n % i == 0) {
        factors.add(i);
      }
    }
    return factors;
  }
 
  int num = 30;
  print("${factors(num)} is list of factors of $num");
}
