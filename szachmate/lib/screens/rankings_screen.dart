import 'package:flutter/material.dart';

class RankingsScreen extends StatefulWidget {
  @override
  _RankingsScreenState createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> {
  String selectedFilter = 'wszyscy';

  List<Map<String, dynamic>> allPlayers = [
    {'name': 'Anna Nowak', 'rating': 1890, 'tournaments': 12},
    {'name': 'Piotr Zieliński', 'rating': 1740, 'tournaments': 8},
    {'name': 'Kamil Wiśniewski', 'rating': 1630, 'tournaments': 15},
    {'name': 'Ewa Kaczmarek', 'rating': 1920, 'tournaments': 20},
  ];

  @override
  Widget build(BuildContext context) {
    List sortedPlayers = [...allPlayers];
    sortedPlayers.sort((a, b) => b['rating'].compareTo(a['rating']));

    return Scaffold(
      appBar: AppBar(title: Text("Ranking graczy")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                FilterChip(
                  label: Text("Wszyscy"),
                  selected: selectedFilter == 'wszyscy',
                  onSelected: (_) {
                    setState(() {
                      selectedFilter = 'wszyscy';
                    });
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text("Online"),
                  selected: selectedFilter == 'online',
                  onSelected: (_) {
                    setState(() {
                      selectedFilter = 'online';
                    });
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text("Lokalni"),
                  selected: selectedFilter == 'lokalni',
                  onSelected: (_) {
                    setState(() {
                      selectedFilter = 'lokalni';
                    });
                  },
                ),
              ],
            ),
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
                      trailing: TextButton(
                        onPressed: () {
                          // Można rozbudować o szczegóły gracza
                        },
                        child: Text("Zobacz"),
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
