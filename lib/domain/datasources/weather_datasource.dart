import 'package:forecastify/domain/Entities/weather.dart';

abstract class WeatherDataSource {
  Future<Weather> getWeatherInfo({latitude, longitude});
}
