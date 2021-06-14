import 'package:flutter/material.dart';
import 'package:portfolio_website/model/skill_model.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/images.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';
import 'package:portfolio_website/utils/strings.dart';

import 'components/technologychip_widget.dart';

class Home extends StatelessWidget {


  final TextTheme textStyle;

  final double height;
  final double width;

  const Home({Key key, this.textStyle, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: height,
      width:width,
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.isDesktop(context)?
             kdefaultPadding * 5:
             kdefaultPadding,
              vertical:ResponsiveHelper.isDesktop(context)?
             kdefaultPadding * 3.5:
             kdefaultPadding),
        child: ResponsiveHelper.isDesktop(context)
            ? DesktopHome(textStyle: textStyle)
            : MobileHome(textStyle: textStyle));
  }
}

class DesktopHome extends StatelessWidget {
  const DesktopHome({
    Key key,
    @required this.textStyle,
  }) : super(key: key);

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.hi,
                style: textStyle.headline2.copyWith(
                  fontSize: 25,
                  color: Colors.white54,
                  // letterSpacing: .5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                Strings.name,
                style: textStyle.headline1.copyWith(
                  fontSize: 60,
                ),
              ),
              SizedBox(height: 10),
              Text(
                Strings.role1,
                style: textStyle.headline1.copyWith(
                  fontSize: 25,
                  color: Colors.white70,
                  //letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                Strings.role2,
                style: textStyle.headline1.copyWith(
                  fontSize: 25,
                  color: Colors.white70,
                  //letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                Strings.about1,
                style: textStyle.caption.copyWith(
                  //letterSpacing: .5,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 600,
                child: Wrap(
                  spacing: kdefaultPadding,
                  runSpacing: kdefaultPadding,
                  children: [
                    for(int i=0;i<skillSet.length;i++)
                    TechnologyChip(
                      textStyle: textStyle,
                      tech: skillSet[i].skill,
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: 30),
             
            ],
          ),
        ),
        Expanded(
                  child: Image.asset(
            Images.profilepic1,
            height: 400,
          ),
        ),
      ],
    );
  }
}

class MobileHome extends StatelessWidget {
  const MobileHome({
    Key key,
    @required this.textStyle,
  }) : super(key: key);

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          Images.profilepic1,
          height: 300,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.hi,
              style: textStyle.headline2.copyWith(
                fontSize: 25,
                color: Colors.white54,
                // letterSpacing: .5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              Strings.name,
              style: textStyle.headline1.copyWith(
                fontSize: 60,
              ),
            ),
            SizedBox(height: 10),
            Text(
              Strings.role1,
              style: textStyle.headline1.copyWith(
                fontSize: 25,
                color: Colors.white70,
                //letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              Strings.role2,
              style: textStyle.headline1.copyWith(
                fontSize: 25,
                color: Colors.white70,
                //letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 20),
            Text(
              Strings.about1,
              style: textStyle.caption.copyWith(
                //letterSpacing: .5,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 600,
              child: Wrap(
                spacing: kdefaultPadding,
                runSpacing: kdefaultPadding,
                children: [
                  for(int i=0;i<skillSet.length;i++)
                    TechnologyChip(
                      textStyle: textStyle,
                      tech: skillSet[i].skill,
                    ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
        
      ],
    );
  }
}
