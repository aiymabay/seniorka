class MockDiscount {
  final String id;
  final String place;
  final String discountText;
  final String description;
  final DateTime expirationDate;
  final double latitude;
  final double longitude;

  MockDiscount({
    required this.id,
    required this.place,
    required this.discountText,
    required this.description,
    required this.expirationDate,
    required this.latitude,
    required this.longitude,
  });
}

final List<MockDiscount> mockDiscounts = [
  MockDiscount(
    id: '1',
    place: 'Campus Coffee Shop',
    discountText: '20% OFF',
    description: 'Get 20% off on all beverages. Show your student ID.',
    expirationDate: DateTime(2024, 10, 31),
    latitude: 51.0910,
    longitude: 71.4185,
  ),
  MockDiscount(
    id: '2',
    place: 'University Bookstore',
    discountText: '15% OFF',
    description: '15% discount on textbooks and supplies.',
    expirationDate: DateTime(2024, 11, 15),
    latitude: 51.0915,
    longitude: 71.4190,
  ),
  MockDiscount(
    id: '3',
    place: 'Cafeteria',
    discountText: '10% OFF',
    description: '10% off on lunch meals for students.',
    expirationDate: DateTime(2024, 12, 31),
    latitude: 51.0910,
    longitude: 71.4185,
  ),
  MockDiscount(
    id: '4',
    place: 'Gym & Fitness Center',
    discountText: 'Free Trial',
    description: 'Free 7-day trial for new members.',
    expirationDate: DateTime(2024, 10, 20),
    latitude: 51.0920,
    longitude: 71.4200,
  ),
  MockDiscount(
    id: '5',
    place: 'Printing Services',
    discountText: '50% OFF',
    description: 'Half price on all printing services this week.',
    expirationDate: DateTime(2024, 9, 30),
    latitude: 51.0905,
    longitude: 71.4180,
  ),
];

