import 'package:flutter/material.dart';

class Routes {
  const Routes (this.label, this.icon);

  final String label;
  final Widget icon;
}

const List<Routes> routes = <Routes>[
  Routes('Home', Icon(Icons.home_outlined),),
  Routes('Govt', Icon(Icons.room_service_outlined)),
  Routes('BMET', Icon(Icons.note_outlined))
];

class NavDrawer extends StatelessWidget {
   final int index;
  final ValueChanged<int> onDestinationSelectedPage;

  const NavDrawer({super.key,
  required this.index,
  required this.onDestinationSelectedPage});
 



  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [

        Container(
      decoration: BoxDecoration(
        color: Colors.teal[400],
        backgroundBlendMode: BlendMode.multiply,
      ),
      child:NavigationRail(destinations: routes.map((Routes route){
          return NavigationRailDestination(
            icon: route.icon, 
            label: Text(route.label,
            style: TextStyle(),
            ),

          );
        }).toList(), 
        selectedIndex: index,
        extended: true,
        backgroundColor: Colors.teal[50],
        labelType: NavigationRailLabelType.none,
        onDestinationSelected: (int index){
          onDestinationSelectedPage(index);
          Navigator.pop(context);
        },
        
        selectedIconTheme: IconThemeData(
          color: Colors.teal[700],
          weight:600,

        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[800],
          weight: 400,
        ),
        useIndicator: true,
        indicatorColor: const Color.fromARGB(255, 255, 254, 254),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedLabelTextStyle: TextStyle(
          color: Colors.teal[700],
          fontWeight: FontWeight.w700,
          
        ),
        ),
        ),
      ],
    
 
    );
    
    
  }
}