import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper(
      desktop: Container(
        child: Text('hello')
      ),
      
    );
  }
}