import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:capstone_dicoding/mediaquery/sizeconfig.dart';
import 'package:capstone_dicoding/pages/home/home.dart';
import 'package:capstone_dicoding/pages/onboarding/slider.dart';
import 'package:capstone_dicoding/pages/theme/theme.dart';
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
      title: "Let's Invest",
      description:
          "Start investing now to get a lot of benefits, which are must-haves if you want to be successful in your financial life.",
      imageAsset: "assets/img/onboard2.png",
    ),
    SliderPage(
      title: "Great Analytics",
      description:
          "Help investors find investment provider institutions that have obtained operational permits from the Financial Services Authority (OJK)",
      imageAsset: "assets/img/onboard1.png",
    ),
    SliderPage(
      title: "Security Guarantee",
      description:
          "Don't just choose an investment provider, make sure your investment is guaranteed safe with a legal investment provider",
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
                  child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'INLINE',
                    textStyle: TextStyle(
                      fontSize: 32.0,
                      color: purple,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 1000),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )),
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
                      color: (index == _currentPages) ? purple : grey,
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
                            return HomeScreen();
                          }));
                        },
                        child: Hero(
                          tag: "btn",
                          child: Container(
                              height: responsiveHeight(45),
                              width: responsiveWidth(200),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: purple,
                              ),
                              child: Center(
                                child: Text(
                                  "Lets Get Started",
                                  style: TextStyle(
                                    color: white,
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
                                    color: purple,
                                  )),
                              child: Center(
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: purple,
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
                                  color: purple,
                                ),
                                child: Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: white,
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
