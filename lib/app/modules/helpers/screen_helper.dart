import 'package:flutter/cupertino.dart';

class ScreenHelper {
  static double minTabletWidth = 550;

  static bool isTablet(BuildContext context) {
    return minTabletWidth <= screenWidth(context);
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenWidthPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  static double screenHeightPercentage(
      BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  static double screenStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
