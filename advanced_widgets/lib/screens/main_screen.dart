import 'package:advanced_widgets/screens/theme_cupertion_screen.dart';
import 'package:advanced_widgets/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const WeatherScreen()
                  )
                );
              }, 
              child: const Text('Weather Screen')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const ThemeCupertinoScreen()/*ThemeScreen()*/
                  )
                );
              }, 
              child: const Text('Application Theme')),
          ],
        ),
      ),
    );
  }
}