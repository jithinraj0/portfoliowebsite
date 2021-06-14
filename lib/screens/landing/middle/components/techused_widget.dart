import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';

class TechUsedWidget extends StatelessWidget {
  const TechUsedWidget({
    Key key,
    @required this.height,
    @required this.width,
    @required this.textStyle,
    @required this.iconWidget,
    @required this.techName,
  }) : super(key: key);
  final double height;
  final double width;
  final TextTheme textStyle;
  final Widget iconWidget;
  final String techName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        iconWidget,
        SizedBox(width: kdefaultPadding * .5),
        Text(
          techName,
          style: textStyle.caption.copyWith(
              color: ResponsiveHelper.isDesktop(context)
                  ? kPrimaryColor
                  : kSecondaryColor,
              fontSize: height * 0.026),
        ),
      ],
    );
  }
}
