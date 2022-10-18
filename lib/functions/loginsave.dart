import 'package:shared_preferences/shared_preferences.dart';

Future saveLoginDetails(Accountnumber, Password) async {
  //dynamic Accountnumber, Password;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('accountNumber', Accountnumber);
  await prefs.setString('password', Password);
  print(prefs.getString('accountNumber'));
}

Future<dynamic> readLoginDetails() async {
  final prefs = await SharedPreferences.getInstance();
  final savedAccountNumber = prefs.getString('accountNumber') ?? 0;
  final savedPassword = prefs.getString('password') ?? 0;
  print('save password is $savedPassword');
  print(savedAccountNumber);
  return [savedAccountNumber, savedPassword];
}

Future deleteLoginData() async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('accountNumber');
  await prefs.remove('password');
}