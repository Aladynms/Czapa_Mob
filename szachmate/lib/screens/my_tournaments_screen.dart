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
      backgroundColor: Color(0xFF302E2B),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: mockJoinedTournaments.length,
        itemBuilder: (context, index) {
          final tournament = mockJoinedTournaments[index];
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
                SizedBox(height: 6),
                Text(
                  tournament['body'],
                  style: TextStyle(color: Colors.white70),
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
