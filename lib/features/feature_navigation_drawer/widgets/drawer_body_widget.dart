import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';

class DrawerBody extends StatelessWidget {
  String title;
  IconData iconData;

  DrawerBody({required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              iconData,
              size: 20,
              color: kAppbarColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                color: kAppbarColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
