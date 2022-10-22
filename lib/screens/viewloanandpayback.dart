import 'package:flutter/material.dart';
import 'package:salotech/Widgets/payback_loan_popup.dart';
import 'package:salotech/database/dbhandler.dart';

class ViewLoanAndPayback extends StatefulWidget {
  String id, title, amount, description;
  var verified;

  ViewLoanAndPayback(
      {Key? key,
      required this.id,
      required this.title,
      required this.amount,
      required this.description,
      required this.verified})
      : super(key: key);

  @override
  State<ViewLoanAndPayback> createState() => _ViewLoanAndPaybackState();
}

class _ViewLoanAndPaybackState extends State<ViewLoanAndPayback> {
  void _getData() async {
    try {
      {
        final res = await getPaybackLoanTransaction(widget.id);
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

  Future _calculate() async {
      await Future.delayed(const Duration(seconds: 1));
      //to calculate amount saved from paybackTransactions list
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
        paybackAmount = sums;
      });
  }

  _calculate2() async{
    await Future.delayed(const Duration(seconds: 1));
    calculatedAmountLeft = double.parse(widget.amount) - paybackAmount;
  }

  Future _refresh() async {
    _getData();
    _calculate();
    _calculate2();
  }

  int dataLength = 0;
  var data = [];
  double paybackAmount = 0;
  double calculatedAmountLeft = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    _calculate();
    _calculate2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 35),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
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
                  Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(fontSize: 30),
                            ),
                            Row(
                              children: [
                                const Text('Amount: '),
                                Text(widget.amount)
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Verified: '),
                                Text(widget.verified.toString())
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Amount Left to pay back: '),
                                Text(calculatedAmountLeft.toString())
                              ],
                            ),
                            //Text(widget.id)
                          ],
                        )
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      ))),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                              //Modal bottom sheet controls the menu that shows up from the bottom of the screen TODO
                              isScrollControlled: true,
                              backgroundColor: Colors.blue[600],
                              context: context,
                              builder: (context) {
                                return PayBackLoanPopUp(id: widget.id);
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
                            child: const Center(child: Text('Payback Loan'))),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[600],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                                bottom: Radius.circular(15),
                              ),
                            ))),
                  ),
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
                                          Icons.add,
                                          color: Colors.blue,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${data[dataLength - 1 - index]['title']}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                '${data[dataLength - 1 - index]['creationDate']}')
                                          ],
                                        ),
                                        Text(
                                          '${data[dataLength - 1 - index]['amount']}',
                                          // todo print oldest to newest '${data[index]['amount']}',
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
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('No Activity'),
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
    );
  }
}
