import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/utils/colors.dart';

var font = GoogleFonts.montserrat;
//var font2 = GoogleFonts.playl;

TextTheme textTheme() {
  return TextTheme(
    
    headline1: font(color: Colors.white, fontWeight: FontWeight.w500),
    headline2: font(color: Colors.white, fontWeight: FontWeight.w300),
    caption: font(color: Colors.white, fontWeight: FontWeight.w200),
  );
}

InputDecoration textfieldDecoration(String label, BuildContext context) =>
    InputDecoration(filled: true,
        errorStyle: Theme.of(context).textTheme.caption.copyWith(color: Colors.red,fontSize: 15),
        fillColor: kSecondaryColor,
        labelText: label,labelStyle: Theme.of(context).textTheme.headline2
                          .copyWith(color: kPrimaryColor, fontSize: 15),
                    
        focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.red,
            )),
        errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 0.5, color: Colors.red)),
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 1, color: kOrangeColor)),
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
                BorderSide(width: 2, color: kOrangeColor)));

 /* boxShadow: [
          //background color of box
          BoxShadow(
            color: Colors.black12,
            blurRadius: 30.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              10.0, // Move to bottom 10 Vertically
            ),
          )
        ], */