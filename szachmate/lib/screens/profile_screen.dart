import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userProfile = {
    'name': 'Jan Kowalski',
    'rating': 1620,
    'playedTournaments': [
      'Puchar Mazowsza 2024',
      'Turniej Noworoczny Online',
      'Blitz Express 2025',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil użytkownika")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Imię i nazwisko:",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 4),
            Text(userProfile['name'], style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Ranking szachowy:",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 4),
            Text("${userProfile['rating']} ELO", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Edycja profilu – dodamy później
              },
              child: Text("Edytuj profil"),
            ),
            Divider(height: 32),
            Text("Rozegrane turnieje:",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8),
            ...userProfile['playedTournaments'].map<Widget>((tournament) {
              return ListTile(
                leading: Icon(Icons.flag),
                title: Text(tournament),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
