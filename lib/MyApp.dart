import 'package:app_contagem/AppController.dart';
import 'package:flutter/material.dart';
import 'Screens/MyMainPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
            title: 'Fluxu RU 2',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            home: const MyMainPage(title: 'Fluxo RU 2'));
      },
    );
  }
}
