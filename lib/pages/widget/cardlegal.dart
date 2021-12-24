import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/model/model_legal.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardLegal extends StatelessWidget {
  final ModelDataLegal legal;
  CardLegal({this.legal});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () => _launchUrl(legal.link),
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
        child: Padding(
          padding: EdgeInsets.only(
            left: responsiveWidth(15),
            right: responsiveWidth(15),
            top: responsiveWidth(10),
            bottom: responsiveWidth(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      legal.pt,
                      maxLines: 1,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      legal.nama,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchUrl(String urlString) async {
  await canLaunch(urlString)
      ? await launch(urlString)
      : throw "Tidak dapat menjalankan $urlString";
}
