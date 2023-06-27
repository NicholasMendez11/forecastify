import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecastify/config/router/router.dart';
import 'package:forecastify/config/theme/app_theme.dart';
import 'package:forecastify/presentation/blocs/weather/weather_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => WeatherBloc(),
    )
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(true, 1),
      debugShowCheckedModeBanner: false,
    );
  }
}
