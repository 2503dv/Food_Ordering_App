// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourth_day/screens/home_page.dart';
import 'package:fourth_day/screens/login_page.dart';
import 'package:fourth_day/screens/welcome_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);
  bool isLoading = false;
  late UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = "Please Check Internet Connection";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState!.showSnackBar(SnackBar(content: Text(message)));
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(authResult.user!.uid)
        .set({
      "UserName": fullName.text,
      "UserEmail": email.text,
      "UserId": authResult.user!.uid,
      "UserNumber": phoneNumber.text,
      "UserAddress": address.text,
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
    setState(() {
      isLoading = false;
    });
  }

  void validation() {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullName.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("All fields are empty !")));
    } else if (fullName.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Full Name field is empty !")));
    } else if (email.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Email field is empty !")));
    } else if (!regExp.hasMatch(email.text)) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Email is not valid !")));
    } else if (phoneNumber.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
          SnackBar(content: Text("Phone Number field is empty !")));
    } else if (phoneNumber.text.length >= 11 || phoneNumber.text.length < 10) {
      scaffold.currentState!.showSnackBar(
          SnackBar(content: Text("Phone Number Must Contain 10 digits !!")));
    } else if (address.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Address field is empty !")));
    } else if (password.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Password field is empty !")));
    } else if (password.text.length < 6) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Password is too short !")));
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  // final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: 600,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: fullName,
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      TextFormField(
                        controller: email,
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      TextFormField(
                        controller: phoneNumber,
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintText: "Phone no.",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      TextFormField(
                        controller: address,
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintText: "Address",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      TextFormField(
                        controller: password,
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()));
                        },
                        color: Colors.grey,
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 120,
                      child: isLoading == false
                          ? RaisedButton(
                              onPressed: () {
                                validation();
                              },
                              color: Color(0xFF00BFA6),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an Account ? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 18,
                            color:  Color(0xFF00BFA6),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
