import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation_bar.dart';
import '../models/category.dart';
import 'category_detail_page.dart';

class BrowseCategoriesPage extends StatelessWidget {
  const BrowseCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

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
                  _buildGradientText('Browse Categories', context),
                  const SizedBox(height: 8),
                  Text(
                    'Explore our curated collections of stunning wallpapers',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppTheme.lightGray),
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
                    itemBuilder: (context, i) {
                      final category = categories[i];
                      return GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => CategoryDetailPage(
                                      categoryName: category.name,
                                    ),
                              ),
                            ),
                        child: _categoryCard(category, context),
                      );
                    },
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
              Text(
                category.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                '${category.wallpaperCount} wallpapers',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildGradientText(String text, BuildContext context) {
  return ShaderMask(
    shaderCallback:
        (bounds) => const LinearGradient(
          colors: [
            AppTheme.primaryOrange,
            AppTheme.gradientMid,
            AppTheme.gradientEnd,
          ],
        ).createShader(bounds),
    child: Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.headlineLarge?.copyWith(color: Colors.white),
    ),
  );
}
