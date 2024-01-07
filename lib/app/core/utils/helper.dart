import 'package:intl/intl.dart';

class Helper {
  static String formatDatetimeHHMM(DateTime time) {
    final formattedTime = DateFormat('HH:mm').format(time);

    return formattedTime;
  }

  static bool isTodayDate(DateTime date) {
    String actualDateFormatted =
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    String dataReceivedFormatted = DateFormat('yyyy-MM-dd').format(date);

    return actualDateFormatted == dataReceivedFormatted;
  }

  static bool isTomorrowDate(DateTime date) {
    String actualDateFormatted = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().add(const Duration(days: 1)));
    String dataReceivedFormatted = DateFormat('yyyy-MM-dd').format(date);

    return actualDateFormatted == dataReceivedFormatted;
  }
}
