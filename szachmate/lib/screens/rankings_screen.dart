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
      appBar: AppBar(title: Text("Ranking graczy")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sortedPlayers.length,
                itemBuilder: (context, index) {
                  final player = sortedPlayers[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text("${index + 1}")),
                      title: Text(player['name']),
                      subtitle: Text(
                        "Ranking: ${player['rating']} | Turnieje: ${player['tournaments']}",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
