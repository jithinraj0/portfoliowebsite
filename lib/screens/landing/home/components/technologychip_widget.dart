import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';

class TechnologyChip extends StatelessWidget {
  const TechnologyChip({
    Key key,
    @required this.textStyle,
    @required this.tech,
  }) : super(key: key);

  final TextTheme textStyle;
  final String tech;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      // margin: EdgeInsets.all(kdefaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kdefaultPadding, vertical: kdefaultPadding * .5),
      child: Center(
        child: Text(
          tech,
          style: textStyle.headline1.copyWith(
            fontSize: 16,
            color: Colors.white70,
            letterSpacing: .5,
          ),
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: kOrangeColor),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
