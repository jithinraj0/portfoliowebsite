import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/images.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required double height,
    @required double width,
    @required this.textStyle,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:ResponsiveHelper.isDesktop(context)? kdefaultPadding * 1.5:kdefaultPadding),
      width: _width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Images.logo,
            fit: BoxFit.cover,
            height: ResponsiveHelper.isDesktop(context) ? _height * 0.07:_height*0.075,
            width:ResponsiveHelper.isDesktop(context) ? _width * 0.04:_width*0.115,
          ),
          // Spacer(),
         /*  Container(
            padding: EdgeInsets.all(kdefaultPadding),
            child: Row(
              children: [
                Text(
                  'Home',
                  style: textStyle.bodyText1.copyWith(color: Colors.white54),
                ),
                SizedBox(width: kdefaultPadding),
                Text(
                  'Projects',
                  style: textStyle.bodyText1.copyWith(color: Colors.white54),
                ),
                SizedBox(width: kdefaultPadding),
                Text(
                  'Contact',
                  style: textStyle.bodyText1.copyWith(color: Colors.white54),
                ),
              ],
            ),
          ), */
           SizedBox(width: kdefaultPadding),
        ],
      ),
    );
  }
}
