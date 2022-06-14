import 'package:flutter/material.dart';
import 'package:space_x/core/custom_icons/custom_icons_icons.dart';

class BottomNavigationBarLaunches extends StatelessWidget {
  final int index;
  final void Function(int) onPressed;

  BottomNavigationBarLaunches({required this.index, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.rocket_1),
          title: Text(
            "Upcoming",
            style: TextStyle(fontFamily: 'SegoeUI'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.rocket_1),
          title: Text(
            "Past",
            style: TextStyle(fontFamily: 'SegoeUI'),
          ),
        ),



      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0XFF186088),
      currentIndex: index,
      selectedItemColor: Color(0XFFFFFFFF),
      onTap: onPressed,
    );
  }
}


