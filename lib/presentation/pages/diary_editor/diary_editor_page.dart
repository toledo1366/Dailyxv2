import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../widgets/bottombar/custom_bottombar.dart';
import '../../widgets/end_drawer/custom_end_drawer.dart';

class DiaryEditorPage extends StatefulWidget {
  const DiaryEditorPage({super.key});

  @override
  State<DiaryEditorPage> createState() => _DiaryEditorPageState();
}

class _DiaryEditorPageState extends State<DiaryEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 218, 162),
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
            child: StrokeText(
            text: 'Jak Ci minął dzień?', 
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            strokeColor: Colors.black,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)
          ),
          side: BorderSide(color: Colors.black)
        ),
        backgroundColor: const Color.fromARGB(255, 132, 200, 255),
        actions: [
          Builder(
            builder: (context) => IconButton(
              padding: const EdgeInsets.only(top: 10),
              icon: const DecoratedIcon(icon: Icon(Icons.more_horiz, color: Colors.white,),decoration: IconDecoration(border: IconBorder(width: 2)),),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: _buildContent(context),
      endDrawer: const CustomEndDrawer(),
      bottomNavigationBar: const CustomBottombar(),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Placeholder();
  }
}