import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/pages/details/detailscreen.dart';
import 'package:capstone_dicoding/pages/onboarding/slider.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int _currentPages = 0;
  PageController _controller = PageController();
  List<Widget> pages = [
    SliderPage(
      title: "Lorem Ipsum",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam sed ipsum ornare",
      imageAsset: "assets/img/onboard1.png",
    ),
    SliderPage(
      title: "Lorem Ipsum",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam sed ipsum ornare",
      imageAsset: "assets/img/onboard2.png",
    ),
    SliderPage(
      title: "Lorem Ipsum",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam sed ipsum ornare",
      imageAsset: "assets/img/onboard3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: responsiveHeight(50),
              ),
              Center(
                child: Text(
                  "INLINE",
                  style: TextStyle(
                      color: Color(0xFFB983FF),
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          PageView.builder(
            itemBuilder: (context, int index) => pages[index],
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                _currentPages = index;
              });
            },
            itemCount: pages.length,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: responsiveHeight(650),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(pages.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: responsiveHeight(10),
                    width: (index == _currentPages)
                        ? responsiveWidth(30)
                        : responsiveWidth(10),
                    margin: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(5),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPages)
                          ? Color(0xFFB983FF)
                          : Color(0xFFC4C4C4),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: responsiveHeight(50),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(25),
                ),
                child: (_currentPages == (pages.length - 1))
                    ? InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen();
                          }));
                        },
                        child: Hero(
                          tag: "btn",
                          child: Container(
                              height: responsiveHeight(45),
                              width: responsiveWidth(200),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFB983FF),
                              ),
                              child: Center(
                                child: Text(
                                  "Lets Get Started",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _controller.animateToPage(2,
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.easeInOutQuint);
                            },
                            child: Container(
                              height: responsiveHeight(45),
                              width: responsiveWidth(120),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0xFFB983FF),
                                  )),
                              child: Center(
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFB983FF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeInOutQuint);
                            },
                            child: Hero(
                              tag: "btn",
                              transitionOnUserGestures: true,
                              child: Container(
                                height: responsiveHeight(45),
                                width: responsiveWidth(120),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFB983FF),
                                ),
                                child: Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
