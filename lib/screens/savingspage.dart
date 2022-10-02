import 'package:flutter/material.dart';
import 'package:salotech/Widgets/custom_bottom_navigation.dart';
import 'package:salotech/Widgets/save_popup.dart';
import 'package:salotech/Widgets/savings_card_dashboard.dart';

//This is the page that handles the saving deposit

class SavingsPage extends StatefulWidget {
  const SavingsPage({Key? key}) : super(key: key);

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
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
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    //TODO: will be a dynamic value later. it will be based on user input
                                    'Kindly Transfer,\nN50,000',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'Account to pay to:\t\t',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        '0123456789',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'Bank:\t\t\t\t',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        'First Bank',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'Name:\t\t',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        'SaLo FinTech',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                              bottom: Radius.circular(20),
                            ))),
                      ),
                      const SizedBox(
                        height: 70,
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
                                  return const SaveMoney();
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
                              child: const Center(child: Text('Save Now'))),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[600],
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                  bottom: Radius.circular(15),
                                ),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          ),
          //This here is a custom widget defined in custom_bottom_navigation.dart and the number in the brackets is a margin value
          CustomBottomNav(215),
        ],
      ),
    );
  }
}
