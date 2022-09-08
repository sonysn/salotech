String getTime() {
  final now = DateTime.now();
  int hour = now.hour;
  String n = "";
  if ((hour >= 0) & (hour <= 11)) {
    n = "Good Morning,";
  }
  else if ((hour >= 12) & (hour <= 17)) {
    n = "Good Afternoon,";
  }
  else if ((hour >= 18) & (hour <= 23)) {
    n = "Good Evening,";
  }
  return n;
}