// Mockowane dane dla DashboardScreen
const String mockTournaments = '''
[
  {
    "id": 1,
    "title": "Turniej Szachowy 1",
    "date": "2025-04-10",
    "location": "Warszawa"
  },
  {
    "id": 2,
    "title": "Turniej Szachowy 2",
    "date": "2025-04-22",
    "location": "Online"
  },
  {
    "id": 3,
    "title": "Turniej Szachowy 3",
    "date": "2025-05-03",
    "location": "Kraków"
  },
  {
    "id": 4,
    "title": "Turniej Szachowy 4",
    "date": "2025-08-15",
    "location": "Online"
  },
  {
    "id": 5,
    "title": "Turniej Szachowy 5",
    "date": "2025-09-05",
    "location": "Gdańsk"
  },
  {
    "id": 6,
    "title": "Turniej Szachowy 6",
    "date": "2025-09-18",
    "location": "Poznań"
  },
  {
    "id": 7,
    "title": "Turniej Szachowy 7",
    "date": "2025-10-11",
    "location": "Online"
  }
]
''';

// Mockowane dane dla RankingsScreen
const List<Map<String, dynamic>> mockPlayers = [
  {'name': 'Anna Nowak', 'rating': 1890, 'tournaments': 12},
  {'name': 'Piotr Zieliński', 'rating': 1740, 'tournaments': 8},
  {'name': 'Kamil Wiśniewski', 'rating': 1630, 'tournaments': 15},
  {'name': 'Ewa Kaczmarek', 'rating': 1920, 'tournaments': 20},
  {'name': 'Jan Kowalski', 'rating': 1620, 'tournaments': 2},
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


// Domyślne zgłoszenie użytkownika
const List<Map<String, dynamic>> mockInitialJoinedTournaments = [
  {
    'id': 1,
    'status': 'zatwierdzony',
  },
  {
    'id': 2,
    'status': 'odrzucony',
  },
  {
    'id': 3,
    'status': 'zatwierdzony',
  },
  {
    'id': 4,
    'status': 'odrzucony',
  },
  {
    'id': 5,
    'status': 'zatwierdzony',
  },
];