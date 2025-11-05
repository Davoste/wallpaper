import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../pages/home_page.dart';
import '../pages/browse_page.dart';
import '../pages/favorites_page.dart';
import '../pages/settings_page.dart';

class NavigationBarWidget extends StatelessWidget {
  final String currentPage;
  const NavigationBarWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          const Text(
            'Wallpaper Studio',
            style: TextStyle(
              fontFamily: 'ClashDisplay',
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          _navItem(
            context,
            Icons.home_outlined,
            'Home',
            currentPage == 'Home',
            HomePageBeforeSelection(),
          ),
          _navItem(
            context,
            Icons.grid_view_outlined,
            'Browse',
            currentPage == 'Browse',
            const BrowseCategoriesPage(),
          ),
          _navItem(
            context,
            Icons.favorite_border,
            'Favourites',
            currentPage == 'Favourites',
            const FavoritesPage(),
          ),
          _navItem(
            context,
            Icons.settings_outlined,
            'Settings',
            currentPage == 'Settings',
            const SettingsPage(),
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
    Widget targetPage,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: InkWell(
        onTap: () {
          if (!isActive) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => targetPage),
            );
          }
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? AppTheme.primaryOrange : AppTheme.lightGray,
              size: 20,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isActive ? AppTheme.primaryOrange : AppTheme.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
