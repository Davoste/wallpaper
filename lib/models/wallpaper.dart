class Wallpaper {
  final String name;
  final String category;
  final List<String> tags;
  final String description;
  final String imageUrl;

  Wallpaper({
    required this.name,
    required this.category,
    required this.tags,
    required this.description,
    required this.imageUrl,
  });
}

final List<Wallpaper> natureWallpapers = List.generate(
  6,
  (i) => Wallpaper(
    name: 'Nature ${i + 1}',
    category: 'Nature',
    tags: ['Nature', 'Ambience', 'Flowers'],
    description:
        'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the outdoors.',
    imageUrl:
        'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=500${i + 1}',
  ),
);
