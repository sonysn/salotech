import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salotech/Widgets/custom_bottom_navigation.dart';
import 'package:salotech/Widgets/payback_loan_popup.dart';
import 'package:salotech/Widgets/request_loan_popup.dart';
import 'package:salotech/Widgets/savings_card_dashboard.dart';
import 'package:salotech/database/dbhandler.dart';
import 'package:salotech/screens/homepage.dart';
import 'package:salotech/screens/signin.dart';
import 'package:salotech/screens/viewloanandpayback.dart';
//The request and payback loan page

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  // to get data from the getLoanRequestTransaction(userID) from the db
  void _getData() async {
    try {
      {
        final res = await getLoanRequestTransaction(globalID);
        if (res[2] == 200) {
          setState(() {
            data = res[0];
            dataLength = res[1];
          });
        } else {
          setState(() {
            data = [];
            dataLength;
          });
        }
      }
    } catch (e) {
      const snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('No Internet Connection!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future _refresh() async {
    _getData();
  }

  int dataLength = 0;
  var data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getLoanRequestTransaction(globalID);
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 35),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SavingsCard(globalAmountSaved),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: const Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  'Need some cash? Request for a loan now!',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20),
                              ))),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showModalBottomSheet(
                                  //Modal bottom sheet controls the menu that shows up from the bottom of the screen TODO
                                  isScrollControlled: true,
                                  backgroundColor: Colors.blue[600],
                                  context: context,
                                  builder: (context) {
                                    return const RequestLoanPopUp();
                                  },
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                );
                              });
                            },
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.7,
                                child:
                                    const Center(child: Text('Request Loan'))),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue[600],
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                    bottom: Radius.circular(15),
                                  ),
                                ))),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 400,
                          height: 430,
                          child: data.isNotEmpty
                              ? ListView.builder(
                                  itemCount: dataLength,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        print(data[index]['_id']);
                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return ViewLoanAndPayback(
                                              id: '${data[dataLength - 1 - index]['_id']}',
                                              title: '${data[dataLength - 1 - index]['title']}',
                                              amount:
                                                  '${data[dataLength - 1 - index]['amount']}',
                                              description:
                                                  '${data[dataLength - 1 - index]['description']}',
                                              verified: data[dataLength - 1 - index]['verified']);
                                        }));
                                      },
                                      child: Card(
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
                                                  Icons.remove,
                                                  color: Colors.red,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${data[index]['title']}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        '${data[index]['creationDate']}')
                                                  ],
                                                ),
                                                Text(
                                                  '${data[dataLength - 1 - index]['amount']}',
                                                  // todo print oldest to newest '${data[index]['amount']}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                    );
                                  })
                              : Column(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('No Activity',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    )
                                  ],
                                ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
