void main() {
  const List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];

  List<int> passedScores = scores.where((score) => score >= 50).toList();
  print(passedScores);
  print('${passedScores.length} students passed');
}
