import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/pages/details/ilegalscreen.dart';
import 'package:capstone_dicoding/pages/details/legalscreen.dart';
import 'package:capstone_dicoding/pages/theme/theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: purple,
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, boxConstraintsconstraints) {
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
                          height: responsiveHeight(60),
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
                          child: Column(
                            children: <Widget>[
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/img/svg_legal.svg",
                                height: responsiveHeight(31),
                              ),
                              Text(
                                "Legal",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const Spacer(),
                            ],
                          ),
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
                          height: responsiveHeight(60),
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
                          child: Column(
                            children: <Widget>[
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/img/svg_ilegal.svg",
                                height: responsiveHeight(32),
                              ),
                              Text(
                                "Ilegal",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: responsiveWidth(380),
                margin: const EdgeInsets.only(top: 174),
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
                    Institutions(),
                    Institutions(),
                    Institutions(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Show Ilegal Investment Institutions',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Institutions(),
                    Institutions(),
                    Institutions(),
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

class Institutions extends StatelessWidget {
  const Institutions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
