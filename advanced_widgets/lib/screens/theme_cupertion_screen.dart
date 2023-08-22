import 'package:advanced_widgets/themes/cupertino_theme.dart';
import 'package:advanced_widgets/themes/material_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeCupertinoScreen extends StatefulWidget {
  const ThemeCupertinoScreen({super.key});

  @override
  State<ThemeCupertinoScreen> createState() => _ThemeCupertinoScreenState();
}

class _ThemeCupertinoScreenState extends State<ThemeCupertinoScreen> {
  List<String> weatherState = [
    'assets/images/sun.png',
    'assets/images/cloudy_2.png',
    'assets/images/cloudy.png',
    'assets/images/heavy-rain.png',
    'assets/images/sun.png',
    'assets/images/cloudy_2.png',
    'assets/images/cloudy.png',
    'assets/images/heavy-rain.png',
    'assets/images/sun.png',
    'assets/images/cloudy_2.png',
    'assets/images/cloudy.png',
    'assets/images/heavy-rain.png',
    'assets/images/sun.png',
    'assets/images/cloudy_2.png',
    'assets/images/cloudy.png',
    'assets/images/heavy-rain.png',
    'assets/images/sun.png',
    'assets/images/cloudy_2.png',
    'assets/images/cloudy.png',
    'assets/images/heavy-rain.png',
  ];

  @override
  Widget build(BuildContext context) {
    var themeCupertinoProvider = Provider.of<ThemeProviderCupertino>(context);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Cupertino'),
              CupertinoButton(
                child: const Text("Button"), 
                onPressed: () {
                  // themeCupertinoProvider.toggle(CustomBrightness.dark);
                  if (themeCupertinoProvider.brightness == CustomBrightness.dark) {
                    themeCupertinoProvider.toggle(CustomBrightness.light);
                  } else {
                    themeCupertinoProvider.toggle(CustomBrightness.dark);
                  }
                }
              ),
              const Text('Список погод'),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ), 
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Card(
                      elevation: 5,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(weatherState[index]),
                            )
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${index + 1}'),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
        
              // Body of Page
        
            ],
          ),
        )
      ),
    );
  }
}

enum CustomBrightness { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = themeLight;
  CustomBrightness _brightness = CustomBrightness.light;

  ThemeData get current => _currentTheme;
  CustomBrightness get brightness => _brightness;

  toggle(CustomBrightness brightness) {
    if (brightness == CustomBrightness.dark) {
      _brightness = CustomBrightness.dark;
      _currentTheme = themeDark;
    } else {
      _brightness = CustomBrightness.light;
      _currentTheme = themeLight;
    }
    notifyListeners();
  }
}

class ThemeProviderCupertino extends ChangeNotifier {
  CupertinoThemeData _current = cupertinoLightTheme;
  CustomBrightness _brightness = CustomBrightness.light;

  CupertinoThemeData get current => _current;
  CustomBrightness get brightness => _brightness;

  toggle(CustomBrightness brightness) {
    if (brightness == CustomBrightness.dark) {
      _brightness = CustomBrightness.dark;
      _current = cupertinoDarkTheme;
    } else {
      _brightness = CustomBrightness.light;
      _current = cupertinoLightTheme;
    }
    notifyListeners();
  }
}