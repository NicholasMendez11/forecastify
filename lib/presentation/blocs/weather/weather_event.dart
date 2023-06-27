part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByLocation extends WeatherEvent {
  final String lat;
  final String long;

  const GetWeatherByLocation(this.lat, this.long);
}

class ClearData extends WeatherEvent {}
