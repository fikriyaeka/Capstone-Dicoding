import 'package:capstone_dicoding/backend/api_illegals.dart';
import 'package:capstone_dicoding/backend/api_legal.dart';
import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/model/model_illegal.dart';
import 'package:capstone_dicoding/model/model_legal.dart';
import 'package:capstone_dicoding/pages/details/illegal/ilegalscreen.dart';
import 'package:capstone_dicoding/pages/details/legal/legalscreen.dart';
import 'package:capstone_dicoding/pages/theme/theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:capstone_dicoding/pages/widget/cardillegal.dart';
import 'package:capstone_dicoding/pages/widget/cardlegal.dart';
import 'package:capstone_dicoding/pages/widget/cardloadinghome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ModelDataLegal>> _legal;
  Future<List<ModelDataIllegal>> _illegal;

  @override
  void initState() {
    _legal = LegalRepository().getLegal();
    _illegal = IllegalRepository().getIllegal();
    super.initState();
  }

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
                    height: responsiveHeight(40),
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
                    ),
                  ),
                ],
              ),
              Container(
                width: responsiveWidth(375),
                margin: const EdgeInsets.only(top: 162),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: simpleGrey),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: responsiveHeight(70),
                    ),
                    Text(
                      'Show Legal Investment Institutions',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: responsiveHeight(10),
                    ),
                    _cardLegal(0),
                    _cardLegal(2),
                    _cardLegal(3),
                    SizedBox(
                      height: responsiveHeight(25),
                    ),
                    Text(
                      'Show Ilegal Investment Institutions',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: responsiveHeight(10),
                    ),
                    _cardIllegal(0),
                    _cardIllegal(1),
                    _cardIllegal(2),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: responsiveHeight(112),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
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
                            width: responsiveWidth(120),
                            height: responsiveHeight(95),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    offset: const Offset(0, 4.0),
                                    blurRadius: 4,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                const Spacer(),
                                SvgPicture.asset(
                                  "assets/img/svg_legal.svg",
                                  height: 50,
                                  width: 50,
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
                            width: responsiveWidth(120),
                            height: responsiveHeight(95),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade600,
                                    offset: const Offset(0, 4.0),
                                    blurRadius: 4,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                const Spacer(),
                                SvgPicture.asset(
                                  "assets/img/svg_ilegal.svg",
                                  height: 50,
                                  width: 50,
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
                  ),
                ],
              ),
            ],
          );
        },
      )),
    );
  }

  Widget _cardLegal(int angka) {
    return FutureBuilder(
      future: _legal,
      builder: (context, AsyncSnapshot<List<ModelDataLegal>> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return CardLoadingHome();
        } else {
          if (snapshot.hasData) {
            var legal = snapshot.data[angka];
            return CardLegal(
              legal: legal,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        }
      },
    );
  }

  Widget _cardIllegal(int angka) {
    return FutureBuilder(
      future: _illegal,
      builder: (context, AsyncSnapshot<List<ModelDataIllegal>> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return CardLoadingHome();
        } else {
          if (snapshot.hasData) {
            var illegal = snapshot.data[angka];
            return CardIllegal(
              illegal: illegal,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        }
      },
    );
  }
}
