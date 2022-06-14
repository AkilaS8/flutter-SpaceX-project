import 'package:flutter/material.dart';
import 'package:space_x/features/feature_ships/domain/entites/response/ships_data_entity.dart';
import 'package:space_x/features/feature_ships/prersentation/pages/ships_details_page.dart';

class ShipListTile extends StatelessWidget {

  final ShipDataModelEntity ship;

  ShipListTile({required this.ship});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShipDetailedPage(ship: ship),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: ship.shipId.toString(),
                child: Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: ship.image == null ? AssetImage('assets/images/no_image.png') : NetworkImage(ship.image.toString()) as ImageProvider,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  ship.shipName.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Text(
                  ship.shipId.toString(),
                  textAlign: TextAlign.justify,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Text(
                      "More Details",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
