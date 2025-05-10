import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TournamentDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pobranie argumentów
    final Map<String, dynamic>? tournament =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Sprawdzenie, czy argumenty nie są null
    if (tournament == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Szczegóły turnieju")),
        body: Center(child: Text("Nie znaleziono danych turnieju.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(tournament['title'] ?? "Turniej")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tytuł: ${tournament['title']}",
              style: Theme.of(context).textTheme.headlineSmall, // Zmieniono z headline6
            ),
            SizedBox(height: 8),
            Text("Data: 2025-06-01"),
            SizedBox(height: 8),
            Text("Lokalizacja: Online"),
          ],
        ),
      ),
    );
  }
}
