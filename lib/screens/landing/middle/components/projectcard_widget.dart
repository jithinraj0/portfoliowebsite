import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/model/projects_model.dart';
import 'package:portfolio_website/screens/landing/middle/components/techused_widget.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/images.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleProjectCard extends StatelessWidget {
  final ProjectsModel projectsModel;
  final TextTheme textStyle;
  final double height;
  final double width;

  const SingleProjectCard(
      {Key key, this.projectsModel, this.textStyle, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: ResponsiveHelper.isDesktop(context)
            ? EdgeInsets.all(kdefaultPadding)
            : EdgeInsets.symmetric(horizontal: 5),
        //margin: EdgeInsets.only(right: kdefaultPadding),

        height: ResponsiveHelper.isDesktop(context)
            ? height * .65
            : height * .9, //double.infinity,
        width: ResponsiveHelper.isDesktop(context) ? width * .95 : width * .90,
        /* double.infinity, */
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: DesktopCard(
            projectsModel: projectsModel,
            height: height,
            width: width,
            textStyle: textStyle
            /* ResponsiveHelper.isDesktop(context)
          ? 
             
          : MobileCard(
              projectsModel: projectsModel,
              height: height,
              width: width,
              textStyle: textStyle),*/
            ));
  }
}

class DesktopCard extends StatelessWidget {
  const DesktopCard({
    Key key,
    @required this.projectsModel,
    @required this.height,
    @required this.width,
    @required this.textStyle,
  }) : super(key: key);

