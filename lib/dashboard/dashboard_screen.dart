import 'package:flutter/material.dart';
import 'package:general_mobile_drive/dashboard/rental%20screen.dart';

import '../extra/ccolors.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const RentalsDetailScreen(),
    const HomeScreen(),
    const HomeScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final PageStorageBucket myBucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: CColors.blueColor,
        unselectedItemColor: CColors.textColor,
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.car_crash,
                color: CColors.blueColor,
              ),
              label: "Voltures"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.mail), label: "Dememdes"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.key), label: "Locations"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Performance"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Compte"),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
