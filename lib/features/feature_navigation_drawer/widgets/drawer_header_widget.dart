import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/constants/colors.dart';
import 'package:space_x/features/feature_login/authentication/data/models/authentication_detail_model.dart';

class DrawerHeaderWidget extends StatefulWidget {

  final AuthenticationDetail userDetails;
  const DrawerHeaderWidget({Key? key,required this.userDetails}) : super(key: key);

  @override
  _DrawerHeaderWidgetState createState() => _DrawerHeaderWidgetState();
}

class _DrawerHeaderWidgetState extends State<DrawerHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 270.0,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 110,
           child: Image(
             image: AssetImage('assets/images/space_x_1.png'),
           ),
          ),

            CircleAvatar(

              radius: 30.0,
              backgroundImage: NetworkImage(widget.userDetails.photoUrl.toString()),
            ),

          Text(
            widget.userDetails.name.toString(),
            style: TextStyle(
              color: kAppbarColor,
              fontSize: 16.0,
            ),
          ),
          Text(
            widget.userDetails.email.toString(),
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
