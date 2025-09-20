import 'package:admin_campus_navigation/framework/providers/bottom_navigation_provider.dart';
import 'package:admin_campus_navigation/ui/screens/add_category_screen.dart';
import 'package:admin_campus_navigation/ui/screens/add_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> pages = [
      DashboardScreen(),
      AddCategoryScreen(),
      AddLocationScreen(),
    ];
    List<String> titles = ['Dashboard', 'Add Category', 'Add Location'];
    return Scaffold(
      appBar: AppBar(title: Text(titles[ref.watch(bottomNavigationProvider)])),
      body: pages[ref.watch(bottomNavigationProvider)],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(bottomNavigationProvider),
        onTap: (index) {
          ref.read(bottomNavigationProvider.notifier).onTap(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Add Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: 'Add Location',
          ),
        ],
      ),
    );
  }
}
