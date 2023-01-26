void main(){
  Pelindrome(121);
  Pelindrome(113);
}

void Pelindrome(int n){
  int reminder, sum =0, temp;
  temp = n;
  while(n>0)
  {
    reminder = n % 10; 
    sum = (sum*10)+reminder;
    n = n~/10;
  }
  if(sum == temp)
  {
    print('$n is a Palindrome number');

  }else{
    print('$n is not a Palindrome number');
  }
}