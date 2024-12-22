import 'package:bideshi/components/nav.dart';
import 'package:bideshi/components/newappbar.dart';
import 'package:bideshi/pages/bmet.dart';
import 'package:bideshi/pages/govt.dart';
import 'package:bideshi/pages/home.dart';
import 'package:bideshi/pages/notifications.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/govt': (context) => Govt(),
        '/bmet': (context) => BMET(),
        '/notifications':(context) => Notifications(),
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
  int _index = 2;

  final List<Widget> _pages = const [
    Home(),
    Govt(),
    BMET(),
  ];

  void _toPage(int index){
    setState(() {
      _index = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child:Newappbar(),) ,
      drawer: Drawer(
        backgroundColor: Colors.teal[50],
        child: NavDrawer(
          index: _index, 
          onDestinationSelectedPage: _toPage),
      ),
      body: _pages[_index],
    );
  }
}