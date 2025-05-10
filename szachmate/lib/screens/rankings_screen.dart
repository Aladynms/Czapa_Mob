import 'package:flutter/material.dart';
import '../data/mock_data.dart'; // Import danych

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({super.key});

  @override
  _RankingsScreenState createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> {
  @override
  Widget build(BuildContext context) {
    List sortedPlayers = [...mockPlayers];
    sortedPlayers.sort((a, b) => b['rating'].compareTo(a['rating']));

    return Scaffold(
      backgroundColor: Color(0xFF302E2B),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sortedPlayers.length,
          itemBuilder: (context, index) {
            final player = sortedPlayers[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
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
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF9EEB47),
                  foregroundColor: Colors.black,
                  child: Text("${index + 1}"),
                ),
                title: Text(
                  player['name'],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Ranking: ${player['rating']} | Turnieje: ${player['tournaments']}",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
