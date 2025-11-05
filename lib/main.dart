import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';

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
      theme: AppTheme.lightTheme,
      home: const HomePageBeforeSelection(),
    );
  }
}
