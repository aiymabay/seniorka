class MockPlace {
  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;

  MockPlace({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });
}

// Nazarbayev University coordinates: 51.0908° N, 71.4186° E
final List<MockPlace> mockPlaces = [
  MockPlace(
    id: '1',
    name: 'Library',
    description: 'Main university library with study spaces and resources.',
    latitude: 51.0915,
    longitude: 71.4190,
  ),
  MockPlace(
    id: '2',
    name: 'C1 Building',
    description: 'Academic building C1 with classrooms and offices.',
    latitude: 51.0905,
    longitude: 71.4180,
  ),
  MockPlace(
    id: '3',
    name: 'C2 Building',
    description: 'Academic building C2 with laboratories and lecture halls.',
    latitude: 51.0900,
    longitude: 71.4175,
  ),
  MockPlace(
    id: '4',
    name: 'Cafeteria',
    description: 'Main dining hall serving meals and snacks.',
    latitude: 51.0910,
    longitude: 71.4185,
  ),
  MockPlace(
    id: '5',
    name: 'Dormitory',
    description: 'Student residence halls and accommodation.',
    latitude: 51.0920,
    longitude: 71.4200,
  ),
];

