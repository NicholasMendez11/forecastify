part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherReady extends WeatherState {
  final Weather weatherInfo;

  const WeatherReady(this.weatherInfo);

  @override
  List<Object> get props => [weatherInfo];
}
