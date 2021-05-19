import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var font = GoogleFonts.montserrat;

TextTheme textTheme() {
  return TextTheme(
    headline1: font(color: Colors.white, fontWeight: FontWeight.w500),
    headline2: font(color: Colors.white, fontWeight: FontWeight.w300),
    caption: font(color: Colors.white),
  );
}
