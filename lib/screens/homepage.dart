import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salotech/Widgets/custombuttomnavigation.dart';
import 'package:salotech/functions/time.dart';

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
    getTime();
    //Defined in lib/functions/time.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.only(top: 35),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTime(),
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
                    Icons.wb_sunny,
                    color: Colors.yellow,
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Card(
                  color: Colors.blue[600],
                  child: SizedBox(
                      height: 120,
                      width: 400,
                      child: Container(
                          margin: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Your Savings',
                                  style: TextStyle(color: Colors.white)),
                              Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: const Text(
                                    'Amount saved',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ))
                            ],
                          ))),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                    bottom: Radius.circular(20),
                  )),
                ),
              ),
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
        const CustomBottomNav() // From Widgets
      ]),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.blue[200],
      //     selectedItemColor: Colors.blue[600],
      //     elevation: 20,
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.account_balance_wallet_rounded),
      //           label: "Savings"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.monetization_on), label: "Loan"),
      //       // BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile")
      //     ]),
    );
  }
}
