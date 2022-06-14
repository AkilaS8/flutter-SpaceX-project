import 'package:flutter/material.dart';
import 'package:space_x/features/feature_vehicles/core/vehicles_navigation_list.dart';
import 'package:space_x/features/feature_vehicles/widgets/bottom_navigation_bar.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
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
          child: kVehiclePages[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          index: _currentIndex,
          onPressed: _onItemSelected,
        ),
      ),
    );
  }
}
