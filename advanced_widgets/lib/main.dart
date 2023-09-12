import 'package:advanced_widgets/screens/main_screen.dart';
import 'package:advanced_widgets/screens/theme_pages/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (c, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeProvider.current,
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(
            //     seedColor: Colors.deepPurple
            //   ),
            //   useMaterial3: true,
            // ),
            home: const Scaffold(
              body: MainScreen()
            ),
          );
        },
      ),
    );
  }
}

