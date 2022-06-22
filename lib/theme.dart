import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blueColor = const Color(0xff1890FF);
Color orangeColor = const Color(0xffFF9376);
Color blackColor = const Color(0xff000000);
Color whiteColor = const Color(0xffFFFFFF);
Color greyColor = const Color(0xff82868E);

double edge = 24;

TextStyle blackTextStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: blackColor);

TextStyle whiteTextStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: whiteColor);

TextStyle greyTextStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w300, color: greyColor);

TextStyle blueTextStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: blueColor);

TextStyle regularTextStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w400, color: blackColor);

ButtonStyle btnCategoriesActiveStyle = ElevatedButton.styleFrom(
  primary: blueColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
);

ButtonStyle btnCategoriesNonActiveStyle = ElevatedButton.styleFrom(
  primary: whiteColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
);
