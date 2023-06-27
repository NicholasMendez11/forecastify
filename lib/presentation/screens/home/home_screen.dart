import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecastify/presentation/blocs/weather/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(ClearData());
                },
                icon: const Icon(Icons.refresh_outlined))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlueAccent,
                const Color.fromARGB(255, 151, 215, 245)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return SizedBox(
                  width: size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('No Data'),
                        ElevatedButton(
                            onPressed: () {
                              context.read<WeatherBloc>().add(
                                  const GetWeatherByLocation(
                                      "18.5097101", "-69.8187789"));
                            },
                            child: const Text('Get Data for Santo Domingo'))
                      ]),
                );
              } else if (state is WeatherReady) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.weatherInfo.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '${state.weatherInfo.weather[0].description}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '${state.weatherInfo.main.temp.toStringAsFixed(1)}°C',
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Humidity: ${state.weatherInfo.main.humidity}%',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Wind Speed: ${state.weatherInfo.wind.speed} km/h',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Text('No hay data');
              }
            },
          ),
        ));
  }
}
