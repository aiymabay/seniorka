class MockEvent {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final double latitude;
  final double longitude;

  MockEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.latitude,
    required this.longitude,
  });
}

final List<MockEvent> mockEvents = [
  MockEvent(
    id: '1',
    title: 'Welcome Week 2024',
    description: 'Join us for the annual welcome week with activities, food, and fun!',
    date: DateTime(2024, 9, 15, 10, 0),
    location: 'Main Campus Square',
    latitude: 51.0908,
    longitude: 71.4186,
  ),
  MockEvent(
    id: '2',
    title: 'Tech Innovation Fair',
    description: 'Showcase of student projects and tech innovations.',
    date: DateTime(2024, 9, 20, 14, 0),
    location: 'C1 Building',
    latitude: 51.0905,
    longitude: 71.4180,
  ),
  MockEvent(
    id: '3',
    title: 'Career Day',
    description: 'Meet with employers and explore career opportunities.',
    date: DateTime(2024, 9, 25, 9, 0),
    location: 'Library',
    latitude: 51.0915,
    longitude: 71.4190,
  ),
  MockEvent(
    id: '4',
    title: 'Cultural Festival',
    description: 'Celebrate diversity with food, music, and performances.',
    date: DateTime(2024, 10, 5, 16, 0),
    location: 'Cafeteria',
    latitude: 51.0910,
    longitude: 71.4185,
  ),
  MockEvent(
    id: '5',
    title: 'Research Symposium',
    description: 'Presentations and discussions on cutting-edge research.',
    date: DateTime(2024, 10, 10, 10, 0),
    location: 'C2 Building',
    latitude: 51.0900,
    longitude: 71.4175,
  ),
];

