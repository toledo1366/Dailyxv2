import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: 'Siemka Damian!\n',
                children: [
                  TextSpan(text: 'Dzisiaj masz 2 zadania do wykonania!')
                ]
              )
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))
            ),
            width: MediaQuery.sizeOf(context).width,
            child: Text('xxx'),
          )
        ],
      ),
    );
  }
}