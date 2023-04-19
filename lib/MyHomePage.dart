import 'package:app_fluxo/main.dart';
import 'package:flutter/material.dart';
import 'NavigationDrawerWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Fluxo - Ru 2')),
        body: const Center(
          child: Text('My Page!'),
        ),
        drawer: NavigationDrawerWidget());
  }
}
