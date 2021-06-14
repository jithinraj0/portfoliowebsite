
import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  const PageHeading({
    Key key,
    @required this.textStyle,
    @required this.heading,
    @required this.color,
  }) : super(key: key);

  final TextTheme textStyle;
  final String heading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: textStyle.headline1.copyWith(
        fontSize: 20,
        color: color,
        letterSpacing: .5,
      ),
    );
  }
}
