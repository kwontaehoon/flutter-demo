import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bottom_bar/home_page.dart';
import 'package:flutter_application_1/pages/bottom_bar/profile_page.dart';
import 'package:flutter_application_1/pages/bottom_bar/search_page.dart';
import 'package:flutter_application_1/pages/bottom_bar/wishlist_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    Center(child: HomePage()),
    WishlistPage(),
    Center(child: SearchPage()),
    Center(child: ProfilePage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: _selectedIndex == 1 ? null : const Text('BottomBar'),
        backgroundColor: _selectedIndex == 1
            ? Colors.transparent
            : const Color(0xff008762),
        elevation: _selectedIndex == 1 ? 0 : 4,
      ),

      body: _pages[_selectedIndex],

      bottomNavigationBar: SizedBox(
        // height: 102,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff008761),
          unselectedItemColor: Colors.grey,
          // iconSize: 28,
          // selectedLabelStyle: const TextStyle(fontSize: 11, height: 2.0),
          // unselectedLabelStyle: const TextStyle(fontSize: 20, height: 2.0),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '위시리스트'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
          ],
        ),
      ),
    );
  }
}
