import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kashku/ui/base/home/home.dart';
import 'package:kashku/ui/base/transaksi/transaksi.dart';
import 'package:kashku/ui/nothing/nothing.dart';
import 'package:kashku/utils/color.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TransaksiPage(),
    NothingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: WHITE,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBold.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: RotatedBox(quarterTurns: 1, child: Icon(IconlyLight.swap)),
            activeIcon:
                RotatedBox(quarterTurns: 1, child: Icon(IconlyBold.swap)),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.chart),
            activeIcon: Icon(IconlyBold.chart),
            label: 'Statistik',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: PRIMARY,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onItemTapped,
        elevation: 1,
      ),
    );
  }
}
