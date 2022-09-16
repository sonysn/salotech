import 'package:flutter/material.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({Key? key}) : super(key: key);

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        padding:
            const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: SizedBox(
                    height: 7,
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                )),
                Container(
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child: const Text(
                      'Contact Support',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Have an issue? you can chat with an agent online or reach us via the number/email below',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Card(
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: ListTile(
                              leading: Icon(Icons.message_rounded),
                              title: Text(
                                'Chat with an agent',
                                style: TextStyle(fontSize: 20),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          )),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ))),
                const SizedBox(
                  height: 10,
                ),
                Card(
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: ListTile(
                              leading: Icon(Icons.phone),
                              title: Text(
                                '0812345676',
                                style: TextStyle(fontSize: 20),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          )),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                          bottom: Radius.circular(30),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                Card(
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: ListTile(
                              leading: Icon(Icons.mail_rounded),
                              title: Text(
                                'support@salo.ng',
                                style: TextStyle(fontSize: 20),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          )),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                          bottom: Radius.circular(30),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
