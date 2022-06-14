import 'dart:async';

import 'package:flutter/material.dart';
import 'package:space_x/features/feature_login/authentication/presentation/page/login_page.dart';
//import 'package:space_x/features/feature_navigation_drawer/pages/main_menu_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );
    Timer(Duration(milliseconds: 200), () => animationController.forward());

    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 0.5),
                end: Offset.zero,
              ).animate(animationController),
              child: FadeTransition(
                opacity: animationController,
                child: Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage("assets/images/space_x_2.png"),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15.0,
              child: FadeTransition(
                opacity: animationController,
                child: Text(
                  "Developed by Mobile Team",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ) /* add child content here */,
      ),
    );
  }
}
