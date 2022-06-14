import 'package:flutter/material.dart';
import 'package:space_x/features/feature_dragon/domain/entities/response/dragons_data_entity.dart';
import 'package:space_x/features/feature_dragon/presentation/pages/dragons_details_page.dart';

class DragonListTile extends StatelessWidget {
  final DragonDataEntity dragon;

  DragonListTile({required this.dragon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DragonDetailsPage(dragon: dragon),
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
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: dragon.flickrImages == null
                        ? AssetImage('assets/images/no_image.png')
                        : NetworkImage(dragon.flickrImages![0].toString())
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
                  dragon.name.toString(),
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
                  dragon.description.toString(),
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
