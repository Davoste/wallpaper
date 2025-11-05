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
    description: 'Mountains, forests, and landscapes',
    wallpaperCount: 6,
    imageUrl:
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    name: 'Abstract',
    description: 'Shapes, gradients, and creativity',
    wallpaperCount: 4,
    imageUrl:
        'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWJzdHJhY3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500',
  ),
  Category(
    name: 'Urban',
    description: 'Cities, architecture, and street art',
    wallpaperCount: 6,
    imageUrl:
        'https://images.unsplash.com/photo-1493612276216-ee3925520721?auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    name: 'Space',
    description: 'Cosmos, planets, and galaxies',
    wallpaperCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    name: 'Minimalist',
    description: 'Clean, simple, and elegant',
    wallpaperCount: 6,
    imageUrl:
        'https://images.unsplash.com/photo-1503602642458-232111445657?auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    name: 'Animals',
    description: 'Wildlife and nature photography',
    wallpaperCount: 4,
    imageUrl:
        'https://images.unsplash.com/photo-1474511320723-9a56873867b5?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QU5JTUFMfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=500',
  ),
];