  final ProjectsModel projectsModel;
  final double height;
  final double width;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    projectsModel.logo,
                    height: height * 0.11,
                    width: width * 0.058,
                  ),
                  Text(
                    projectsModel.name,
                    style: textStyle.headline2.copyWith(
                        color: kPrimaryColor, fontSize: height * 0.029),
                  ),
                ],
              ),
              Text(
                projectsModel.description,
                style: textStyle.caption.copyWith(
                  color: kPrimaryColor,
                  fontSize: height * 0.026,
                  height: height * 0.0019,
                ),
              ),
              SizedBox(height: kdefaultPadding * .5),
              Text(
                'Technologies used :',
                style: textStyle.caption.copyWith(
                    color: kPrimaryColor,
                    fontSize: height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: kdefaultPadding * .5),
              Wrap(
                direction: Axis.vertical,
                spacing: kdefaultPadding * .5,
                runSpacing: kdefaultPadding * .5,
                children: [
                  for (int i = 0; i < projectsModel.technologylist.length; i++)
                    TechUsedWidget(
                      height: height,
                      width: width,
                      textStyle: textStyle,
                      iconWidget: Image.asset(
                        projectsModel.technologylist[i].techlogo,
                        // Images.wordpresslogo,
                        height: height * 0.026,
                        width: height * 0.026,
                      ),
                      techName: projectsModel.technologylist[i].techname,
                    ),
                ],
              ),
              projectsModel.isplaystore == true
                  ? Tooltip(
                      message: projectsModel.storelink,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launchPlayStore(projectsModel.storelink),
                          child: Image.asset(
                            Images.playstore,
                            height: height * 0.09,
                            width: width * 6,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        SizedBox(width: kdefaultPadding * .5),
        Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                projectsModel.image,
                fit: BoxFit.cover,
              ),
            ))
      ],
    );
  }

  launchPlayStore(String storelink) async {
    var url = storelink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

/* 
class MobileCard extends StatelessWidget {
  const MobileCard({
    Key key,
    @required this.projectsModel,
    @required this.height,
    @required this.width,
    @required this.textStyle,
  }) : super(key: key);

  final ProjectsModel projectsModel;
  final double height;
  final double width;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Image.asset(
                      projectsModel.logo,
                      height: height * 0.11,
                      width: width * 0.058,
                    ),
                    Text(
                      projectsModel.name,
                      style: textStyle.headline2.copyWith(
                          color: kPrimaryColor, fontSize: height * 0.026),
                    ),
                  ],
                ),
              ),
              Text(
                projectsModel.description,
                style: textStyle.caption.copyWith(
                  color: kPrimaryColor,
                  fontSize: height * 0.020,
                  height: height * 0.0019,
                ),
              ),
              //SizedBox(height: kdefaultPadding * .2),
              Text(
                'Technologies used :',
                style: textStyle.caption.copyWith(
                    color: kPrimaryColor,
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: kdefaultPadding * .3),
              Wrap(
                spacing: kdefaultPadding,
                runSpacing: kdefaultPadding * .5,
                children: [
                  TechUsedWidget(
                    height: height,
                    width: width,
                    textStyle: textStyle,
                    iconWidget: FlutterLogo(
                      size: height * 0.026,
                    ),
                    techName: 'Flutter',
                  ),

                  TechUsedWidget(
                    height: height,
                    width: width,
                    textStyle: textStyle,
                    iconWidget: Image.asset(
                      Images.wordpresslogo,
                      height: height * 0.026,
                      width: height * 0.026,
                    ),
                    techName: 'Wordpress',
                  ),

                  //  SizedBox(height: kdefaultPadding * .2),
                  TechUsedWidget(
                    height: height,
                    width: width,
                    textStyle: textStyle,
                    iconWidget: Image.asset(
                      Images.figmalogo,
                      height: height * 0.026,
                      width: height * 0.026,
                    ),
                    techName: 'Figma',
                  ),
                  //SizedBox(height: kdefaultPadding),
                  Image.asset(
                    Images.playstore,
                    height: height * 0.05,
                    width: width * 3,
                  ),
                ],
              ),
              // SizedBox(height: kdefaultPadding * .2),
            ],
          ),
        ),
        SizedBox(height: kdefaultPadding * .3),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              projectsModel.image,
              fit: BoxFit.cover,
              height: height * 0.43,
              width: width * 0.85,
            ),
          ),
        )
      ],
    );
  }
}

 */

class SingleProjectCardInverted extends StatelessWidget {
  final ProjectsModel projectsModel;
  final TextTheme textStyle;
  final double height;
  final double width;

  const SingleProjectCardInverted(
      {Key key, this.projectsModel, this.textStyle, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: ResponsiveHelper.isDesktop(context)
            ? EdgeInsets.all(kdefaultPadding)
            : EdgeInsets.symmetric(horizontal: 5),
        //margin: EdgeInsets.only(right: kdefaultPadding),

        height: ResponsiveHelper.isDesktop(context)
            ? height * .65
            : height * .9, //double.infinity,
        width: ResponsiveHelper.isDesktop(context) ? width * .95 : width * .90,
        /* double.infinity, */
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: DesktopCardInverted(
            projectsModel: projectsModel,
            height: height,
            width: width,
            textStyle: textStyle));
  }
}

class DesktopCardInverted extends StatelessWidget {
  const DesktopCardInverted({
    Key key,
    @required this.projectsModel,
    @required this.height,
    @required this.width,
    @required this.textStyle,
  }) : super(key: key);

  final ProjectsModel projectsModel;
  final double height;
  final double width;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                projectsModel.image,
                fit: BoxFit.cover,
              ),
            )),
        SizedBox(width: kdefaultPadding * .5),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    projectsModel.logo,
                    height: height * 0.11,
                    width: width * 0.058,
                  ),
                  Text(
                    projectsModel.name,
                    style: textStyle.headline2.copyWith(
                        color: kPrimaryColor, fontSize: height * 0.029),
                  ),
                ],
              ),
              Text(
                projectsModel.description,
                style: textStyle.caption.copyWith(
                  color: kPrimaryColor,
                  fontSize: height * 0.026,
                  height: height * 0.0019,
                ),
              ),
              SizedBox(height: kdefaultPadding * .5),
              Text(
                'Technologies used :',
                style: textStyle.caption.copyWith(
                    color: kPrimaryColor,
                    fontSize: height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: kdefaultPadding * .5),
              Wrap(
                direction: Axis.vertical,
                spacing: kdefaultPadding * .5,
                runSpacing: kdefaultPadding * .5,
                children: [
                  for (int i = 0; i < projectsModel.technologylist.length; i++)
                    TechUsedWidget(
                      height: height,
                      width: width,
                      textStyle: textStyle,
                      iconWidget: Image.asset(
                        projectsModel.technologylist[i].techlogo,
                        // Images.wordpresslogo,
                        height: height * 0.026,
                        width: height * 0.026,
                      ),
                      techName: projectsModel.technologylist[i].techname,
                    ),
                ],
              ),
              projectsModel.isplaystore == true
                  ? Tooltip(
                      message: projectsModel.storelink,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launchPlayStore(projectsModel.storelink),
                          child: Image.asset(
                            Images.playstore,
                            height: height * 0.09,
                            width: width * 6,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }

  launchPlayStore(String storelink) async {
    var url = storelink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

/* 
class MobileCardInverted extends StatelessWidget {
  const MobileCardInverted({
    Key key,
    @required this.projectsModel,
    @required this.height,
    @required this.width,
    @required this.textStyle,
  }) : super(key: key);

  final ProjectsModel projectsModel;
  final double height;
  final double width;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              projectsModel.image,
              fit: BoxFit.cover,
              height: height * 0.43,
              width: width * 0.85,
            ),
          ),
        ),
        SizedBox(height: kdefaultPadding * .3),
        Flexible(
          flex: 1,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Image.asset(
                      projectsModel.logo,
                      height: height * 0.11,
                      width: width * 0.058,
                    ),
                    Text(
                      projectsModel.name,
                      style: textStyle.headline2.copyWith(
                          color: kPrimaryColor, fontSize: height * 0.026),
                    ),
                  ],
                ),
              ),
              Text(
                projectsModel.description,
                style: textStyle.caption.copyWith(
                  color: kPrimaryColor,
                  fontSize: height * 0.020,
                  height: height * 0.0019,
                ),
              ),
              //SizedBox(height: kdefaultPadding * .2),
              Text(
                'Technologies used :',
                style: textStyle.caption.copyWith(
                    color: kPrimaryColor,
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: kdefaultPadding * .3),
              Wrap(
                spacing: kdefaultPadding,
                runSpacing: kdefaultPadding * .5,
                children: [
                  TechUsedWidget(
                    height: height,
                    width: width,
                    textStyle: textStyle,
                    iconWidget: FlutterLogo(
                      size: height * 0.026,
                    ),
                    techName: 'Flutter',
                  ),

                  TechUsedWidget(
                    height: height,
                    width: width,
                    textStyle: textStyle,
                    iconWidget: Image.asset(
                      Images.wordpresslogo,
                      height: height * 0.026,
                      width: height * 0.026,
                    ),
                    techName: 'Wordpress',
                  ),

                  //  SizedBox(height: kdefaultPadding * .2),
                  TechUsedWidget(
                    height: height,
                    width: width,
                    textStyle: textStyle,
                    iconWidget: Image.asset(
                      Images.figmalogo,
                      height: height * 0.026,
                      width: height * 0.026,
                    ),
                    techName: 'Figma',
                  ),
                  //SizedBox(height: kdefaultPadding),
                  Image.asset(
                    Images.playstore,
                    height: height * 0.05,
                    width: width * 3,
                  ),
                ],
              ),
              // SizedBox(height: kdefaultPadding * .2),
            ],
          ),
        ),
      ],
    );
  }
} */

class MobileProjectSection extends StatelessWidget {
  final TextTheme textStyle;
  final double height;
  final double width;
  final ProjectsModel projectsModel;

  const MobileProjectSection(
      {Key key, this.textStyle, this.height, this.width, this.projectsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            projectsModel.image,
            //Images.ecreditsmockup,
            height: 250,
            width: double.infinity,
          ),
        ),
        SizedBox(height: kdefaultPadding),
        Row(
          children: [
            Image.asset(
              projectsModel.logo,
              //Images.ecreditslogo,
              fit: BoxFit.fill,
              height: 50 /* _height * 0.25 */,
              width: 50 /* _width * 0.25 */,
            ),
            Text(
              projectsModel.name,
              style: textStyle.headline2
                  .copyWith(color: kSecondaryColor, fontSize: height * 0.026),
            ),
          ],
        ),
        SizedBox(height: kdefaultPadding),
        Text(
          projectsModel.description,
          // Strings.ecreditsdescription,
          style: textStyle.caption.copyWith(
            color: kSecondaryColor,
            fontSize: 16 /* _height * 0.020 */,
            height: 1.5 /* _height * 0.0019 */,
          ),
        ),
        SizedBox(height: kdefaultPadding),
        Text(
          'Technologies used :',
          style: textStyle.caption.copyWith(
              color: kSecondaryColor,
              fontSize: height * 0.026,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: kdefaultPadding),
        Wrap(
          spacing: kdefaultPadding * .5,
          runSpacing: kdefaultPadding * .5,
          children: [
            for (int i = 0; i < projectsModel.technologylist.length; i++)
              TechUsedWidget(
                height: height,
                width: width,
                textStyle: textStyle,
                iconWidget: Image.asset(
                  projectsModel.technologylist[i].techlogo,
                  // Images.wordpresslogo,
                  height: height * 0.026,
                  width: height * 0.026,
                ),
                techName: projectsModel.technologylist[i].techname,
              ),
            projectsModel.isplaystore == true
                ? Tooltip(
                    message: projectsModel.storelink,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => launchPlayStore(projectsModel.storelink),
                        child: Image.asset(
                          Images.playstore,
                          height: height * 0.09,
                          width: width * 6,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(height: kdefaultPadding),
      ],
    );
  }

  launchPlayStore(String storelink) async {
    var url = storelink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
