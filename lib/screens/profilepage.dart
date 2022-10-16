import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:salotech/Widgets/contact_support_popup.dart';
import 'package:salotech/Widgets/savings_card_dashboard.dart';
import 'package:salotech/Widgets/custom_bottom_navigation.dart';
import 'package:salotech/screens/homepage.dart';

//This is where the user profile page us found

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Profile',
                  style: TextStyle(fontSize: 20),
                ),
                SavingsCard(globalAmountSaved,),
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: const Card(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: ListTile(
                                    leading: Icon(Icons.seventeen_mp_sharp),
                                    title: Text(
                                      'Transaction history',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                  ),
                                )),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                              bottom: Radius.circular(20),
                            ))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            showModalBottomSheet(
                              //Modal bottom sheet controls the menu that shows up from the bottom of the screen TODO
                              isScrollControlled: true,
                              backgroundColor: Colors.blue[600],
                              context: context,
                              builder: (context) {
                                return const ContactSupport();
                              },
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                            );
                          });
                        },
                        child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: const Card(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: ListTile(
                                      leading: Icon(Icons.headset_mic_rounded),
                                      title: Text(
                                        'Contact Support',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_rounded),
                                    ),
                                  )),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20),
                              ))),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: const Center(child: Text('Logout'))),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                              bottom: Radius.circular(15),
                            ),
                          ))),
                ),
              ],
            ),
          ),
          //This here is a custom widget defined in custom_bottom_navigation.dart and the number in the brackets is a margin value
          CustomBottomNav(105)
        ],
      ),
    );
  }
}
