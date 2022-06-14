import 'package:flutter/material.dart';
import 'package:space_x/features/feature_rockets/domain/entities/response/rockets_data_entity.dart';
import 'package:space_x/features/feature_rockets/presentation/pages/rockets_details_page.dart';

class RocketListTile extends StatelessWidget {
  final RocketDataEntity rocket;

  RocketListTile({required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RocketDetailsPage(rocket: rocket),
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
              Container(
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: rocket.flickrImages == null
                        ? AssetImage('assets/images/no_image.png')
                        : NetworkImage(rocket.flickrImages![0].toString())
                            as ImageProvider,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  rocket.rocketName.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Text(
                  rocket.description.toString(),
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
