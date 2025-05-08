import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TournamentDetailScreen extends StatefulWidget {
  @override
  _TournamentDetailScreenState createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  List _players = [];

  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  Future<void> fetchPlayers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        _players = json.decode(response.body).take(5).toList();
      });
    } else {
      throw Exception('Failed to load players');
    }
  }

  @override
  Widget build(BuildContext context) {
    final tournament = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: Text("Szczegóły turnieju")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tournament['title'],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              Text("Opis: ${tournament['body']}"),
              SizedBox(height: 8),
              Text("Data i godzina: 2025-06-01 10:00"),
              Text("Format: System szwajcarski"),
              Text("Maks. graczy: 32"),
              Text("Organizator: SzachMate Club"),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Dołączono do turnieju!'),
                  ));
                },
                child: Text("Dołącz do turnieju"),
              ),
              Divider(height: 32),
              Text(
                "Zapisani gracze:",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ..._players.map((player) => ListTile(
                    title: Text(player['name']),
                    subtitle: Text(player['email']),
                    leading: Icon(Icons.person),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
