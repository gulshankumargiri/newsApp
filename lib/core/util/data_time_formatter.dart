import 'package:intl/intl.dart';

String FormateDateBydmmyyyy(DateTime datetime){
  return DateFormat('dd-MM-yyyy, hh:mm a').format(datetime);
}