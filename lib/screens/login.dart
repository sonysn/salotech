import 'package:flutter/material.dart';
import 'package:salotech/database/dbhandler.dart';
import 'package:salotech/screens/homepage.dart';
//Ths is the login page

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //function to call signIn function and return a dynamic response
  void serverResponse() async{
    final res = await signIn(accountNumber.text.toUpperCase(), password.text.toUpperCase());
    print(res['error']);
  }

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
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //   return const HomePage();
                        // }));
                        serverResponse();
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
