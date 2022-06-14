import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final String company;
  final String title;

  const CustomRowWidget({Key? key, required this.company, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 25.0,
        ),
        Text(
          company.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}