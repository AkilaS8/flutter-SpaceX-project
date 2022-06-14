import 'package:flutter/material.dart';

class ShipsLoadingView extends StatelessWidget {
  const ShipsLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Loading"),
      ),
    );
  }
}
