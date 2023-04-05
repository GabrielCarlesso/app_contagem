import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text("Home", style: TextStyle(fontSize: 30)));
  }
}
