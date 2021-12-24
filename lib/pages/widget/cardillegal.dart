import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/model/model_illegal.dart';
import 'package:flutter/material.dart';

class CardIllegal extends StatelessWidget {
  final ModelDataIllegal illegal;
  CardIllegal({this.illegal});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
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
      child: Padding(
        padding: EdgeInsets.only(
          left: responsiveWidth(15),
          right: responsiveWidth(15),
          top: responsiveWidth(10),
          bottom: responsiveWidth(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              illegal.pt,
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              illegal.type,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
