import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_rockets/domain/entities/response/rockets_data_entity.dart';
import 'package:space_x/features/feature_rockets/presentation/widgets/image_slider_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsPage extends StatelessWidget {
  RocketDataEntity rocket;

  RocketDetailsPage({required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text(
          rocket.rocketName.toString(),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: kBackgroundGradient,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSliderWidget(imgList: rocket.flickrImages),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                  child: Text(
                    rocket.rocketName.toString(),
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                  child: Text(
                    "Type : " + rocket.rocketType.toString(),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                    child: Text(
                      rocket.description.toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Active"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              (rocket.active.toString() == 'true')
                                  ? IconTheme(
                                      data: IconThemeData(
                                        color: Colors.green,
                                      ),
                                      child: Icon(Icons.check_circle_sharp))
                                  : IconTheme(
                                      data: IconThemeData(
                                        color: Colors.red,
                                      ),
                                      child: Icon(Icons.cancel_sharp)),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text((rocket.active.toString() == 'true')
                                  ? 'Active'
                                  : 'De-Active'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Cost per launch"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "\$ " + rocket.costPerLaunch.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Launch Success Rate"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.successRatePct.toString() + " %",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("First Flight"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.firstFlight.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Stages"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.stages.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Height"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.height.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Diameter"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.diameter!.meters.toString() + " m",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Mass"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.mass!.kg.toString() + " kg",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Text(
                      "Engine Details",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Engine Number"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.engines!.number.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Engine Type"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.engines!.type.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Engine Version"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.engines!.version.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Engine Layout"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.engines!.layout.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Engine loss max"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            rocket.engines!.engineLossMax.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Text(
                      "More Details",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 25.0),
                    child: GestureDetector(
                      onTap: _launchWebArticle,
                      child: Card(
                        color: kCardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 120.0,
                            child: Row(
                              children: [
                                Container(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/wikipedia_logo_white.png"),
                                    )),
                                Text(
                                  "Read More",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _launchWebArticle() async {
    String url = rocket.wikipedia.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
