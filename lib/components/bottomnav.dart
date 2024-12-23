import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {

  final int currIndex;
  final ValueChanged<int> onTapIcon;

  const BottomNav({super.key,
  required this.currIndex,
  required this.onTapIcon});
  
  

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> navItems = [
      {'label': 'Home', 'icon':Icons.home_outlined},
      {'label': 'Documents', 'icon':Icons.folder_shared_outlined},
      {
        'label': 'Profile', 'icon': Icons.account_circle_sharp
      }

     
    ];
    return BottomNavigationBar(
      currentIndex: currIndex,
      onTap: onTapIcon,
      items: navItems.map(
        (item){
          return BottomNavigationBarItem(
            icon: Icon(item['icon']),
            label: item['label'],
          );
        }
      ).toList(),
      selectedItemColor: Colors.teal[700],
      unselectedItemColor: Colors.grey[700],
      backgroundColor: Colors.teal[50],
      type: BottomNavigationBarType.fixed,
    );
  }
}