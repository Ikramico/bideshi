import 'package:flutter/material.dart';

class Newappbar extends StatelessWidget {
  const Newappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal[400],
      title: null,
      leading: Padding(padding: EdgeInsets.all(16),
      child:  Image.asset('assets/images/logo.png',
      height: 50,
      width: 50,
      ),
      ),
      actions: [
        IconButton(icon: Icon(Icons.mail_lock_outlined),
        onPressed: (){
          Navigator.pushNamed(context, '/notifications');
        },
        )
      ],
    );
  }
}