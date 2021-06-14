
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/landing/home/home_page.dart';
import 'package:portfolio_website/screens/landing/middle/middle_page.dart';
import 'package:portfolio_website/utils/colors.dart';

import 'screens/landing/footer/footer_page.dart';
import 'screens/landing/header/header_page.dart';
import 'utils/responsive_helper.dart';

class NewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
   
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          /* mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, */
          children: [
            Header(height: _height, width: _width, textStyle: textStyle),
            Home(
              textStyle: textStyle,
              height: _height,
              width: _width,
            ),
            ResponsiveHelper.isDesktop(context)
                ? Project(height: _height, width: _width, textStyle: textStyle)
                : MobileMiddleSection(
                    width: _width, textStyle: textStyle, height: _height),
            Footer(height: _height, width: _width, textStyle: textStyle),
          ],
        ),
      ),
    );
  }
}
