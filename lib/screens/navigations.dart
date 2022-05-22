import 'package:flutter/material.dart';

import 'home_screen.dart';

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({Key? key}) : super(key: key);

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  int _currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('Explore'),),),
    const Scaffold(body: Center(child: Text('Add'),),),
    const Scaffold(body: Center(child: Text('Sub'),),),
    const Scaffold(body: Center(child: Text('Library'),),),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (indx) => setState(() => _currentIndex = indx),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
              activeIcon: Icon(Icons.explore)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add',
              activeIcon: Icon(Icons.add_circle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Subscriptions',
              activeIcon: Icon(Icons.video_library_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              label: 'Library',
              activeIcon: Icon(Icons.home)),
        ],
      ),
    );
  }
}
