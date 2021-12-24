import 'package:capstone_dicoding/backend/api_legal.dart';
import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/model/model_legal.dart';
import 'package:capstone_dicoding/pages/theme/theme.dart';
import 'package:capstone_dicoding/pages/widget/cardlegal.dart';
import 'package:capstone_dicoding/pages/widget/cardloading.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LegalScreen extends StatefulWidget {
  @override
  _LegalScreenState createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  Future<List<ModelDataLegal>> _legal;

  @override
  void initState() {
    _legal = LegalRepository().getLegal();
    super.initState();
  }

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
    return FutureBuilder(
      future: _legal,
      builder: (context, AsyncSnapshot<List<ModelDataLegal>> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return CardLoading();
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.only(
                top: responsiveHeight(75),
              ),
              controller: sc,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var legal = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: CardLegal(
                    legal: legal,
                  ),
                );
              },
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
