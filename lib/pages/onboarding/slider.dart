import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  SliderPage({
    this.imageAsset,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: responsiveHeight(225),
            width: responsiveWidth(286),
            child: Image.asset(imageAsset),
          ),
          SizedBox(
            height: responsiveHeight(80),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: responsiveHeight(10),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.75),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: responsiveHeight(200),
          ),
        ],
      ),
    );
  }
}
