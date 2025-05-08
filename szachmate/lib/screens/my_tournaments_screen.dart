import 'package:flutter/material.dart';

class MyTournamentsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> joinedTournaments = [
    {
      'id': 1,
      'title': 'Szachowy Puchar Krakowa',
      'status': 'zatwierdzony',
      'body': 'Turniej klasyczny w centrum Krakowa',
    },
    {
      'id': 2,
      'title': 'Online Blitz Cup',
      'status': 'oczekujący',
      'body': 'Błyskawiczny turniej online',
    },
    {
      'id': 3,
      'title': 'Szachowe starcie juniorów',
      'status': 'odrzucony',
      'body': 'Turniej lokalny dla młodzieży',
    },
  ];

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
        itemCount: joinedTournaments.length,
        itemBuilder: (context, index) {
          final tournament = joinedTournaments[index];
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
              trailing: ElevatedButton(
                child: Text("Szczegóły"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tournament',
                    arguments: tournament,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
