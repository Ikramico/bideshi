import 'package:bideshi/components/bottomnav.dart';
import 'package:bideshi/components/nav.dart';
import 'package:bideshi/pages/bmet.dart';
import 'package:bideshi/pages/documents.dart';
import 'package:bideshi/pages/govt.dart';
import 'package:bideshi/pages/home.dart';
import 'package:bideshi/pages/notifications.dart';
import 'package:bideshi/pages/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/govt': (context) => Govt(),
        '/bmet': (context) => BMET(),
        '/notifications': (context) => Notifications(),
        '/carddetails': (context) => Notifications(),
      },
      home: Bideshi(),
    );
  }
}

class Bideshi extends StatefulWidget {
  const Bideshi({super.key});

  @override
  State<Bideshi> createState() => _BideshiState();
}

class _BideshiState extends State<Bideshi> {
  int _currentIndex = 0;

  // Pages for bottom navigation
  final List<Widget> _bottomNavPages = const [
    Home(),
    ProfileView(),
    Document(),
  ];

  // Pages for drawer navigation
  final List<Widget> _drawerPages = const [
    Govt(),
    BMET(),
  ];

  // Unified pages list combining bottom navigation and drawer navigation
  List<Widget> get _allPages => [..._bottomNavPages, ..._drawerPages];

  // Dynamic logic to determine if the current page belongs to bottom navigation
  bool get _isBottomNavActive => _currentIndex < _bottomNavPages.length;

  // Function to navigate to a page
  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index >= _bottomNavPages.length) {
      Navigator.pop(context); // Close drawer if navigating from drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 5,
            ),
          ],
        ),
        leadingWidth: 50,
        actions: [
          IconButton(
            icon: Icon(Icons.mail_outlined),
            color: Colors.teal[700],
            padding: EdgeInsets.only(right: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.teal[50],
        child: NavDrawer(
          index: _currentIndex < _bottomNavPages.length
              ? _currentIndex
              : 0, // Ensure drawer starts from a valid index
          onDestinationSelectedPage: (drawerIndex) {
            // Ensure correct index mapping to global page list
            if (drawerIndex < _drawerPages.length) {
              _navigateToPage(drawerIndex + _bottomNavPages.length);
            }
          },
        ),
      ),
      body: _allPages[_currentIndex],
      bottomNavigationBar: _isBottomNavActive
          ? BottomNav(
              currIndex: _currentIndex,
              onTapIcon: _navigateToPage,
            )
          : null, // Hide bottom nav if not on bottom nav pages
    );
  }
}
