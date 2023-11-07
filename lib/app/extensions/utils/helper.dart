import 'package:intl/intl.dart';

class Helper {
  static String formatDatetimeHHMM(DateTime time) {
    final formattedTime = DateFormat('HH:mm').format(time);

    return formattedTime;
  }
}
