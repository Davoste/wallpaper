import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation_bar.dart';
import '../models/category.dart';
import 'browse_page.dart';
import 'category_detail_page.dart';

class HomePageBeforeSelection extends StatelessWidget {
  const HomePageBeforeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      body: Column(
        children: [
          const NavigationBarWidget(currentPage: 'Home'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGradientText('Discover Beautiful Wallpapers', context),
                  const SizedBox(height: 8),
                  Text(
                    'Discover curated collections of stunning wallpapers. Browse by ',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppTheme.lightGray),
                  ),
                  Text(
                    'category, preview in full-screen, and set your favorites.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppTheme.lightGray),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const BrowseCategoriesPage(),
                              ),
                            ),
                        child: Text(
                          'See All',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppTheme.primaryOrange),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildCategoryGrid(
                    context,
                    crossAxisCount: isDesktop ? 3 : 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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

  Widget _buildCategoryGrid(
    BuildContext context, {
    required int crossAxisCount,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, i) {
        final cat = categories[i];
        return GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryDetailPage(categoryName: cat.name),
                ),
              ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Wallpaper image
                Positioned.fill(
                  child: Image.network(cat.imageUrl, fit: BoxFit.cover),
                ),

                // Full-width gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                // Text overlay content
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cat.name,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cat.description,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Colors.white.withOpacity(0.85)),
                        ),
                        Text(
                          '${cat.wallpaperCount} wallpapers',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.white.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
