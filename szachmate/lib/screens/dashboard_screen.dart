import 'package:flutter/material.dart';
import 'dart:convert';
import '../data/mock_data.dart'; // lokalny JSON string

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
    await Future.delayed(Duration(seconds: 1)); // symulacja API
    setState(() {
      _tournaments = json.decode(mockTournaments); // mock JSON
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF302E2B),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: _tournaments.length,
        itemBuilder: (context, index) {
          final tournament = _tournaments[index];
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "📅 Data: 2025-06-01\n🌐 Lokalizacja: Online",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/tournament',
                        arguments: tournament,
                      );
                    },
                    child: Text("Zobacz"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9EEB47),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
