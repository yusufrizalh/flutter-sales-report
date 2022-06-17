// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_sales_report/screens/home_page.dart';
import 'package:flutter_sales_report/screens/products/products_page.dart';
import 'package:flutter_sales_report/screens/reports/report_front_page.dart';

class DashboardPage extends StatefulWidget {
  final drawerItem = [
    DrawerItem("Home Page", Icons.home_rounded),
    DrawerItem("Products Page", Icons.camera_alt_rounded),
    DrawerItem("Sales Reports", Icons.book_rounded),
  ];

  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedItem = 0;
  String avatarUrl = "https://i.ibb.co/wWkHtTL/flutter-logo-round.png";

  getDrawerItem(int position) {
    switch (position) {
      case 0:
        return HomePage();
      case 1:
        return ProductsPage();
      case 2:
        return ReportFrontPage();
      default:
        return Text("No Page is Found!");
    }
  }

  onSelectedItem(int index) {
    setState(() {
      selectedItem = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var menu = 0; menu < widget.drawerItem.length; menu++) {
      var drawer = widget.drawerItem[menu];
      drawerOptions.add(ListTile(
        leading: Icon(drawer.icon),
        title: Text(drawer.title),
        selected: menu == selectedItem,
        onTap: () => onSelectedItem(menu),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drawerItem[selectedItem].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                onTap: () => print("Open social media"),
              ),
              accountName: Text("Yusuf Rizal H."),
              accountEmail: Text("rizal@inixindo.co.id"),
            ),
            Column(
              children: drawerOptions,
            ),
          ],
        ),
      ),
      body: getDrawerItem(selectedItem),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
