import 'package:forecastify/domain/Entities/weather.dart';
import 'package:forecastify/domain/datasources/weather_datasource.dart';

import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_repository_impl.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSourceImpl datasource;

  WeatherRepositoryImpl(this.datasource);
  @override
  Future<Weather> getWeatherInfo(
      {String latitude = "18.5097101", String longitude = "-69.8187789"}) {
    return datasource.getWeatherInfo(latitude: latitude, longitude: longitude);
  }
}
