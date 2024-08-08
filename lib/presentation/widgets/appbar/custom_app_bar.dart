import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 85, 147, 255),
      title: Text(
        title, 
        style: const TextStyle(
          color: Colors.white
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Scaffold.of(context).openEndDrawer(), 
          icon: const Icon(
            Icons.more_vert, 
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
