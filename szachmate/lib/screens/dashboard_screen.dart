import 'package:flutter/material.dart';
import 'dart:convert';
import '../data/mock_data.dart'; // Import danych

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List _tournaments = [];

  @override
  void initState() {
    super.initState();
    fetchTournaments();
  }

  Future<void> fetchTournaments() async {
    await Future.delayed(Duration(seconds: 1)); // Symulacja opóźnienia
    setState(() {
      _tournaments = json.decode(mockTournaments); // Użycie danych z pliku
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SzachMate – Turnieje")),
      body: ListView.builder(
        itemCount: _tournaments.length,
        itemBuilder: (context, index) {
          final tournament = _tournaments[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(tournament['title']),
              subtitle: Text("Data: 2025-06-01\nLokalizacja: Online"),
              trailing: ElevatedButton(
                child: Text("Zobacz"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tournament',
                    arguments: tournament, // Przekazanie danych turnieju
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
