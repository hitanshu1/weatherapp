import 'package:jiffy/jiffy.dart';
/// extension use for DateTime
extension FormatDateTime on DateTime {
  ///Returns the date object from the given Json data
  String get dateTime =>
      Jiffy.parseFromDateTime(this).format(pattern: 'yMMMMd');
}
/// extension use for DateTime
extension DayOfWeek on DateTime {
  ///Returns the date object from the given Json data
  String get dayOfWeek => Jiffy.parseFromDateTime(this).format(pattern: 'EEEE');
}
