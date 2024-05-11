import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class DateTimeUtils {
  String dateFormatter(DateTime date) {
    return formatter.format(date);
  }
}
