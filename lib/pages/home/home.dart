import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/pages/details/ilegalscreen.dart';
import 'package:capstone_dicoding/pages/details/legalscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return LegalScreen();
                }));
              },
              child: Container(
                height: responsiveHeight(50),
                width: responsiveWidth(100),
                color: Color(0xFFB983FF),
                child: Center(
                    child: Text(
                  "Legal",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return IlegalScreen();
                }));
              },
              child: Container(
                height: responsiveHeight(50),
                width: responsiveWidth(100),
                color: Color(0xFFB983FF),
                child: Center(
                  child: Text(
                    "ILegal",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
