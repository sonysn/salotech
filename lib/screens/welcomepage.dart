import 'package:flutter/material.dart';
import 'package:salotech/screens/login.dart';
import 'package:salotech/screens/register.dart';
//The first screen of the application
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // SizedBox(height: 300,),
                //for logo
                const SizedBox(
                  height: 190,
                  child: Text(
                    'Logo',
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const Register();
                      }));
                    },
                    child: const SizedBox(
                      child: Center(child: Text('Get Started')),
                      width: 260,
                      height: 50,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[600],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                            bottom: Radius.circular(15),
                          ),
                        ))),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const Login();
                      }));
                    },
                    child: const SizedBox(
                      child: Center(child: Text('Login')),
                      width: 260,
                      height: 50,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[600],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                            bottom: Radius.circular(15),
                          ),
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
