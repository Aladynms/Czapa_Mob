// Mockowane dane dla DashboardScreen
const String mockTournaments = '''
[
  {"id": 1, "title": "Turniej Szachowy 1"},
  {"id": 2, "title": "Turniej Szachowy 2"},
  {"id": 3, "title": "Turniej Szachowy 3"},
  {"id": 4, "title": "Turniej Szachowy 4"},
  {"id": 5, "title": "Turniej Szachowy 5"}
]
''';

// Mockowane dane dla RankingsScreen
const List<Map<String, dynamic>> mockPlayers = [
  {'name': 'Anna Nowak', 'rating': 1890, 'tournaments': 12},
  {'name': 'Piotr Zieliński', 'rating': 1740, 'tournaments': 8},
  {'name': 'Kamil Wiśniewski', 'rating': 1630, 'tournaments': 15},
  {'name': 'Ewa Kaczmarek', 'rating': 1920, 'tournaments': 20},
];

// Mockowane dane dla MyTournamentsScreen
const List<Map<String, dynamic>> mockJoinedTournaments = [
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

// Mockowane dane dla ProfileScreen
const Map<String, dynamic> mockUserProfile = {
  'name': 'Jan Kowalski',
  'rating': 1620,
  'playedTournaments': [
    'Puchar Mazowsza 2024',
    'Turniej Noworoczny Online',
    'Blitz Express 2025',
  ],
};