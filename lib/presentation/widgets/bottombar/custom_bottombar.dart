import 'package:dailyx/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class CustomBottombar extends StatefulWidget {
  const CustomBottombar({super.key});

  @override
  State<CustomBottombar> createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Container(
        height: 50,
        width: 150,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 132, 200, 255),
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.black,
              width: 1
            )
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => router.go('/'), 
              icon: const DecoratedIcon(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ), 
                decoration: IconDecoration(
                  border: IconBorder(
                    width: 2,
                  ),
                ),
              )
            ),
            IconButton(
              onPressed: () {}, 
              icon: const DecoratedIcon(
                icon: Icon(
                  Icons.list,
                  color: Colors.white,
                ), 
                decoration: IconDecoration(
                  border: IconBorder(
                    width: 2,
                  ),
                ),
              )
            ),
            IconButton(
              onPressed: () {}, 
              icon: const DecoratedIcon(
                icon: Icon(
                  Icons.note_alt,
                  color: Colors.white,
                ), 
                decoration: IconDecoration(
                  border: IconBorder(
                    width: 2,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}