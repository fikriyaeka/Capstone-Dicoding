import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/model/model_legal.dart';
import 'package:flutter/material.dart';

class CardLegal extends StatelessWidget {
  final ModelDataLegal legal;
  CardLegal({this.legal});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
          margin: EdgeInsets.only(
            bottom: responsiveHeight(10),
            left: responsiveWidth(25),
            right: responsiveWidth(25),
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
              top: responsiveWidth(11),
              bottom: responsiveWidth(11),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(legal.pt, maxLines: 1,),
                Text(legal.nama),
              ],
            ),
          ),
        );
  }
}