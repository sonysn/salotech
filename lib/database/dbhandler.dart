import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'db_environment.dart';

Future<dynamic> signUp(
    fName, lName, phoneNumber, password, accountNo, String homeAddress) async {
  var url = Uri.parse('http://192.168.100.43:8080/signup');

  Map data = {
    'firstName': fName,
    'lastName': lName,
    'phoneNumber': phoneNumber,
    'password': password,
    'homeAddress': homeAddress,
    'accountNumber': accountNo
  };
  //encode map to json
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);

  final message = await jsonDecode(response.body);
  //get status code
  final statusCode = response.statusCode;

  print("${response.statusCode}");
  // print("${response.body}");
  return [message, statusCode] ;
}

Future<dynamic> signIn(accountNo, password) async {
  var url = Uri.parse('http://192.168.100.43:8080/signin');

  Map data = {'accountNumber': accountNo, 'password': password};

  //encode map to json
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);

  final message = await jsonDecode(response.body);
  final statusCode = response.statusCode;

  print("${response.statusCode}");
  // print("${response.body}");
  return [message, statusCode] ;
}

Future<dynamic> getTransactionSavingsData(userID) async {
  String t = '';
  //add query parameters
  var url = Uri.parse('http://192.168.100.43:8080/$userID/getsavings');

  final response = await http.get(url);
  final message = await jsonDecode(response.body);
  final messageLength = await message.length;
  // for (int i = 0; i < messageLength; i++) {}
  //print(message);
  return[message, messageLength];

}
