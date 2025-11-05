import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavigationBarWidget(currentPage: 'Favourites'),
          const Expanded(
            child: Center(child: Text('Favorites Page - Coming soon')),
          ),
        ],
      ),
    );
  }
}
