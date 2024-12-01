import 'package:intl/intl.dart';

class FormatDate {
  FormatDate._();
  
  static String formatDayAndMonth(DateTime? date) {
    if (date != null) {
      final String formattedDate = DateFormat('EEE, d MMM', 'en_US').format(date);
      return formattedDate.split(' ').map((String word) {
        return word.substring(0, 1).toUpperCase() + word.substring(1);
      }).join(' ');
    }
    return '';
  }
}
