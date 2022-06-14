import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';

class DeveloperTile extends StatelessWidget {
  final String name;
  final String image;
  final String role;

  DeveloperTile({required this.name, required this.role, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: ListTile(
        tileColor: kDrawerSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage('$image'),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(role),
      ),
    );
  }
}
