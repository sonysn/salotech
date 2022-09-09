import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salotech/Widgets/custom_bottom_navigation.dart';
import 'package:salotech/Widgets/payback_loan_popup.dart';
import 'package:salotech/Widgets/savings_card.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 35),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SavingsCard(),
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 200,
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
                      const SizedBox(
                        height: 70,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.7,
                              child: const Center(child: Text('Request Loan'))),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[600],
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                  bottom: Radius.circular(15),
                                ),
                              ))),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showModalBottomSheet(
                                //Modal bottom sheet controls the menu that shows up from the bottom of the screen
                                isScrollControlled: true,
                                backgroundColor: Colors.blue[600],
                                context: context,
                                builder: (context) {
                                  return const PayBackLoanPopUp();
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
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomBottomNav(115),
        ],
      ),
    );
  }
}
