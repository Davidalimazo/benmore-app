import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


bool isDateWithinPeriod(String startDateString, String endDateString) {
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
  final DateTime startDate = dateFormat.parse(startDateString);
  final DateTime endDate = dateFormat.parse(endDateString);

  final DateTime currentDate = DateTime.now();

  return currentDate.isAfter(startDate) && currentDate.isBefore(endDate);
}


String getYear(){
  final now = new DateTime.now();
  String formatter = DateFormat('yMd').format(now);// 28/03/2020
  return formatter.split("/")[2];
}

String getDate(String date){
  final now = DateTime.parse(date);
  String formatter =DateFormat.yMMMEd().format(now);
  return formatter;
}

enum SCHEME {
  tel, sms
}

openDialPad(String phoneNumber, SCHEME scheme) async {
  Uri url = Uri(scheme: scheme.name, path: phoneNumber);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print("Can't open dial pad.");
  }
}


extension StringExtensions on String {
  // Define the `capitalizeFirst` method as an extension on `String`
  String? capitalizeFirst() {
    if (isNull(this)) return null;
    if (isBlank(this)) return this;
    return this[0].toUpperCase() + this.substring(1).toLowerCase();
  }

  // Helper method to check if a string is null
  static bool isNull(String? s) => s == null;

  // Helper method to check if a string is blank
  static bool isBlank(String s) => s.trim().isEmpty;
}