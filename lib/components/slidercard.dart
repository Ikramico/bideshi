import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
    SliderCard({super.key});

  final List<CardItem> cardItems = List.generate(4, (index){
    return CardItem(
      title: 'Card $index',
      content: 'This is a card content',
      icon: Icons.home,
      route: '/carddetails'
    );
  });
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cardItems.map((cardItem){
        return CardWidg(item: cardItem);
      }).toList()
     
    ),
     
    );
   
  }
}



class CardWidg extends StatelessWidget {
  final CardItem item;

 const  CardWidg({super.key, required this.item}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, item.route, arguments: item);
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(item.icon),
                Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(item.content),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }

}

class CardItem {
  final String title;
  final String content;
  final IconData icon;
  final String route;

  CardItem({required this.title, required this.content, required this.icon, required this.route});
}


