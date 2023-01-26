void main() {
  void fib(int n, int a, int b) {
    if (n == 0) {
      return;
    }
    print(a);
    fib(n - 1, b, a + b);
  }
  fib(10, 0, 1);
}