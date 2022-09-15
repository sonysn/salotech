import 'package:flutter/material.dart';
import 'package:salotech/screens/homepage.dart';
import 'package:salotech/screens/loanpage.dart';
import 'package:salotech/screens/savingspage.dart';

import '../screens/profilepage.dart';

class CustomBottomNav extends StatefulWidget {
  double marginValue;

  CustomBottomNav(this.marginValue, {Key? key}) : super(key: key);

  //Created a double called marginValue to manipulate the MARGIN of this widget as a positional argument

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.marginValue),
      //Here is the margin
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return HomePage();
              }));
            },
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return SavingsPage();
                  }));
                });
              },
              icon: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
              ),
              label: const Text(
                'Savings',
                style: TextStyle(color: Colors.white),
              )),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return LoanPage();
                  }));
                });
              },
              icon: const Icon(
                Icons.monetization_on,
                color: Colors.white,
              ),
              label: const Text(
                'Loan',
                style: TextStyle(color: Colors.white),
              )),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return ProfilePage();
                  }));
                });
              },
              icon: const Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              label: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
