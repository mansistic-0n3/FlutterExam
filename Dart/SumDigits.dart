 void main() {
 Sum(23);
 Sum(624);
}
void Sum(int num){
  
  int result = 0;
  for (int i = num; i > 0; i = (i / 10).floor()) {
    result += (i % 10);
  }
 
  print('Sum of digits of number $num is\n$result');
}