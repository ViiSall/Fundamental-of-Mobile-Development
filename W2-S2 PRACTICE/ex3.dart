class MyDuration {
  final int _milliseconds;

  // Private constructor
  MyDuration._(this._milliseconds);

  // Factory constructors
  factory MyDuration.fromHours(int hours) {
    return MyDuration._(hours * 60 * 60 * 1000);
  }

  factory MyDuration.fromMinutes(int minutes) {
    return MyDuration._(minutes * 60 * 1000);
  }

  factory MyDuration.fromSeconds(int seconds) {
    return MyDuration._(seconds * 1000);
  }

  // Operator overloading
  MyDuration operator +(MyDuration other) {
    return MyDuration._(this._milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int result = this._milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception('Duration cannot be negative!!!');
    }
    return MyDuration._(result);
  }

  bool operator >(MyDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  bool operator <(MyDuration other) {
    return this._milliseconds < other._milliseconds;
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(1);
  MyDuration duration2 = MyDuration.fromMinutes(50);

  print(duration1 + duration2); // 1 hour, 45 minutes, 0 second
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); // Duration cannot be negative
  }
}
