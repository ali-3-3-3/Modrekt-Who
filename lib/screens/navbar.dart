import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modrekt_who/screens/modules_main.dart';
import 'package:modrekt_who/screens/timetable_screen.dart';

class NavBar extends ConsumerStatefulWidget {
  const NavBar({super.key});

  @override
  ConsumerState<NavBar> createState() {
    return _NavBarState();
  }
}

class _NavBarState extends ConsumerState<NavBar> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const ModulesPage();
    if (_selectedPageIndex == 1) {
      activePage = const Timetable();
    }

    if (_selectedPageIndex == 2) {
      FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Modules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios),
            label: 'Sign out',
          ),
        ],
      ),
    );
  }
}
