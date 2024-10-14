class CheckCol {
  String isBaland(String S) {
    final Map<String, String> Check = {'[': ']', '(': ')', '{': '}'};
    List<String> Store = [];

    for (int i = 0; i < S.length; i++) {
      String Char = S[i];

      if (Check.containsKey(Char)) {
        Store.add(Char);
      } else if (Check.containsValue(Char)) {
        if (Store.isEmpty || Check[Store.removeLast()] != Char) {
          return "not baland";
        }
      }
    }

    return Store.isEmpty ? "is Baland" : "is not Baland";
  }
}

void main() {
  var hi = CheckCol();
  var name = hi.isBaland("[{(visal})]");
  print(name); // not baland
}
