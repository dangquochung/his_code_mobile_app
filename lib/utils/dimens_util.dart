import 'package:flutter/cupertino.dart';

class DimensUtil {
  static double getScreenHeight(BuildContext context) {
    return  MediaQuery.sizeOf(context).height;
  }

  static double getScreenWidth(BuildContext context) {
    return  MediaQuery.sizeOf(context).width;
  }

}