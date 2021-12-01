import 'package:flutter/material.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenHeigth;
  static double screenWidth;
  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenHeigth = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
  }
}

double responsiveHeight(double inputHeight){
  double screenHeight = SizeConfig.screenHeigth;
  // 812.0 adalah height yang digunakan pada UI Design
  return (inputHeight / 812.0) * screenHeight;
}

double responsiveWidth(double inputWidth){
  double screenWidth = SizeConfig.screenWidth;
  // 375.0 adalah width yang digunakan pada UI Design
  return (inputWidth / 375.0) * screenWidth;
}