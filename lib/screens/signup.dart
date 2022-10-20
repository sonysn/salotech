import 'package:flutter/material.dart';
import 'package:salotech/Widgets/snackbar.dart';
import 'package:salotech/database/dbhandler.dart';
import 'package:salotech/functions/stringcasing.dart';

//This is the register page
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //function to call signUp function and return a dynamic response
  void _serverResponse() async {
    //try and catch handling Connection Failed error
   try {
      final res = await signUp(
          firstname.text.toCapitalized(),
          lastname.text.toCapitalized(),
          phoneNumber.text,
          password.text,
          accountNumber.text.toUpperCase(),
          selectDropDown,
          homeAddress.text.toCapitalized());
      //use status code to display responses
      if (res[1] == 200){
        setState(() {
          responder = res[0]['message'];
        });
      }
      else {
        setState(() {
          responder = res[0]['error'];
        });
      }
      print(res);
      print(responder);
      //print("$responder + hellooo");
    }
    catch (e) {
     setState(() {
       responder = 'No Internet Connection';
     });
    }
  }

  //this function delays snack bar creation time while populating 'responder' from the server
  _displaySnackBarAfterServerResponse(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(responder));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //read from banks list data, extract names to bank list data names
 void _readBankList(){
   var banks = [];
    for (int i = 0; i < getBankListLength; i++){
      banks.add(bankListData[i]['name']);
    }
    setState(() {
      bankListDataNames = banks;
    });
 }

 void _serverGetResponseBankList() async {
    final res = await getBankList();
    setState(() {
      bankListData = res[0];
      getBankListLength = res[1];
    });
    _readBankList();
 }

  //Todo Text editing controller holds the user input for program execution, the names are self explanatory of what they do or hold
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  dynamic responder;
  int getBankListLength = 0;
  var bankListData = [];
  var bankListDataNames = [];
  List<DropdownMenuItem> bankList = [];
  dynamic selectDropDown;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _serverGetResponseBankList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 10),
                  child: Text("Required marked with *"),
                ),
                //firstname input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'First name *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: firstname,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Full Name',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                //lastname input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Last name *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: lastname,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Full Name',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                // const SizedBox(height: 60),
                // const SizedBox(height: 60),
                //phone number input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Phone Number *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: phoneNumber,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Phone Number',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                //password input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Password *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: password,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter your phone number as password',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                //account number input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Account Number *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: accountNumber,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter your account number',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Bank *',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: DropdownButtonFormField(
                    value: selectDropDown,
                    //map through this list
                    items: bankListDataNames.map((itemOne) {
                        return DropdownMenuItem(
                        value: itemOne,
                        child: Text(itemOne)
                        );
                    }).toList(),
                    isExpanded: true,
                    onChanged: (value){
                      selectDropDown = value;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Select Bank',
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
                //home address input
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Home Address',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.white),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        //TextField for name
                        TextField(
                          controller: homeAddress,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: 'Enter your account number',
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                //sign up button
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        _serverResponse();
                        _displaySnackBarAfterServerResponse(context);
                      },
                      child: const SizedBox(
                        child: Center(child: Text('Sign Up')),
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
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ]));
  }
}
