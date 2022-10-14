import 'package:flutter/material.dart';
import 'package:salotech/Widgets/snackbar.dart';
import 'package:salotech/database/dbhandler.dart';

//This is the register page
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //function to call signUp function and return a dynamic response
  void serverResponse() async{
    String ff;
    final res = await signUp(
        firstname.text.toUpperCase(),
        lastname.text.toUpperCase(),
        phoneNumber.text.toUpperCase(),
        password.text.toUpperCase(),
        accountNumber.text.toUpperCase(),
        homeAddress.text.toUpperCase());
    setState(() {
      responder = res['error'];
    });
    print(res['error']);
    print("$responder + hellooo");
  }

  //Todo Text editing controller holds the user input for program execution, the names are self explanatory of what they do or hold
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  String responder = "";

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
                  padding: const EdgeInsets.only(bottom: 20),
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
                  child: Text("Required marked with *"),
                ),
                //firstname input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'First name *',
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
                          controller: firstname,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Full Name',
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
                //lastname input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Last name *',
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
                          controller: lastname,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Full Name',
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
                // const SizedBox(height: 60),
                // const SizedBox(height: 60),
                //phone number input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Phone Number *',
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
                          controller: phoneNumber,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Phone Number',
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
                //password input
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
                //account number input
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
                //home address input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Home Address',
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
                          controller: homeAddress,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
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
                const SizedBox(height: 10),
                //sign up button
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        serverResponse();
                        final snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(responder));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const SizedBox(
                        child: Center(child: Text('Sign Up')),
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
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ]));
  }
}
