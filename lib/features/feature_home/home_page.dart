import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_home/widgets/next_launch_section.dart';
import 'package:space_x/features/feature_home/widgets/upcoming_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: kAppbarColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: AssetImage('assets/images/space_x_2.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "“Failure is an option here. If things are not failing, you are not innovating enough.“\n- Elon Musk",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: NextLaunchSection(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: UpcomingSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
