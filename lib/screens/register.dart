import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

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
                  padding: const EdgeInsets.only(bottom: 150),
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
                    'Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: fullName,
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
                const SizedBox(height: 60),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
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
                const SizedBox(height: 60),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //       return const Register();
                        //     }));
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
                )
              ],
            ),
          ),
        ]));
  }
}
