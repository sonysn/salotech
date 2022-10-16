import 'package:flutter/material.dart';
import 'package:salotech/screens/homepage.dart';
import 'package:salotech/screens/loanpage.dart';
import 'package:salotech/screens/profilepage.dart';
import 'package:salotech/screens/savingspage.dart';

class BottomNavPage extends StatefulWidget {
  final String firstname, accountNumber;

  const BottomNavPage(
      {Key? key, required this.firstname, required this.accountNumber})
      : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;
  static const List<Widget> _childrenPages = <Widget>[
    HomePage(),
    SavingsPage(),
    LoanPage(),
    ProfilePage()
  ];

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _childrenPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        backgroundColor: Colors.blue[200],
        selectedItemColor: Colors.blue[600],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //type allows you have more than 1 item in bottom navigator
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Savings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Loan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}
