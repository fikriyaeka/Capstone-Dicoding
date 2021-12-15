import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/pages/details/ilegalscreen.dart';
import 'package:capstone_dicoding/pages/details/legalscreen.dart';
import 'package:capstone_dicoding/pages/theme/theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: purple,
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraintsconstraints) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: responsiveHeight(50),
                  ),
                  Center(
                      child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'INLINE',
                        textStyle: TextStyle(
                          fontSize: 32.0,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 1000),
                      ),
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  )),
                  SizedBox(
                    height: responsiveHeight(20),
                  ),
                  Row(
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
                          width: responsiveWidth(100),
                          height: responsiveHeight(50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade600,
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                            ],
                          ),
                          child: Center(
                              child: Text(
                            "LEGAL",
                            style: Theme.of(context).textTheme.subtitle2,
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
                          width: responsiveWidth(100),
                          height: responsiveHeight(50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade600,
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                            ],
                          ),
                          child: Center(
                              child: Text(
                            "ILEGAL",
                            style: Theme.of(context).textTheme.subtitle2,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: responsiveWidth(380),
                margin: const EdgeInsets.only(top: 147),
                padding: const EdgeInsets.symmetric(horizontal: 26),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: simpleGrey),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Show Legal Investment Institutions',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
