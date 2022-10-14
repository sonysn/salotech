import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

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

  //print(message['error']);
  print("${response.statusCode}");
  //print("${response.body}");
  return message;
}

Future<dynamic> signIn(accountNo, password) async {
  var url = Uri.parse('http://192.168.100.43:8080/signin');

  Map data = {'accountNumber': accountNo, 'password': password};

  //encode map to json
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);

  final message = await jsonDecode(response.body);

  print("${response.statusCode}");
  // print("${response.body}");
  return message;
}
