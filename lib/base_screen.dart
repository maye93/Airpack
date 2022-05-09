import 'package:flutter/material.dart';
import 'package:practice/dashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice/transfer.dart';
import 'package:practice/error.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    ErrorScreen(),
    TransferMoneyScreen(),
    ErrorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF0d213a),
            selectedIconTheme: IconThemeData(color: const Color(0xFFf1c550)),
            selectedItemColor: const Color(0xFFf1c550),
            unselectedIconTheme: IconThemeData(color: Colors.white),
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.piggyBank), label: "Deposit"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.handHoldingUsd),
                  label: "Transfer"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.moneyBillWave),
                  label: "Withdraw"),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            }));
  }
}
