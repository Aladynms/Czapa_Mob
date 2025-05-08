import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List _tournaments = [];

  @override
  void initState() {
    super.initState();
    fetchTournaments();
  }

  Future<void> fetchTournaments() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        _tournaments = json.decode(response.body).take(10).toList();
      });
    } else {
      throw Exception('Failed to load tournaments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SzachMate – Turnieje")),
      body: ListView.builder(
        itemCount: _tournaments.length,
        itemBuilder: (context, index) {
          final tournament = _tournaments[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(tournament['title']),
              subtitle: Text("Data: 2025-06-01\nLokalizacja: Online"),
              trailing: ElevatedButton(
                child: Text("Zobacz"),
                onPressed: () {
                  Navigator.pushNamed(context, '/tournament', arguments: tournament);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
