import 'package:advanced_widgets/screens/main_screen.dart';
import 'package:advanced_widgets/screens/theme_pages/theme_cupertion_screen.dart';
import 'package:flutter/cupertino.dart';
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
          create: (_) => ThemeProviderCupertino(),
        ),
      ],
      child: const MyHomeProvider(),
    );
  }
}

class MyHomeProvider extends StatelessWidget {
  const MyHomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    var themeCupertinoProvider = Provider.of<ThemeProviderCupertino>(context);
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeCupertinoProvider.current,
        home: const Scaffold(
          body: MainScreen()
        ),
      );
  }
}
