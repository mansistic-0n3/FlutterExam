void main() {
  String convertToWords(int n) {
    List<String> belowTwenty = [
      '',
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen'
    ];
    List<String> belowHundred = [
      '',
      'Ten',
      'Twenty',
      'Thirty',
      'Forty',
      'Fifty',
      'Sixty',
      'Seventy',
      'Eighty',
      'Ninety'
    ];
    if (n < 20) {
      return belowTwenty[n];
    } else if (n < 100) {
      return belowHundred[n ~/ 10] +
          (n % 10 != 0 ? ' ' + belowTwenty[n % 10] : '');
    } else if (n < 1000) {
      return belowTwenty[n ~/ 100] + ' Hundred ' + convertToWords(n % 100);
    }
    return '';
  }
  int n = 261;
  print(convertToWords(n));
}
