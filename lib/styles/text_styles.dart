import 'package:flutter/material.dart';
import 'package:flutter_getx_example/styles/colors.dart';
// import 'package:/google_fonts.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle onboardTitle = GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralGrey60);

  static TextStyle caption = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.neutralGrey80);

  static TextStyle caption2 = GoogleFonts.poppins(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.neutralGrey40);

  static TextStyle onboardSubTitle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.neutralGrey20);

  static TextStyle displayBig = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static TextStyle heading2 =
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle heading3 =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle heading4 =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle heading5 =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle heading6 =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700);

  static TextStyle bodyLarge =
      GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700);
  static TextStyle body = GoogleFonts.poppins(fontSize: 15, height: 1.4);
  static TextStyle bodySmall = GoogleFonts.poppins(fontSize: 12, height: 1.4);
  static TextStyle bodySmall2 = GoogleFonts.poppins(fontSize: 11, height: 1.2);

  static TextStyle buttonSmall = GoogleFonts.poppins(
      fontSize: 12, height: 1.4, fontWeight: FontWeight.w700);

  static TextStyle buttonMedium = GoogleFonts.poppins(
      fontSize: 19, height: 1.4, fontWeight: FontWeight.w600);

  static TextStyle subText = GoogleFonts.poppins(
    fontSize: 10,
  );
  static TextStyle displayText = GoogleFonts.poppins(
    fontSize: 14,
  );
}
