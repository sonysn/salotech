import 'package:flutter/material.dart';


//Returns a String based on the current time.
String getTimeString() {
  final now = DateTime.now();
  int hour = now.hour;
  String n = "";
  if ((hour >= 0) & (hour <= 11)) {
    n = "Good Morning,";
  } else if ((hour >= 12) & (hour <= 17)) {
    n = "Good Afternoon,";
  } else if ((hour >= 18) & (hour <= 23)) {
    n = "Good Evening,";
  }
  return n;
}

//Returns an Icon and Colour based on the current time, Used for the "Good morning" message and the icon beside it.
dynamic getTimeIconAndColour () {
  final now = DateTime.now();
  int hour = now.hour;
  IconData n = Icons.cloud;
  Color f = Colors.grey.shade300;
  if ((hour >= 0) & (hour <= 6)) {
      n = Icons.bedtime_rounded;
      f = Colors.grey.shade300;
  } else if ((hour >= 7) & (hour <= 18)) {
      n = Icons.wb_sunny;
      f = Colors.yellow;
  } else if ((hour >= 19) & (hour <= 23)) {
      n = Icons.bedtime_rounded;
      f = Colors.grey.shade300;
  }
  return [n, f];
}