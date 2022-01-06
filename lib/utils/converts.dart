import 'package:intl/intl.dart';

class Converters {
  int convertCelcius(double? temp) {
    return temp == null ? 0 : (temp - 273).round();
  }

  String convertDateTime(int dateTime) {
    return DateFormat('h:m a')
        .format(DateTime.fromMillisecondsSinceEpoch(dateTime * 1000));
  }

  String valueToStringTemp(dynamic value) {
    return value == null ? '' : (convertCelcius(value).toString() + '°');
  }

  String nullControl(String? value) {
    return value == null ? '' : value.toString().toUpperCase();
  }

  String currentDateTime() {
    return DateFormat('EEEE, d MMMM yyyy hh:mm').format(DateTime.now());
  }
}
