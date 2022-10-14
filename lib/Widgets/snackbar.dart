import 'package:flutter/material.dart';

//this function delays snackbar creation time while populating 'responder' from the server
// displaySnackBarAfterServerResponse(BuildContext context , message) async {
//   if (message != null) {
//     await Future.delayed(const Duration(seconds: 2));
//     final snackBar = SnackBar(
//         behavior: SnackBarBehavior.floating,
//         content: Text(message));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//   else {
//     throw Exception('message is null');
//   }
//
// }