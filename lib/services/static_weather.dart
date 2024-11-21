import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/current_weather.dart';

const weatherApiKey = 'd5909229756a0a3e8129eeac7a73dd21';
const currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';

Future<CurrentWeather> fetchWeather(String city) async {
  final url = Uri.parse('$currentWeatherEndpoint?q=$city&appid=$weatherApiKey&units=metric');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final weatherData = jsonDecode(response.body);
    return CurrentWeather(
      city: weatherData['name'],
      description: weatherData['weather'][0]['description'],
      currentTemp: weatherData['main']['temp'],
      currentTime: DateTime.now(),
      sunrise: DateTime.fromMillisecondsSinceEpoch(weatherData['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(weatherData['sys']['sunset'] * 1000),
    );
  } else {
    throw Exception('Failed to load weather data');
  }
}


final _weatherData = {
  'coord': {'lon': -113.4687, 'lat': 53.5501},
  'weather': [
    {'id': 801, 'main': 'Clouds', 'description': 'partly cloudy', 'icon': '02d'}
  ],
  'base': 'stations',
  'main': {
    'temp': 23.55,
    'feels_like': 28.57,
    'temp_min': 27.65,
    'temp_max': 31.12,
    'pressure': 1004,
    'humidity': 32,
    'sea_level': 1004,
    'grnd_level': 928
  },
  'visibility': 10000,
  'wind': {'speed': 3.6, 'deg': 180},
  'clouds': {'all': 12},
  'dt': 1722535200, // Aug 1, 2024 12:00 PM
  'sys': {
    'type': 2,
    'id': 2074442,
    'country': 'CA',
    'sunrise': 1722513600, // Aug 1, 2024 6:00 AM
    'sunset': 1722569400, // Aug 1, 2024 9:30 PM
  },
  'timezone': -21600,
  'id': 5946768,
  'name': 'Edmonton',
  'cod': 200
};

/// Returns a static weather data object for [city] in OpenWeatherMap format.
/// If no city is provided, then the default city is 'Edmonton'.
Map<String, dynamic> getStaticWeatherForCity({String city = 'Edmonton'}) {
  _weatherData['name'] = city;
  return _weatherData;
}
