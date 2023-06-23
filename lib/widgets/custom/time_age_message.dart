import 'package:timeago_flutter/timeago_flutter.dart';

// class CustomMessages implements EnMessages {
//   @override
//   String prefixAgo() => '';

//   @override
//   String suffixAgo() => 'ago';

//   @override
//   String wordSeparator() => ' ';

//   @override
//   String aDay(int hours) {
//     "$hours hours";
//     throw UnimplementedError();
//   }

//   @override
//   String aboutAMinute(int minutes) {
//     "$minutes min";
//     throw UnimplementedError();
//   }

//   @override
//   String aboutAMonth(int days) {
//     "$days days";
//     throw UnimplementedError();
//   }

//   @override
//   String aboutAYear(int year) {
//     "$year year";
//     throw UnimplementedError();
//   }

//   @override
//   String aboutAnHour(int minutes) {
//     "$minutes min";
//     throw UnimplementedError();
//   }

//   @override
//   String days(int days) {
//     "$days days";
//     throw UnimplementedError();
//   }

//   @override
//   String hours(int hours) {
//     "$hours hours";
//     throw UnimplementedError();
//   }

//   @override
//   String lessThanOneMinute(int seconds) {
//     "$seconds sec";
//     throw UnimplementedError();
//   }

//   @override
//   String minutes(int minutes) {
//     "$minutes min";
//     throw UnimplementedError();
//   }

//   @override
//   String months(int months) {
//     "$months months";
//     throw UnimplementedError();
//   }

//   @override
//   String prefixFromNow() {
//     "";
//     throw UnimplementedError();
//   }

//   @override
//   String suffixFromNow() {
//     "ago";
//     throw UnimplementedError();
//   }

//   @override
//   String years(int years) {
//     "$years years";
//     throw UnimplementedError();
//   }
// }

class MyCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'ago';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '$minutes minutes';
  @override
  String minutes(int minutes) => '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => '$minutes minutes';
  @override
  String hours(int hours) => '$hours hours';
  @override
  String aDay(int hours) => '$hours hours';
  @override
  String days(int days) => '$days days';
  @override
  String aboutAMonth(int days) => '$days days';
  @override
  String months(int months) => '$months months';
  @override
  String aboutAYear(int year) => '$year year';
  @override
  String years(int years) => '$years years';
  @override
  String wordSeparator() => ' ';
}
