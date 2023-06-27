import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecastify/infrastructure/datasources/weather_repository_impl.dart';

import '../../../domain/Entities/weather.dart';
import '../../../infrastructure/repositories/weather_repository_impl.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositoryImpl _weatherRepository =
      WeatherRepositoryImpl(WeatherDataSourceImpl());
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherByLocation>(_onGetWeatherByLocation);
    on<ClearData>(_onClearData);
  }

  void _onGetWeatherByLocation(GetWeatherByLocation event, Emitter emit) async {
    try {
      emit(WeatherLoading()); // Emit the loading state
      final Weather weatherInfo = await _weatherRepository.getWeatherInfo();
      emit(WeatherReady(weatherInfo)); // Emit the loaded state with the movie
    } catch (e) {
      print("Error: $e");
    }
  }

  void _onClearData(ClearData event, Emitter emit) {
    emit(WeatherInitial());
  }
}
