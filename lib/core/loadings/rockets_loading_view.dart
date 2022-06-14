import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RocketsLoadingView extends StatelessWidget {
  const RocketsLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Lottie.asset('assets/images/loading.json'),
        ),
      ),
    );
  }
}
