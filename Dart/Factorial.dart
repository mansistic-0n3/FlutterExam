 void main() {
 fact(6);
}
void fact(int n){
  
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
 
  print('Factorial of $n');
  print(result);
}