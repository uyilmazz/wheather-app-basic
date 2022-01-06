import 'package:flutter/material.dart';
import 'package:wheatherapp/view/weather_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(elevation: 1, backgroundColor: Colors.white)),
      title: 'Material App',
      home: const WeatherScreen(),
    );
  }
}
