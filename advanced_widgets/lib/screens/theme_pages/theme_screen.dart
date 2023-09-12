import 'package:advanced_widgets/themes/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
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
    return Consumer<ThemeProvider>(
      builder: (context, val, _) => Scaffold(
        appBar: AppBar(
          title: Text('Theme app'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Shakenti Balakenti'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Theme changer'),
                      ),
                      body: Column(
                        children: [
    
                          // Theme changer test button widget
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (val.brightness == CustomBrightness.dark) {
                                  val.toggle(CustomBrightness.light);
                                } else {
                                  val.toggle(CustomBrightness.dark);
                                }
                                // toggle(); // Change app theme color!
                              },
                              child: Icon(Icons.language),
                            ),
                          ),
                        ],
                      ),
                    );
                  }));
                },
                title: const Text('Item 1'),
              ),
              ListTile(
                title: const Text('Item 2'),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Список погод'),
              // Row(
              //   children: [
              //     TextField(),
              //     ElevatedButton(onPressed: () {}, child: Text('asdf')),
              //   ],
              // ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ), 
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Card(
                      elevation: 5,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('${weatherState[index]}'),
                            )
                          ),
                          Divider(),
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
            ],
          ),
        ),
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