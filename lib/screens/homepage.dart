import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salotech/Widgets/custom_bottom_navigation.dart';
import 'package:salotech/Widgets/savings_card_dashboard.dart';
import 'package:salotech/functions/time.dart';

import '../database/dbhelper.dart';
//This is the very first page you see once you are past the login

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTimeString();
    //Defined in lib/functions/time.dart
    // dbController();
    // //TODO readDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //creates a blue a background colour
      backgroundColor: Colors.blue[200],
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.only(top: 35),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //from the time.dart file
                getTimeString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    //getTimeIcon(),//TODO
                    Icons.wb_sunny,
                    color: Colors.yellow,
                  )
                ],
              ),
              const SavingsCard(),
              Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 10),
                  child: const Text(
                    'Your Activity',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                width: 400,
                height: 430,
                child: ListView(
                  children: [
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.add_box_rounded,
                                color: Colors.blue,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit made(Action)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Date')
                                ],
                              ),
                              const Text(
                                'N5000',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Activity Card List
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      )),
                    ),
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.add_box_rounded,
                                color: Colors.blue,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit made(Action)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Date')
                                ],
                              ),
                              const Text(
                                'N5000',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Activity Card List
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      )),
                    ),
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.add_box_rounded,
                                color: Colors.blue,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit made(Action)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Date')
                                ],
                              ),
                              const Text(
                                'N5000',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Activity Card List
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      )),
                    ),
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.add_box_rounded,
                                color: Colors.blue,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit made(Action)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Date')
                                ],
                              ),
                              const Text(
                                'N5000',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Activity Card List
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      )),
                    ),
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.add_box_rounded,
                                color: Colors.blue,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit made(Action)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Date')
                                ],
                              ),
                              const Text(
                                'N5000',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Activity Card List
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      )),
                    ),
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.add_box_rounded,
                                color: Colors.blue,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Deposit made(Action)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Date')
                                ],
                              ),
                              const Text(
                                'N5000',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Activity Card List
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        //This here is a custom widget defined in custom_bottom_navigation.dart and the number in the brackets is a margin value
        CustomBottomNav(5)
      ]),
    );
  }
}
