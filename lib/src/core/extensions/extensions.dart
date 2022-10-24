
// ignore_for_file: unnecessary_this

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toExtensiveFormat() => DateFormat("MMMM d, y").format(this);
}