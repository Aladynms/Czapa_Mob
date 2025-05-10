import 'package:flutter/material.dart';
import '../data/mock_data.dart'; 

class TournamentProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _joinedTournaments = [];

  List<Map<String, dynamic>> get joinedTournaments => _joinedTournaments;

  TournamentProvider() {
    _joinedTournaments.addAll(mockInitialJoinedTournaments);
  }

  void joinTournament(Map<String, dynamic> tournament) {
    final alreadyJoined = _joinedTournaments.any((t) => t['id'] == tournament['id']);
    if (!alreadyJoined) {
      _joinedTournaments.add({
        'id': tournament['id'],
        'status': 'oczekujący',
      });
      notifyListeners();
    }
  }

  void leaveTournament(int id) {
    _joinedTournaments.removeWhere((t) => t['id'] == id);
    notifyListeners();
  }
}
