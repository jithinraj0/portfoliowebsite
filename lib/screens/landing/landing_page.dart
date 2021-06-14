import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/landing/middle/middle_page.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/images.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';

import 'footer/components/socialicons_widget.dart';
import 'footer/footer_page.dart';
import 'header/header_page.dart';
import 'home/components/scrollnow_widget.dart';
import 'home/home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ScrollController _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ResponsiveHelper(
        desktop: Stack(
          children: [
            Positioned(
              top: -0.3 * offset,
              left: 0,
              right: 0,
              height: screenHeight,
              child: Container(
                color: kPrimaryColor,
              ),
            ),
            Positioned(
              top: 0.2 * screenHeight,
              left: kdefaultPadding * 5,
              right: kdefaultPadding * 5,
              child: DesktopHome(textStyle: textStyle),
            ),
            Positioned(
                top: 0.9 * screenHeight,
                left: screenWidth / 2,
                child: Image.asset(
                  Images.mousescroll,
                  height: 25,
                  width: 25,
                )),
            Header(
                height: screenHeight, width: screenWidth, textStyle: textStyle),
               /* Positioned(
              
              right: 15,
              bottom: 70,
              child: SocialIconsVertical()), */
            Positioned(
              top: screenHeight * 0.8 - 1 * offset,
              left: 0,
              right: 0,
              height: screenHeight * 0.2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 1],
                    colors: [kPrimaryColor.withOpacity(0), kPrimaryColor],
                  ),
                ),
              ),
            ),
            Scrollbar(
              isAlwaysShown: true,
              //showTrackOnHover: true,
              controller: _scrollController,
              child: ListView(
                cacheExtent: 64,
                controller: _scrollController,
                children: <Widget>[
                  Container(height: screenHeight),
                  Container(
                    height: 100,
                    color: kPrimaryColor,
                  ),
                  Container(
                    color: kPrimaryColor,
                    child: Project(
                        height: screenHeight,
                        width: screenWidth,
                        textStyle: textStyle),
                  ),
                  Footer(
                      height: screenHeight,
                      width: screenWidth,
                      textStyle: textStyle),
                  //Page3(),
                  /* Container(
                    height: 100,
                    color: kPrimaryColor,
                  ), */
                ],
              ),
            ),
          ],
        ),
        mobile: Container(
          color: kPrimaryColor,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              /* mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, */
              children: [
                Header(
                    height: screenHeight,
                    width: screenWidth,
                    textStyle: textStyle),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kdefaultPadding),
                  child: MobileHome(textStyle: textStyle),
                ),
                MobileMiddleSection(
                    width: screenWidth,
                    textStyle: textStyle,
                    height: screenHeight),
                    MobileFooter(textStyle: textStyle)
               /*  Footer(
                    height: screenHeight,
                    width: screenWidth,
                    textStyle: textStyle), */
              ],
            ),
          ),
        ),
        tab: Container(
          color: kPrimaryColor,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              /* mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, */
              children: [
                Header(
                    height: screenHeight,
                    width: screenWidth,
                    textStyle: textStyle),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kdefaultPadding),
                  child: MobileHome(textStyle: textStyle),
                ),
                MobileMiddleSection(
                    width: screenWidth,
                    textStyle: textStyle,
                    height: screenHeight),
                    MobileFooter(textStyle: textStyle)
               /*  Footer(
                    height: screenHeight,
                    width: screenWidth,
                    textStyle: textStyle), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
