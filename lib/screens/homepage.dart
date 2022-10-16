library globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:salotech/Widgets/custom_bottom_navigation.dart';
import 'package:salotech/Widgets/savings_card_dashboard.dart';
import 'package:salotech/functions/time.dart';
import 'signin.dart' as globals;

import '../database/dbhandler.dart';
//This is the very first page you see once you are past the login

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

dynamic globalAmountSaved;

class _HomePageState extends State<HomePage> {
  dynamic amountSaved;
  void _calculate() {
    //to calculate amount saved from savedTransactions list
    List f = [];
    int sums;

    for (int i = 0; i < globals.globalSaveTransactionsListValue; i++) {
      f.add(globals.globalSaveTransactions[i]['amount']);
    }
    //adds elements of array together
    sums = f.reduce((value, element) => value + element);
   print(sums);
   setState(() {
     amountSaved = sums;
     globalAmountSaved = sums.toString();
   });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTimeString();
    _calculate();
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: Text(
                      globals.globalName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(
                    //getTimeIcon(),//TODO
                    Icons.wb_sunny,
                    color: Colors.yellow,
                  )
                ],
              ),
              SavingsCard(amountSaved.toString()),
              Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 10),
                  child: const Text(
                    'Your Activity',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                  width: 400,
                  height: 430,
                  child: ListView.builder(
                    itemCount: globals.globalSaveTransactionsListValue,
                    itemBuilder: (context, index) {
                    return Card(
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
                              Text(
                                '${globals.globalSaveTransactions[index]['amount']}',
                                style: const TextStyle(
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
                    );
                  }))
            ],
          ),
        ),
        //This here is a custom widget defined in custom_bottom_navigation.dart and the number in the brackets is a margin value
        //CustomBottomNav(5)
      ]),
    );
  }
}
