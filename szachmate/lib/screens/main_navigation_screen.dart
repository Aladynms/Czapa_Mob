import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'my_tournaments_screen.dart';
import 'profile_screen.dart';
import 'rankings_screen.dart';
import 'info_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    MyTournamentsScreen(),
    ProfileScreen(),
    RankingsScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Color(0xFF262522),
  centerTitle: true,
  automaticallyImplyLeading: false,
  title: Image.asset(
    'assets/szachlogo.png',
    height: 128,
  ),
),

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF262522),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Turnieje"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Moje"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "Ranking"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
        ],
      ),
    );
  }
}
