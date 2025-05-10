import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/tournament_provider.dart';

class TournamentDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? tournament =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (tournament == null) {
      return Scaffold(
        backgroundColor: Color(0xFF302E2B),
        body: Center(
          child: Text(
            "Nie znaleziono danych turnieju.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF302E2B),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
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
                  Text(
                    tournament['title'] ?? "Turniej",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text("🗓️ Data: 2025-06-01", style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 8),
                  Text("🌐 Lokalizacja: Online", style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final provider = Provider.of<TournamentProvider>(context, listen: false);
                      provider.joinTournament(tournament);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dołączono do turnieju!')),
                      );
                    },
                    child: Text("Dołącz do turnieju"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9EEB47),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: Icon(Icons.arrow_back),
                label: Text("Powrót do menu"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9EEB47),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
