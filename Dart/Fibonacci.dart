void main() {
  Fib(10);
}
void Fib(int n) {
    int a = 0, b = 1, c;
    print(a);
    print(b);
    for (int i = 2; i < n; i++) {
      c = a + b;
      print(c);
      a = b;
      b = c;
    }
  }