import 'package:flutter/material.dart';
import 'package:space_x/features/feature_launches/core/launches_navigation_list.dart';
import 'package:space_x/features/feature_launches/widgets/bottom_navigation_bar.dart';

class LaunchesPage extends StatefulWidget {
  const LaunchesPage({Key? key}) : super(key: key);

  @override
  _LaunchesPageState createState() => _LaunchesPageState();
}

class _LaunchesPageState extends State<LaunchesPage> {
  int _currentIndex = 0;
  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: kLaunchPages[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBarLaunches(
          index: _currentIndex,
          onPressed: _onItemSelected,
        ),
      ),
    );
  }
}


