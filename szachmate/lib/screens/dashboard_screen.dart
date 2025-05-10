import 'package:flutter/material.dart';
import 'dart:convert';
import '../data/mock_data.dart';

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
    final decoded = json.decode(mockTournaments) as List;
    final now = DateTime.now();

    final filtered = decoded.where((t) {
      final parsedDate = DateTime.tryParse(t['date'] ?? '');
      return parsedDate != null && parsedDate.isAfter(now);
    }).toList();

    setState(() {
      _tournaments = filtered;
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
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "📅 Data: ${tournament['date']}\n🌐 Lokalizacja: ${tournament['location']}",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ),
                    ElevatedButton(
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
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}