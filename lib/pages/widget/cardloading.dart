import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/pages/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoading extends StatefulWidget {
  @override
  _CardLoadingState createState() => _CardLoadingState();
}

class _CardLoadingState extends State<CardLoading> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        top: responsiveHeight(75),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: responsiveHeight(25)),
      child: Expanded(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
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
            ),
            itemCount: 12,
          ),
        ),
      ),
    );
  }
}
