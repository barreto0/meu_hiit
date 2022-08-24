import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_hiit/app/modules/helpers/screen_helper.dart';

import 'color_helper.dart';

class TextStyleHelper {
  static TextStyle buttonLabel(BuildContext context) {
    return GoogleFonts.inter(
      color: ColorHelper.lightGray(),
      fontWeight: FontWeight.w700,
      fontSize: ScreenHelper.screenHeightPercentage(context, 3),
    );
  }

  static TextStyle configureExercise(BuildContext context) {
    return GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: ScreenHelper.screenHeightPercentage(context, 3),
    );
  }

  static TextStyle configureExerciseItemText(BuildContext context) {
    return GoogleFonts.inter(
      color: ColorHelper.lightGray(),
      fontWeight: FontWeight.w700,
      fontSize: ScreenHelper.screenHeightPercentage(context, 3),
    );
  }

  static TextStyle roundAndCycleText(BuildContext context) {
    return GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: ScreenHelper.screenHeightPercentage(context, 3.5),
    );
  }

  static TextStyle exercisePhraseIDLE(BuildContext context) {
    return GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: ScreenHelper.screenHeightPercentage(context, 7),
    );
  }

  static TextStyle exerciseClockTextIDLE(BuildContext context) {
    return GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: ScreenHelper.screenHeightPercentage(context, 10),
    );
  }
}
