import 'package:flutter/material.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/my_tournaments_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/rankings_screen.dart';
import 'screens/info_screen.dart';
import 'screens/tournament_detail_screen.dart';

import 'package:provider/provider.dart';
import 'providers/tournament_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TournamentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SzachMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: '/', // Start od głównego ekranu nawigacji
      routes: {
        '/': (context) => MainNavigationScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/my-tournaments': (context) => MyTournamentsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/rankings': (context) => RankingsScreen(),
        '/info': (context) => InfoScreen(),
        '/tournament': (context) => TournamentDetailScreen(),
      },
    );
  }
}
