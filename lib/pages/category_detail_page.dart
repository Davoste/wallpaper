import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation_bar.dart';
import '../models/wallpaper.dart';

class CategoryDetailPage extends StatefulWidget {
  final String categoryName;
  const CategoryDetailPage({super.key, required this.categoryName});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final wallpapers = natureWallpapers;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      body: Column(
        children: [
          const NavigationBarWidget(currentPage: 'Browse'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppTheme.lightGray,
                        ),
                      ),
                      Text(
                        'Back to Categories',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.lightGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.categoryName,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 32),
                  if (isDesktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 0.75,
                                ),
                            itemCount: wallpapers.length,
                            itemBuilder:
                                (context, i) => GestureDetector(
                                  onTap:
                                      () => setState(() => selectedIndex = i),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      wallpapers[i].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 2,
                          child: _buildPreview(
                            wallpapers[selectedIndex],
                            context,
                          ),
                        ),
                      ],
                    )
                  else
                    _buildPreview(wallpapers[selectedIndex], context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreview(Wallpaper wallpaper, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Preview',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            wallpaper.imageUrl,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text('Name', style: Theme.of(context).textTheme.bodyMedium),
        Text(wallpaper.name, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Text('Tags', style: Theme.of(context).textTheme.bodyMedium),
        Wrap(
          spacing: 8,
          children: wallpaper.tags.map((t) => Chip(label: Text(t))).toList(),
        ),
        const SizedBox(height: 16),
        Text('Description', style: Theme.of(context).textTheme.bodyMedium),
        Text(
          wallpaper.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                label: const Text('Save to Favorites'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Set to Wallpaper'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
