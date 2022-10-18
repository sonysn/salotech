library globals;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  //hold the icon property and icon colour for the time
  dynamic timeIcon, timeColour;
  int dataLength = 0;
  var data = [];

  //check if data is empty
  void _checkEmpty() {
    if(data.isEmpty){
      setState(() {
        globalAmountSaved = 0;
      });
    }
  }

  // calculate user savings
  Future _calculate() async {
    try {
      {
        await Future.delayed(const Duration(seconds: 1));
        //to calculate amount saved from savedTransactions list
        List f = [];
        double sums;

        //this for loop adds each item found in data to list f and converts them to a double
        for (int i = 0; i < dataLength; i++) {
          f.add(double.parse(data[i]['amount'].toString()));
        }
        //adds elements of list f array together
        sums = f.reduce((value, element) => value + element);
        print(sums);
        setState(() {
          //setting sum to have 2 decimal places
          globalAmountSaved = sums.toStringAsFixed(2);
        });

      }
    }
    catch(e){
      _load();
    }
  }

  //to get data from the getTransactionSavingsData(userID) from the db
  void _getData() async {
    try {
      {
        final res = await getTransactionSavingsData(globals.globalID);
        if (res[2] == 200) {
          setState(() {
            data = res[0];
            dataLength = res[1];
          });
        }
        else {
          setState(() {
            data = [];
            dataLength;
          });
        }
      }
    }
    catch(e){
      const snackBar = SnackBar(
          behavior: SnackBarBehavior.floating, content: Text('No Internet Connection!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //reload whole process all over
  Future _load() async {
    _getData();
    _calculate();
    _checkEmpty();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTimeString();
    _getData();
    _calculate();
    _checkEmpty();
    setState(() {
      timeIcon = getTimeIconAndColour()[0];
      timeColour = getTimeIconAndColour()[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //creates a blue a background colour
      backgroundColor: Colors.blue[200],
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(children: [
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
                    Icon(
                      //getTimeIcon(),//TODO
                      timeIcon,
                      color: timeColour,
                    )
                  ],
                ),
                SavingsCard(globalAmountSaved),
                Container(
                    margin: const EdgeInsets.only(top: 60, bottom: 10),
                    child: const Text(
                      'Your Activity',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )),
                SizedBox(
                    width: 400,
                    height: 430,
                    child: data.isNotEmpty
                    ? ListView.builder(
                        itemCount: dataLength,
                        itemBuilder: (context, index) {
                          return Card(
                            child: SizedBox(
                              height: 100,
                              width: 400,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.add_box_rounded,
                                      color: Colors.blue,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      // todo reverse '${data[dataLength - 1 - index]['amount']}',
                                      '${data[index]['amount']}',
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
                        })
                        : Column(
                          children: [
                            CircularProgressIndicator(
                              backgroundColor: Colors.deepPurple[100],
                              strokeWidth: 2.0,
                            ),
                            const Text('No Activity')
                          ],
                        ),
                )
              ],
            ),
          ),
          //This here is a custom widget defined in custom_bottom_navigation.dart and the number in the brackets is a margin value
          //CustomBottomNav(5)
        ]),
      ),
    );
  }
}
