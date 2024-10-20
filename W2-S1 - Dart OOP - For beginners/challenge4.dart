class Distance {
  final double _meter;

  Distance(this._meter);
  Distance.centimeter(double cms) : this._meter = cms / 100;
  Distance.kilometer(double kms) : this._meter = kms * 1000;

  double get distanceAsMeters => _meter;
  double get distanceAsCms => _meter * 100;
  double get distanceAsKms => _meter / 1000;

  Distance operator +(Distance d) {
    return Distance(this._meter + d._meter);
  }
}

void main() {
  Distance d1 = new Distance(10); // 10 meters

  Distance d2 = new Distance.centimeter(2000);

  // Distance d3 = new Distance.kilometer(1);

  Distance newDistance = d1 + d2;
  print('D1_Meters: ${d1.distanceAsMeters}m');
  print('D1_Cms: ${d1.distanceAsCms}cm');
  print('D1_Kms: ${d1.distanceAsKms}km\n');

  print('D2_Meters: ${d2.distanceAsMeters}m');
  print('D2_Cms: ${d2.distanceAsCms}cm');
  print('D2_Kms: ${d2.distanceAsKms}km\n');

  // print('D3 m : ${d3.distanceAsMeters}m');
  // print('D3 cm : ${d3.distanceAsCms}cm');
  // print('D3 km : ${d3.distanceAsKms}km');

  print("NewDistanceAsMeters: ${newDistance.distanceAsMeters}m");
  print("NewDistanceAsCms: ${newDistance.distanceAsCms}cm");
  print("NewDistanceAsKms: ${newDistance.distanceAsKms}km");
}