import 'package:flutter/material.dart';
import '../data/mock_data.dart'; // Import danych

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
    return Scaffold(
      appBar: AppBar(title: Text("Moje turnieje")),
      body: ListView.builder(
        itemCount: mockJoinedTournaments.length,
        itemBuilder: (context, index) {
          final tournament = mockJoinedTournaments[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(tournament['title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tournament['body']),
                  SizedBox(height: 4),
                  Text(
                    "Status: ${tournament['status']}",
                    style: TextStyle(color: getStatusColor(tournament['status'])),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
