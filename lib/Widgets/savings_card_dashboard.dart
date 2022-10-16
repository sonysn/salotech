import 'package:flutter/material.dart';

class SavingsCard extends StatefulWidget {
  dynamic amountsaved;
  SavingsCard(this.amountsaved, {Key? key}) : super(key: key);

  @override
  State<SavingsCard> createState() => _SavingsCardState();
}

class _SavingsCardState extends State<SavingsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Card(
        color: Colors.blue[600],
        child: SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Container(
                margin: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Your Savings',
                        style: TextStyle(color: Colors.white)),
                    Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Text(
                          'N ${widget.amountsaved}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
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
    );
  }
}
