import 'package:capstone_dicoding/mediaquery/SizeConfig.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
          child: Container(
            height: responsiveHeight(50),
            width: responsiveWidth(25),
            color: Colors.black,
          ),
        ),
      );
  }
}