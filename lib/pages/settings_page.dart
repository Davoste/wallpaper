import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavigationBarWidget(currentPage: 'Settings'),
          const Expanded(
            child: Center(child: Text('Settings Page - Coming soon')),
          ),
        ],
      ),
    );
  }
}
