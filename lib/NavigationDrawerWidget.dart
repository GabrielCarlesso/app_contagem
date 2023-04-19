import 'package:app_fluxo/MyHomePage.dart';
import 'package:app_fluxo/Screens/DiarioPage.dart';
import 'package:app_fluxo/Screens/PageMonthlyGraph.dart';
import 'package:flutter/material.dart';

import 'Screens/GraphPage.dart';
import 'Screens/HomePage.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              const SizedBox(height: 48),
              buildMenuItem(
                  text: 'Home',
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 0)),
              buildMenuItem(
                  text: 'Diário',
                  icon: Icons.view_day,
                  onClicked: () => selectedItem(context, 1)),
              buildMenuItem(
                  text: 'Mensal',
                  icon: Icons.date_range,
                  onClicked: () => selectedItem(context, 2)),
              buildMenuItem(
                  text: 'Outros',
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 3)),
              const SizedBox(
                height: 24,
              ),
              Divider(color: Colors.white70),
              const SizedBox(
                height: 24,
              ),
            ]),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          text,
          style: TextStyle(color: color),
        ),
        onTap: onClicked,
        hoverColor: hoverColor);
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DiarioPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PageMonthlyGraph(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GraphPage(),
        ));
        break;
    }
  }
}
