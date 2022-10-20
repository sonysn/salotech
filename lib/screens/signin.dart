library globals;

import 'package:flutter/material.dart';
import 'package:salotech/database/dbhandler.dart';
import 'package:salotech/screens/bottom_nav.dart';
import 'package:salotech/screens/homepage.dart';
//Ths is the login page

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

//set in global variables
String globalName = '';
dynamic globalID;

class _LoginState extends State<Login> {
  //function to call signIn function and return a dynamic(any data type) response
  void _serverResponse() async {
    //try and catch handling Connection Failed error
    try {
      final res = await signIn(
          accountNumber.text, password.text);
      //use status code to display responses
      if (res[1] == 200) {
        //print(res[0]['token']);
        setState(() {
          isLoggedIn = true;
          data = res[0];
          loginMessage = res[0]['message'];
        });
        //print(data['token']);
      } else {
        //print(res[0]['error']);
        setState(() {
          isLoggedIn = false;
          data = res[0]['error'];
          loginMessage = data;
        });
      }
      //print(res);
      print(isLoggedIn);
      print(data);
    } catch (e) {
      setState(() {
        loginMessage = 'No Internet Connection';
      });
    }
  }

  //makes sure user is logged in before navigation to next screen
  void _nav() async {
    await Future.delayed(const Duration(seconds: 1));
    if (isLoggedIn) {
      setState(() {
        globalName = data['user']['firstName'];
        globalID = data['user']['_id'];
      });
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const BottomNavPage();
      }));
    }
  }

  //this function delays snack bar creation time while populating 'loginMessage' from the server
  _displaySnackBarAfterServerResponse(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating, content: Text(loginMessage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  dynamic data;

  //String tokenData = "";
  bool isLoggedIn = false;
  String loginMessage = "";
  TextEditingController password = TextEditingController();
  TextEditingController accountNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 12, bottom: 10),
                    child: Text("Required marked with *")),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Account Number *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: accountNumber,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter your account number',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Password *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: password,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter your phone number as password',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        _serverResponse();
                        _displaySnackBarAfterServerResponse(context);
                        _nav();
                      },
                      child: const SizedBox(
                        child: Center(child: Text('Login')),
                        width: 260,
                        height: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[600],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                              bottom: Radius.circular(15),
                            ),
                          ))),
                )
              ],
            ),
          ),
        ]));
  }
}
