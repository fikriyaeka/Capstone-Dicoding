import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/pages/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LegalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: responsiveHeight(232),
                width: responsiveWidth(325),
                child: Image.asset("assets/img/legal.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: responsiveHeight(25),
                left: responsiveWidth(25),
              ),
              child: CircleAvatar(
                backgroundColor: Color(0xFFF8F3FF),
                child: Center(
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SlidingUpPanel(
              maxHeight: responsiveHeight(650),
              minHeight: responsiveHeight(75),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              backdropEnabled: true,
              color: simpleGrey,
              collapsed: _collapsed(),
              panelBuilder: (ScrollController sc) => _scrollingList(sc),
            )
          ],
        ),
      ),
    );
  }

  Widget _scrollingList(ScrollController sc) {
    return ListView.builder(
      padding: EdgeInsets.only(
        top: responsiveHeight(75),
      ),
      controller: sc,
      itemCount: 50,
      itemBuilder: (BuildContext context, int i) {
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
                Text("PT Lorem Ipsum"),
                Text("Lorem Ipsum"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _collapsed() {
    return Center(
      child: Shimmer.fromColors(
        child: Column(
          children: <Widget>[
            Icon(Icons.keyboard_arrow_up),
            Text(
              "Swipe Up",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        baseColor: black,
        highlightColor: white,
      ),
    );
  }
}
