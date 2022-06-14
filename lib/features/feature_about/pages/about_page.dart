import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_about/widgets/developer_tile.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              color: kAppbarColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Image(
                    image: AssetImage('assets/images/space_x_2.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "SpaceX Mobile App",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  child: Text(
                    "This Project created using SpaceX APIs to view SpaceX projects, vehicles and etc. This project done by Mobile Team Epic Lanka Technology.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DeveloperTile(
                  name: 'Oshanda Gihan',
                  role: 'Flutter Developer',
                  image: 'assets/images/oshanda.jpeg',
                ),
                DeveloperTile(
                  name: 'Yasmitha Peththanayake',
                  role: 'Flutter Developer',
                  image: 'assets/images/yasmitha.png',
                ),
                DeveloperTile(
                  name: 'Sunali Rambukwella',
                  role: 'Flutter Developer',
                  image: 'assets/images/sunali.jpg',
                ),
                DeveloperTile(
                  name: 'Akila Ishan',
                  role: 'Flutter Developer',
                  image: 'assets/images/akila.png',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
