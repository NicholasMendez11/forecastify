import 'package:forecastify/domain/Entities/weather.dart';
import 'package:dio/dio.dart';
import 'package:forecastify/infrastructure/models/mappers/weather_mapper.dart';
import '../../domain/repositories/weather_repository.dart';
import '../models/mappers/weather_response.dart';

class WeatherDataSourceImpl extends WeatherRepository {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      queryParameters: {
        'appid': '43bc10e06b9336dc2bdc240192ec71ba',
      }));

  @override
  Future<Weather> getWeatherInfo(
      {String latitude = "18.5097101",
      String longitude = "-69.8187789"}) async {
    final response = await dio.get('/weather?lat=18.5097101&lon=-69.8187789');
    final weatherResponse = WeatherResponse.fromJson(response.data);
    final Weather weatherInfo = WeatherMapper.weatherToEntitie(weatherResponse);
    print(weatherInfo);
    return weatherInfo;
  }
}
