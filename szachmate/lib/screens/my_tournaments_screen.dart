import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tournament_provider.dart';
import '../data/mock_data.dart';
import 'dart:convert';

class MyTournamentsScreen extends StatelessWidget {
  Color getStatusColor(String status) {
    switch (status) {
      case 'zatwierdzony':
        return Colors.green;
      case 'oczekujący':
        return Colors.orange;
      case 'odrzucony':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final joined = Provider.of<TournamentProvider>(context).joinedTournaments;
    final allTournaments = json.decode(mockTournaments);

    final List<Map<String, dynamic>> joinedDetailed = [];

    for (final j in joined) {
      final int joinedId = j['id'] is int ? j['id'] : int.tryParse(j['id'].toString()) ?? -1;

      final match = (allTournaments as List)
          .cast<Map<String, dynamic>>()
          .firstWhere(
            (t) => t['id'] == joinedId,
            orElse: () => {},
          );

      if (match.isNotEmpty) {
        joinedDetailed.add({
          ...match,
          'status': j['status'],
        });
      }
    }

    final now = DateTime.now();
    final filteredTournaments = joinedDetailed.where((t) {
      final parsedDate = DateTime.tryParse(t['date'] ?? '');
      return parsedDate != null && parsedDate.isAfter(now);
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFF302E2B),
      body: filteredTournaments.isEmpty
          ? Center(
              child: Text("Nie zapisano się jeszcze na żaden nadchodzący turniej.",
                  style: TextStyle(color: Colors.white70)),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: filteredTournaments.length,
              itemBuilder: (context, index) {
                final tournament = filteredTournaments[index];
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tournament['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "📅 Data: ${tournament['date']}\n🌐 Lokalizacja: ${tournament['location']}",
                              style: TextStyle(color: Colors.white70, fontSize: 13),
                            ),
                          ),

                          if (tournament['status'] == 'oczekujący')
                            ElevatedButton(
                              onPressed: () {
                                Provider.of<TournamentProvider>(context, listen: false)
                                    .leaveTournament(tournament['id']);
                              },
                              child: Text("Zrezygnuj"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                textStyle: TextStyle(fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                        ],
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Status: ${tournament['status']}",
                        style: TextStyle(
                          color: getStatusColor(tournament['status']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
