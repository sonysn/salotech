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

//Returns an Icon based on the current time, Used for the "Good morning" message and the icon beside it.
IconData getTimeIcon() {
  final now = DateTime.now();
  int hour = now.hour;
  IconData i = "" as IconData;
  if ((hour >= 0) & (hour <= 11)) {
    i = "Icons.wb_sunny" as IconData;
  }
  // else if ((hour >= 12) & (hour <= 17)) {
  //   i = "Good Afternoon,";
  // }
  // else if ((hour >= 18) & (hour <= 23)) {
  //   i = "Good Evening,";
  // }
  return i;
}
