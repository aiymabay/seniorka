import 'package:flutter/material.dart';
import '../../data/mock_discounts.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/discount_tile.dart';
import '../map/map_screen.dart';
import '../events/events_screen.dart';
import '../profile/profile_screen.dart';

class DiscountsScreen extends StatefulWidget {
  const DiscountsScreen({super.key});

  @override
  State<DiscountsScreen> createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  int _currentIndex = 2;

  void _onBottomNavTap(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const MapScreen()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const EventsScreen()),
        );
        break;
      case 2:
        // Already on discounts
        break;
      case 3:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discounts')),
      body: ListView.builder(
        itemCount: mockDiscounts.length,
        itemBuilder: (context, index) {
          return DiscountTile(discount: mockDiscounts[index]);
        },
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }
}
