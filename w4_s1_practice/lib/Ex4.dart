import 'package:flutter/material.dart';

enum Weather { Sunny, Rainy, Cloudy, Snowy }
enum Temperature { Min, Max }
enum DayOfTheWeek { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

final Map<DayOfTheWeek, String> days = {
  DayOfTheWeek.Sun: 'Sun',
  DayOfTheWeek.Mon: 'Mon',
  DayOfTheWeek.Tue: 'Tue',
  DayOfTheWeek.Wed: 'Wed',
  DayOfTheWeek.Thu: 'Thu',
  DayOfTheWeek.Fri: 'Fri',
  DayOfTheWeek.Sat: 'Sat',
};

final Map<Weather, String> weathers = {
  Weather.Cloudy: 'assets/icons/cloudy.png',
  Weather.Rainy: 'assets/icons/rainny.png',
  Weather.Snowy: 'assets/icons/snowy.png',
  Weather.Sunny: 'assets/icons/sunny.png',
};

class WeatherForecast extends StatelessWidget {
  WeatherForecast({super.key});

  final List<Map<String, dynamic>> forecastData = [
    {'day': DayOfTheWeek.Sun, 'weather': Weather.Sunny, 'minTemp': 3, 'maxTemp': 15},
    {'day': DayOfTheWeek.Mon, 'weather': Weather.Rainy, 'minTemp': 7, 'maxTemp': 12},
    {'day': DayOfTheWeek.Tue, 'weather': Weather.Cloudy, 'minTemp': 7, 'maxTemp': 9},
    {'day': DayOfTheWeek.Wed, 'weather': Weather.Rainy, 'minTemp': -1, 'maxTemp': 8},
    {'day': DayOfTheWeek.Thu, 'weather': Weather.Snowy, 'minTemp': -2, 'maxTemp': 5},
    {'day': DayOfTheWeek.Fri, 'weather': Weather.Sunny, 'minTemp': -4, 'maxTemp': 4},
    {'day': DayOfTheWeek.Sat, 'weather': Weather.Sunny, 'minTemp': -3, 'maxTemp': 3},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: forecastData.map((data) {
              return Container(
                width: 80, // Card width
                height: 150,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      days[data['day']]!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Image.asset(
                      weathers[data['weather']]!,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${data['maxTemp']}° / ${data['minTemp']}°',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
