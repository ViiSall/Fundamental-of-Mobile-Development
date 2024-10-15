enum Token {
  braces(start: "[", end: "]"),
  curlyBraces(start: "{", end: "}"),
  parenthesis(start: "(", end: ")");

  const Token({required this.start, required this.end});

  final String start;
  final String end;

  static bool isStartToken(String char) {
    return values.any((token) => token.start == char);
  }

  static bool isEndToken(String char) {
    return values.any((token) => token.end == char);
  }

  static String getStartFor(String char) {
    return values.firstWhere((token) => token.end == char).start;
  }
}

bool parseTokens(String text) {
  List<String> stack = [];
  for (String char in text.split("")) {
    if (Token.isStartToken(char)) {
      stack.add(char);
    } else if (Token.isEndToken(char)) {
      String expectedStartToken = Token.getStartFor(char);  					// Expected start token...
      if (!stack.isEmpty && stack[stack.length - 1] == expectedStartToken) {    // Check the expected start token is in the stack
        stack.removeLast();   													// If yes, remove it form the stack
      } else {
        return false;
      }
    }
  }
  return true;
}

void main() {
  String text = "[{(text))}]";
  bool isBalanced = parseTokens(text);
  print(isBalanced? "Balanced":"Not Balanced");
}
