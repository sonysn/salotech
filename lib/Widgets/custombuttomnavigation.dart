import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
            ),
            label: const Text(
              'Savings',
              style: TextStyle(color: Colors.white),
            )),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.monetization_on,
              color: Colors.white,
            ),
            label: const Text(
              'Loan',
              style: TextStyle(color: Colors.white),
            )),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            label: const Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
