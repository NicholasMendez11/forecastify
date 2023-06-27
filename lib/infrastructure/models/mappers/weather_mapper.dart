import 'package:forecastify/infrastructure/models/mappers/weather_response.dart';

import '../../../domain/Entities/weather.dart';

class WeatherMapper {
  static Weather weatherToEntitie(WeatherResponse weatherApi) => Weather(
      coord: weatherApi.coord,
      weather: weatherApi.weather,
      base: weatherApi.base,
      main: weatherApi.main,
      visibility: weatherApi.visibility,
      wind: weatherApi.wind,
      clouds: weatherApi.clouds,
      dt: weatherApi.dt,
      sys: weatherApi.sys,
      timezone: weatherApi.timezone,
      id: weatherApi.id,
      name: weatherApi.name,
      cod: weatherApi.cod);
}
