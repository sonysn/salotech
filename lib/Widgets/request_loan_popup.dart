import 'package:flutter/material.dart';

class RequestLoanPopUp extends StatefulWidget {
  const RequestLoanPopUp({Key? key}) : super(key: key);

  @override
  State<RequestLoanPopUp> createState() => _RequestLoanPopUpState();
}

class _RequestLoanPopUpState extends State<RequestLoanPopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.15,
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
                      'Loan Money',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Enter the amount you wish to loan and fill in your details accurately',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Text(
                  'Amount',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const TextField(
                    //controller: phoneNumber,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter Amount (e.g N5000)',
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const TextField(
                    //controller: phoneNumber,
                    maxLines: 4,
                    maxLength: 120,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Reason For the loan?',
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Center(child: Text('Submit Request')),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[200],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                              bottom: Radius.circular(15),
                            ),
                          ))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
