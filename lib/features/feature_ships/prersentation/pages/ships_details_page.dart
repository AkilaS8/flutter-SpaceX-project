import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_ships/domain/entites/response/ships_data_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ShipDetailedPage extends StatelessWidget {
  ShipDataModelEntity ship;

  ShipDetailedPage({required this.ship});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text(
          ship.shipName.toString(),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: ship.shipId.toString(),
            child: Image(
              image: ship.image == null
                  ? AssetImage('assets/images/no_image.png')
                  : NetworkImage(ship.image.toString()) as ImageProvider,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(
              ship.shipName.toString(),
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
            child: Text(
              "Type : " + ship.shipType.toString(),
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              (ship.active.toString() == 'true')
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
                              Text((ship.active.toString() == 'true')
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
                          child: Text("Home Port"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ship.homePort.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Text(
                      "Roles",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ship.roles!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 2.0),
                        child: Text(
                          (index + 1).toString() +
                              ". " +
                              ship.roles![index].toString(),
                        ),
                      );
                    },
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
                                          "assets/images/newspaper_white.png"),
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
          ),
        ],
      ),
    );
  }

  _launchWebArticle() async {
    String url = ship.url.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
