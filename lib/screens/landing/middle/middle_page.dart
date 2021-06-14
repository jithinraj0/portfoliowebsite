import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/screens/landing/middle/components/projectcard_widget.dart';
import 'package:portfolio_website/screens/landing/middle/components/heading_widget.dart';
import 'package:portfolio_website/model/projects_model.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';

class Project extends StatefulWidget {
  final double _height;
  final double _width;
  final TextTheme textStyle;

  Project({
    Key key,
    @required double height,
    @required double width,
    @required this.textStyle,
  })  : _height = height,
        _width = width,
        super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  final CarouselController buttonCarouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      height: widget._height,
      width: widget._width,
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: kdefaultPadding,
                      left: ResponsiveHelper.isDesktop(context)
                          ? kdefaultPadding * 5
                          : kdefaultPadding),
                  child: PageHeading(
                    textStyle: widget.textStyle,
                    heading: 'Recent Projects',
                    color: kSecondaryColor,
                  ),
                ),
                Flexible(
                                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.isDesktop(context)
                            ? kdefaultPadding * 5
                            : kdefaultPadding,
                        vertical: ResponsiveHelper.isDesktop(context)
                            ? kdefaultPadding * 1
                            : 2),
                    child: CarouselSlider.builder(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          onScrolled: (index) {
                            setState(() {
                              currentIndex = int.parse(index.toString());
                            });
                          },
                          autoPlay: false,
                          viewportFraction: 1,
                          height: ResponsiveHelper.isDesktop(context)
                              ? widget._height * 0.82
                              : widget._height * 0.92),
                      itemCount: projectList.length,
                      itemBuilder: (BuildContext context, int index, int oindex) {
                      
                           if (index % 2 == 0) {
                          return SingleProjectCard(
                            height: widget._height,
                            width: widget._width,
                            projectsModel: projectList[index],
                            textStyle: widget.textStyle,
                          );
                        } else {
                          return SingleProjectCardInverted(
                            height: widget._height,
                            width: widget._width,
                            projectsModel: projectList[index],
                            textStyle: widget.textStyle,
                          );
                        }
                        
                       
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: widget._height * .5,
            left: ResponsiveHelper.isDesktop(context) ? 30 : -1,
            child: RotatedBox(
                quarterTurns: 1,
                child: currentIndex == 0
                    ? IconButton(
                        onPressed: null,
                        icon: ResponsiveHelper.isDesktop(context)
                            ? Icon(Icons.arrow_drop_down_circle,
                                color: Colors.grey, size: 35)
                            : Icon(Icons.arrow_drop_down,
                                color: Colors.grey, size: 35),
                      )
                    : IconButton(
                        onPressed: () {
                          buttonCarouselController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: ResponsiveHelper.isDesktop(context)
                            ? Icon(Icons.arrow_drop_down_circle,
                                color: kOrangeColor, size: 35)
                            : Icon(Icons.arrow_drop_down,
                                color: kOrangeColor, size: 35),
                      )),
          ),
          Positioned(
            top: widget._height * .5,
            right: ResponsiveHelper.isDesktop(context) ? 30 : -1,
            child: RotatedBox(
                quarterTurns: 3,
                child: currentIndex == projectList.length - 1
                    ? IconButton(
                        onPressed: null,
                        icon:ResponsiveHelper.isDesktop(context)
                            ?  Icon(Icons.arrow_drop_down_circle,
                            color: Colors.grey, size: 35)
                              : Icon(Icons.arrow_drop_down,
                                color: Colors.grey, size: 35),
                      )
                    : IconButton(
                        onPressed: () {
                          buttonCarouselController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        icon: ResponsiveHelper.isDesktop(context)
                            ? Icon(Icons.arrow_drop_down_circle,
                            color: kOrangeColor, size: 35)
                            : Icon(Icons.arrow_drop_down,
                              color: kOrangeColor, size: 35)
                      )),
          ),
        ],
      ),
    );
  }
}


class MobileMiddleSection extends StatelessWidget {
  const MobileMiddleSection({
    Key key,
    @required double width,
    @required this.textStyle,
    @required double height,
  }) : _width = width, _height = height, super(key: key);

  final double _width;
  final TextTheme textStyle;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: _height,
      padding: EdgeInsets.symmetric(
          horizontal: kdefaultPadding, vertical: kdefaultPadding),
      width: _width,
      color: kPrimaryColor,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeading(
            textStyle: textStyle,
            heading: 'Recent Projects',
            color: kSecondaryColor,
          ),
          SizedBox(height: kdefaultPadding),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projectList.length,
            itemBuilder: (context, index) {
             
              return MobileProjectSection(
                  textStyle: textStyle, height: _height, width: _width,
                  projectsModel: projectList[index],);
            },
          )
        ],
      ),
    );
  }
}
