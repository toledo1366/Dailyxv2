import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  
  @override
  Size get preferredSize => Size(double.infinity, 80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.menu, size: 40,),
          Text(DateTime.now().toString()),
          Spacer(),
          Icon(Icons.search),
          Icon(Icons.circle)
        ],
      ),
    );
  }
}