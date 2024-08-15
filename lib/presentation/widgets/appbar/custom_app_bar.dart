import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget child;

  const CustomAppBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Text(
        'Cześć, Damian!', 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40)
        )
      ),
      backgroundColor: Color.fromARGB(255, 132, 200, 255),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 100), 
        child: Container(
          child: child,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
