import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const WallpaperStudioApp());
}

class WallpaperStudioApp extends StatelessWidget {
  const WallpaperStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        textTheme: TextTheme(
          headlineLarge: const TextStyle(
            fontFamily: 'ClashDisplay',
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF3C3C43),
            height: 1.6,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF8E8E93),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF8E8E93)),
        ),
      ),
      home: const BrowseCategoriesPage(),
    );
  }
}

// --- COLORS ---
const Color primaryOrange = Color(0xFFFBB03B);
const Color gradientMid = Color(0xFFFFA821);
const Color gradientEnd = Color(0xFFEC0C43);
const Color lightGray = Color(0xFF8E8E93);
const Color darkGray = Color(0xFF3C3C43);

// --- MODEL ---
class Category {
  final String name;
  final String description;
  final int wallpaperCount;
  final String imageUrl;

  Category({
    required this.name,
    required this.description,
    required this.wallpaperCount,
    required this.imageUrl,
  });
}

final List<Category> categories = [
  Category(
    name: 'Nature',
    description: 'Mountains, Forest and Landscapes',
    wallpaperCount: 3,
    imageUrl: 'https://via.placeholder.com/300x200?text=Nature',
  ),
  Category(
    name: 'Abstract',
    description: 'Modern Geometric and artistic designs',
    wallpaperCount: 4,
    imageUrl: 'https://via.placeholder.com/300x200?text=Abstract',
  ),
  Category(
    name: 'Urban',
    description: 'Cities, architecture and street',
    wallpaperCount: 6,
    imageUrl: 'https://via.placeholder.com/300x200?text=Urban',
  ),
  Category(
    name: 'Space',
    description: 'Cosmos, planets, and galaxies',
    wallpaperCount: 3,
    imageUrl: 'https://via.placeholder.com/300x200?text=Space',
  ),
  Category(
    name: 'Minimalist',
    description: 'Clean, simple, and elegant',
    wallpaperCount: 6,
    imageUrl: 'https://via.placeholder.com/300x200?text=Minimalist',
  ),
  Category(
    name: 'Animals',
    description: 'Wildlife and nature photography',
    wallpaperCount: 4,
    imageUrl: 'https://via.placeholder.com/300x200?text=Animals',
  ),
];

// --- NAVIGATION BAR ---
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
          // Left Logo
          Text(
            'Wallpaper Studio',
            style: const TextStyle(
              fontFamily: 'ClashDisplay',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),

          // Navigation Links with Icons
          _navItem(Icons.home_outlined, 'Home', currentPage == 'Home'),
          _navItem(Icons.grid_view_outlined, 'Browse', currentPage == 'Browse'),
          _navItem(
            Icons.favorite_border,
            'Favourites',
            currentPage == 'Favourites',
          ),
          _navItem(
            Icons.settings_outlined,
            'Settings',
            currentPage == 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            Icon(icon, color: isActive ? primaryOrange : lightGray, size: 20),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isActive ? primaryOrange : darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- BROWSE PAGE ---
class BrowseCategoriesPage extends StatelessWidget {
  const BrowseCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      body: Column(
        children: [
          const NavigationBarWidget(currentPage: 'Browse'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Browse Categories',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore our curated collections of stunning wallpapers',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: lightGray),
                  ),
                  const SizedBox(height: 40),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop ? 3 : 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: categories.length,
                    itemBuilder:
                        (context, i) => _categoryCard(categories[i], context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(Category category, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[50],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(category.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.name,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                category.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${category.wallpaperCount} wallpapers',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
