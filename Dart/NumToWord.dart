void main() {
  Map<int, String> digit = {
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine",
  };
  int num = 2601;
  List<String> numSplit = "$num".split("");
  String word = numSplit.map((e) => digit[int.parse(e)]).toList().join(" ");
  print(word);
}
