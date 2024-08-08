import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Tutaj będzie odnośnik do To Do'),
          Text('Tutaj będzie odnośnik do pamiętnika'),
          Text('Tutaj będzie odnośnik do ustawień'),
        ],
      ),
    );
  }
}
