import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoadingHome extends StatefulWidget {
  @override
  _CardLoadingHomeState createState() => _CardLoadingHomeState();
}

class _CardLoadingHomeState extends State<CardLoadingHome> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        margin: EdgeInsets.only(
          bottom: responsiveHeight(10),
        ),
        height: responsiveHeight(60),
        width: responsiveWidth(325),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Loading",
              maxLines: 1,
            ),
            Text("Loading"),
          ],
        ),
      ),
    );
  }
}
