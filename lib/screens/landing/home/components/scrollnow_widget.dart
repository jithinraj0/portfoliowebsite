/* import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';

class ScrollNow extends StatefulWidget {
  @override
  _ScrollNowState createState() => _ScrollNowState();
}

class _ScrollNowState extends State<ScrollNow> with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0, end: 1);

    @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return  Opacity(
          child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: kSecondaryColor,),
          opacity: _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
        );
      }
     

}
 */