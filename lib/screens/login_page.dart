import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourth_day/screens/home_page.dart';
import 'package:fourth_day/screens/sign_up.dart';
import 'package:fourth_day/screens/welcome_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  late UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
    } on PlatformException catch (e) {
      String message = "Please Check Internet Connection";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text(message.toString())));
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text(e.toString())));
      setState(() {
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);

  void validation() {
    if (email.text.isEmpty && password.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Both field are empty !")));
    } else if (email.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Email field is empty !")));
    } else if (!regExp.hasMatch(email.text)) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Email is not valid !")));
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


  final TextEditingController password = TextEditingController();
  Widget _buildAllTextFormFiledPlace() {
    return Column(
      children: [
        TextFormField(
          controller: email,
          cursorColor: Colors.red,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              hintText: "Email",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey,
              ))),
        ),
        SizedBox(
          height: 30,
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
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.white,
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey,
              ))),
        )
      ],
    );
  }


  Widget _buildButtonPart(){
    return isLoading == false
                  ? RaisedButton(
                      onPressed: () {
                        validation();
                      },
                      color:  Color(0xFF00BFA6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      resizeToAvoidBottomInset: false,
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Text(
                "Login In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _buildAllTextFormFiledPlace(),
            Container(
              width: 200,
              height: 60,
              child: _buildButtonPart(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have Account?  ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        color:  Color(0xFF00BFA6),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
