import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tournament_provider.dart';
import '../data/mock_data.dart';
import 'dart:convert';

class ProfileScreen extends StatelessWidget {
  Widget profileCard(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF262522),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white70, fontSize: 14)),
          SizedBox(height: 6),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final joined = Provider.of<TournamentProvider>(context).joinedTournaments;
    final allTournaments = (json.decode(mockTournaments) as List).cast<Map<String, dynamic>>();
    final now = DateTime.now();

    final playedTournaments = joined.where((j) {
      if (j['status'] != 'zatwierdzony') return false;
      final match = allTournaments.firstWhere(
        (t) => t['id'].toString() == j['id'].toString(),
        orElse: () => {},
      );
      if (match.isEmpty) return false;
      final parsedDate = DateTime.tryParse(match['date'] ?? '');
      return parsedDate != null && parsedDate.isBefore(now);
    }).map((j) {
      final match = allTournaments.firstWhere((t) => t['id'].toString() == j['id'].toString());
      return match['title'];
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFF302E2B),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileCard("Imię i nazwisko", mockUserProfile['name']),
            profileCard("Ranking szachowy", "${mockUserProfile['rating']} ELO"),
            SizedBox(height: 16),
            Text(
              "Rozegrane turnieje:",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 8),
            if (playedTournaments.isEmpty)
              Text("Brak zakończonych turniejów.",
                  style: TextStyle(color: Colors.white54))
            else
              ...playedTournaments.map<Widget>((tournament) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFF262522),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.flag, color: Colors.white),
                    title: Text(
                      tournament,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}
