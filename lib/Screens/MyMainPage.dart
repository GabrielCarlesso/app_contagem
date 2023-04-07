import 'package:app_contagem/AppController.dart';
import 'package:app_contagem/Screens/DiarioPage.dart';
import 'package:app_contagem/Screens/HomePage.dart';
import 'package:flutter/material.dart';

import 'PageMonthlyGraph.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key, required this.title});

  final String title;

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int _selectIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [CustomSwitch()],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
          children: [
            HomePage(),
            PageMonthlyGraph(),
            DiarioPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Mensal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Diário',
            ),
          ],
          currentIndex: _selectIndex,
          selectedItemColor: Color.fromARGB(255, 8, 48, 81),
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
        ));
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
