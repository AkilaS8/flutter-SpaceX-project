import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_dragon/domain/entities/response/dragons_data_entity.dart';
import 'package:space_x/features/feature_rockets/presentation/widgets/image_slider_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DragonDetailsPage extends StatelessWidget {
  DragonDataEntity dragon;

  DragonDetailsPage({required this.dragon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text(
          dragon.name.toString(),
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
                ImageSliderWidget(imgList: dragon.flickrImages),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                  child: Text(
                    dragon.name.toString(),
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
                    "Type : " + dragon.type.toString(),
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
                      dragon.description.toString(),
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
                              (dragon.active.toString() == 'true')
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
                              Text((dragon.active.toString() == 'true')
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
                          child: Text("Crew Capacity"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            dragon.crewCapacity.toString(),
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
                            dragon.firstFlight.toString(),
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
                          child: Text("Diameter"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.diameter == null)
                                ? "null"
                                : dragon.diameter.toString() + " m",
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
                          child: Text("Dry Mass"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            dragon.dryMassKg.toString() + " kg",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Text(
                      "Heat Shield",
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
                          child: Text("Material"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.heightWTrunk == null)
                                ? "null"
                                : dragon.heatShield!.material.toString(),
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
                          child: Text("Size"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.heightWTrunk == null)
                                ? "null"
                                : dragon.heatShield!.sizeMeters.toString() +
                                    " m",
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
                          child: Text("Temperature"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text((dragon.heightWTrunk == null)
                              ? "null"
                              : dragon.heatShield!.tempDegrees.toString()),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Text(
                      "Payload",
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
                          child: Text("Launch Mass"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.launchPayloadMass == null)
                                ? "null"
                                : dragon.launchPayloadMass.toString() + " kg",
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
                          child: Text("Return Mass"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.returnPayloadMass == null)
                                ? "null"
                                : dragon.returnPayloadMass.toString() + " kg",
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
                          child: Text("Launch Volume"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.launchPayloadVol == null)
                                ? "null"
                                : dragon.launchPayloadVol.toString() +
                                    " m\u00B3",
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
                          child: Text("Return Volume"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.returnPayloadVol == null)
                                ? "null"
                                : dragon.returnPayloadVol.toString() +
                                    " m\u00B3",
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
                          child: Text("Pressurized Capsule"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.pressurizedCapsule == null)
                                ? "null"
                                : dragon.pressurizedCapsule!.payloadVolume
                                        .toString() +
                                    " m\u00B3",
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
                          child: Text("Trunk Volume"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.trunk == null)
                                ? "null"
                                : dragon.trunk!.trunkVolume.toString() +
                                    " m\u00B3",
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
                          child: Text("Trunk Height"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.heightWTrunk == null)
                                ? "null"
                                : dragon.heightWTrunk.toString() + " m",
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
                          child: Text("Solar Array"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (dragon.trunk == null)
                                ? "null"
                                : dragon.trunk!.cargo!.solarArray.toString(),
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
                          child: Text("Unpressurized Cargo"),
                        ),
                        Expanded(
                          flex: 1,
                          child: (dragon.trunk == null)
                              ? Text("null")
                              : (dragon.trunk!.cargo!.solarArray.toString() ==
                                      'true')
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
    String url = dragon.wikipedia.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
