import 'package:intl/intl.dart';

class DateTimeHelper {
  static bool isToday(DateTime dateTime) {
    final today = DateTime.now();
    return today.year == dateTime.year &&
        today.month == dateTime.month &&
        today.day == dateTime.day;
  }

  static bool isFuture(DateTime dateTime) {
    DateTime now = DateTime.now();

    if (dateTime.year > now.year) {
      return true;
    }
    if (dateTime.month > now.month) {
      return true;
    }
    if (dateTime.day > now.day) {
      return true;
    }
    return false;
  }

  static String formatToReadable(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
}
