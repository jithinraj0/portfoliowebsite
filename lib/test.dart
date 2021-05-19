import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/utils/colors.dart';

import 'utils/images.dart';
import 'utils/strings.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    debugPrint('height' + height.toString());
    debugPrint('width' + width.toString());
    return Material(
        child: Stack(
      children: [
        Container(
          color: kPrimaryColor,
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                child: Image.asset(
                  Images.logo,
                  height: height * 0.06,
                  width: width * 0.045,
                ),
              ), Positioned(
                right: 50,
                child: Image.asset(
                      Images.profilepic1,
                      height: 350,
                    ),
              ),
               Positioned(
                left: 20,
                child: Image.asset(
                  Images.logo,
                  height: height * 0.06,
                  width: width * 0.045,
                ),
              ),
              Positioned(
                left: 100,
                top: 130,
                child: /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.hi,
                          style: textStyle.headline2.copyWith(
                            fontSize: 18,
                            color: Colors.white54,
                            letterSpacing: .5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          Strings.name,
                          style: textStyle.headline1.copyWith(
                            fontSize: 50,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          Strings.role1,
                          style: textStyle.headline1.copyWith(
                            fontSize: 18,
                            color: Colors.white70,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          Strings.role2,
                          style: textStyle.headline1.copyWith(
                            fontSize: 18,
                            color: Colors.white70,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          Strings.about,
                          style: textStyle.caption,
                        ),
                     /*  ],
                    ), */
                   
                  ],
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height,
              ),
              Container(
                color: kLightGreyColor,
                height: height,
                width: width,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
