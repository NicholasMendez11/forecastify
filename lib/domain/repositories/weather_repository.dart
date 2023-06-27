import '../Entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherInfo({String latitude, String longitude});
}
