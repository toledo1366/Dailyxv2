import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color.fromARGB(255, 255, 218, 162),
      title: Text(
        title + ', Damian!', 
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Scaffold.of(context).openEndDrawer(), 
          icon: const Icon(
            Icons.more_vert, 
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
