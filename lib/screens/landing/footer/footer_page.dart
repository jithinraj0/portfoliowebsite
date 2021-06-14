import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/landing/middle/components/heading_widget.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/responsive_helper.dart';
import 'package:portfolio_website/utils/styling.dart';
import 'package:portfolio_website/screens/landing/footer/components/socialicons_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/submit_quote.dart';

class Footer extends StatelessWidget {
  final TextTheme textStyle;
  final double _height;
  final double _width;

  Footer({
    Key key,
    @required double height,
    @required double width,
    @required this.textStyle,
  })  : _height = height,
        _width = width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: _height,
        width: _width,
        color: kPrimaryColor,
        child: ResponsiveHelper.isDesktop(context)
            ? DesktopFooter(textStyle: textStyle)
            : MobileFooter(textStyle: textStyle));
  }
}

class DesktopFooter extends StatelessWidget {
  final emailexp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var descriptionController = TextEditingController();
  DesktopFooter({
    Key key,
    @required this.textStyle,
  }) : super(key: key);
  final TextTheme textStyle;
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference quote = _firestore.collection('quotes');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: kdefaultPadding, left: kdefaultPadding * 5),
            child: PageHeading(
              textStyle: textStyle,
              heading: 'Got an exciting project ?',
              color: kSecondaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kdefaultPadding * 5, vertical: kdefaultPadding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nameController,
                    decoration: textfieldDecoration('Name', context),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter name !';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: kdefaultPadding),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    decoration: textfieldDecoration('Email', context),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter email !';
                      } else if (!emailexp.hasMatch(value)) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kdefaultPadding * 5, vertical: kdefaultPadding),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: descriptionController,
              maxLines: 8,
              style: textStyle.headline2
                  .copyWith(color: kPrimaryColor, fontSize: 15),
              decoration:
                  textfieldDecoration('Describe your thoughts...', context),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter description !';
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ButtonStyle(
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return textStyle.headline1.copyWith(
                          fontSize: 13,
                          color: kSecondaryColor,
                          letterSpacing: .5,
                        );
                      return textStyle.headline1.copyWith(
                        fontSize: 13,
                        color: kPrimaryColor,
                        letterSpacing: .5,
                      ); // Use the component's default.
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return kOrangeColor;
                      return kSecondaryColor; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    showSuccessDialog(context);
                    submitQuote(
                        quote: quote,
                        name: nameController.text.toString(),
                        email: emailController.text.toString(),
                        quotecontent: descriptionController.text.toString());
                    nameController.clear();
                    emailController.clear();
                    descriptionController.clear();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Lets\'s talk',
                      style: textStyle.headline1.copyWith(
                        fontSize: 13,
                        color: kPrimaryColor,
                        letterSpacing: .5,
                      )),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kdefaultPadding * 2),
            child: Align(
              alignment: Alignment.center,
              child: PageHeading(
                textStyle: textStyle,
                heading: 'Contact',
                color: kSecondaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kdefaultPadding * 1.2),
            child: Align(
              alignment: Alignment.center,
              child: Text('+91 9567760406',
                  style: textStyle.headline2.copyWith(fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kdefaultPadding * 1.2),
            child: Align(
              alignment: Alignment.center,
              child: Text('jithin6904@gmail.com',
                  style: textStyle.headline2.copyWith(fontSize: 15)),
            ),
          ),
          SocialIcons(),
          Padding(
            padding: const EdgeInsets.only(top: kdefaultPadding * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Made with Flutter',
                    style: textStyle.caption.copyWith(fontSize: 15)),
                SizedBox(width: kdefaultPadding * .5),
                Icon(Icons.favorite_rounded, color: Colors.red[900]),
                SizedBox(width: kdefaultPadding * .5),
                Text('by Jithin Raj',
                    style: textStyle.caption.copyWith(fontSize: 15)),
                SizedBox(width: kdefaultPadding / 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileFooter extends StatelessWidget {
  MobileFooter({
    Key key,
    @required this.textStyle,
  }) : super(key: key);

  final TextTheme textStyle;
  final emailexp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference quote = _firestore.collection('quotes');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: kdefaultPadding, left: kdefaultPadding),
            child: PageHeading(
              textStyle: textStyle,
              heading: 'Got an exciting project ?',
              color: kSecondaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kdefaultPadding, vertical: kdefaultPadding),
            child: Column(
              children: [
                TextFormField(
                  decoration: textfieldDecoration('Name', context),
                ),
                SizedBox(height: kdefaultPadding),
                TextFormField(
                  decoration: textfieldDecoration('Email', context),
                ),
                SizedBox(height: kdefaultPadding),
                TextFormField(
                  maxLines: 6,
                  style: textStyle.headline2
                      .copyWith(color: kPrimaryColor, fontSize: 15),
                  decoration:
                      textfieldDecoration('Describe your thoughts...', context),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ButtonStyle(
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return textStyle.headline1.copyWith(
                          fontSize: 13,
                          color: kSecondaryColor,
                          letterSpacing: .5,
                        );
                      return textStyle.headline1.copyWith(
                        fontSize: 13,
                        color: kPrimaryColor,
                        letterSpacing: .5,
                      ); // Use the component's default.
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return kOrangeColor;
                      return kSecondaryColor; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    showSuccessDialog(context);
                    submitQuote(
                        quote: quote,
                        name: nameController.text.toString(),
                        email: emailController.text.toString(),
                        quotecontent: descriptionController.text.toString());
                    nameController.clear();
                    emailController.clear();
                    descriptionController.clear();
                  } 
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Lets\'s talk',
                      style: textStyle.headline1.copyWith(
                        fontSize: 13,
                        color: kPrimaryColor,
                        letterSpacing: .5,
                      )),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kdefaultPadding),
            child: Align(
              alignment: Alignment.center,
              child: PageHeading(
                textStyle: textStyle,
                heading: 'Contact',
                color: kSecondaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kdefaultPadding),
            child: Align(
              alignment: Alignment.center,
              child: Text('+91 9567760406',
                  style: textStyle.headline2.copyWith(fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kdefaultPadding),
            child: Align(
              alignment: Alignment.center,
              child: Text('jithin6904@gmail.com',
                  style: textStyle.headline2.copyWith(fontSize: 15)),
            ),
          ),
          SocialIcons(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: kdefaultPadding, bottom: kdefaultPadding * .5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Made with Flutter',
                      style: textStyle.caption.copyWith(fontSize: 15)),
                  SizedBox(width: kdefaultPadding * .5),
                  Icon(Icons.favorite_rounded, color: Colors.red[900]),
                  SizedBox(width: kdefaultPadding * .5),
                  Text('by Jithin Raj',
                      style: textStyle.caption.copyWith(fontSize: 15)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
