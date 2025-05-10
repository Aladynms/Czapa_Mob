import 'package:flutter/material.dart';
import '../data/mock_data.dart'; // Import danych

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil użytkownika")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Imię i nazwisko:", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 4),
            Text(mockUserProfile['name'], style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Ranking szachowy:", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 4),
            Text("${mockUserProfile['rating']} ELO", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Rozegrane turnieje:", style: Theme.of(context).textTheme.titleMedium),
            ...mockUserProfile['playedTournaments'].map<Widget>((tournament) {
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
