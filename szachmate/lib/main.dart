import 'package:flutter/material.dart';
import 'screens/tournament_detail_screen.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  runApp(SzachMateApp());
}

class SzachMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SzachMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainNavigationScreen(),
        '/tournament': (context) => TournamentDetailScreen(),
      },
    );
  }
}
