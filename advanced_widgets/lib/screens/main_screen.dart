import 'package:advanced_widgets/screens/cross_platform_pages/adaptive_screen.dart';
import 'package:advanced_widgets/screens/cross_platform_pages/data_shower_screen.dart';
import 'package:advanced_widgets/screens/cross_platform_pages/webview_shower_screen.dart';
import 'package:advanced_widgets/screens/theme_pages/theme_cupertion_screen.dart';
import 'package:advanced_widgets/screens/weather_pages/weather_screen.dart';
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
              
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const DataShowerScreen()
                  )
                );
              }, 
              child: const Text('Cross Platform')),

              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const WebviewShowerScreen()
                  )
                );
              }, 
              child: const Text('Webview')),

              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const AdaptiveScreen()
                  )
                );
              }, 
              child: const Text('Adaptive App')),
          ],
        ),
      ),
    );
  }
}