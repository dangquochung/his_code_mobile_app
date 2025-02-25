import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static String dateTimeToDayMonthYear(BuildContext context) {
    DateTime now = DateTime.now();
    String locale = Localizations.localeOf(context).toString();
    String formattedDate = DateFormat.yMMMMd(locale).format(now);
    return formattedDate;
  }
}