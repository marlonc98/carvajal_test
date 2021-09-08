import 'package:intl/intl.dart';

class DatesFormat {
  static String dateToMicroString(DateTime? date){
    return date != null ? "Sin fecha" : DateFormat('dd/MM/yyyy').format(date!);
  }
}