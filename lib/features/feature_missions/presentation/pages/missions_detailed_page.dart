import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_missions/domain/entities/response/missions_data_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class MissionsDetailedPage extends StatelessWidget {

  MissionsDataModelEntity mission;

  MissionsDetailedPage({required this.mission});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: kBackgroundGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: kAppbarColor,
          title: Text("Mission " + mission.missionName.toString()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        mission.missionName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Mission ID: " +
                        mission.missionId.toString(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Manufactured by: " + mission.manufacturers.toString(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        mission.description.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "More Details:",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: _launchWebUrl,
                      child: Card(
                        child: Container(
                          width: 120.0,
                          height: 40.0,
                          child: Row(
                            children: [
                              Container(
                                  height: 35.0,
                                  width: 35.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset("assets/images/newspaper.png"),
                                  )),
                              Text("Articles", style: TextStyle(fontSize: 15.0),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: _launchWikipediaUrl,
                      child: Card(
                        child: Container(
                          width: 120.0,
                          height: 40.0,
                          child: Row(
                            children: [
                              Container(
                                  height: 35.0,
                                  width: 35.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        "assets/images/wikipedia_logo.png"),
                                  )),
                              Text("Wikipedia",style: TextStyle(fontSize: 15.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: _launchTwitterUrl,
                      child: Card(
                        child: Container(
                          width: 120.0,
                          height: 40.0,
                          child: Row(
                            children: [
                              Container(
                                  height: 35.0,
                                  width: 35.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/images/twitter.png"),
                                  )),
                              Text("Twitter" ,style: TextStyle(fontSize: 15.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchWebUrl() async {
    String url = mission.website.toString();
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cannot direct to $url';
    }
  }
  _launchWikipediaUrl() async {
    String url = mission.wikipedia.toString();
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cannot direct to $url';
    }
  }
  _launchTwitterUrl() async {
    String url = mission.twitter.toString();
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cannot direct to $url';
    }
  }
}
