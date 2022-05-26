import 'package:flutter/material.dart';
import 'package:fourth_day/screens/home_page.dart';

class contact extends StatefulWidget {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();

  final TextEditingController message = TextEditingController();

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  void validation() {
    if (email.text.isEmpty && fullname.text.isEmpty && message.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("All fields are empty !")));
    } else if (fullname.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Full Name field is empty !")));
    } else if (email.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Email field is empty !")));
    } else if (!contact.regExp.hasMatch(email.text)) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("Email is not valid !")));
    } else if (message.text.isEmpty) {
      scaffold.currentState!
          .showSnackBar(SnackBar(content: Text("message field is empty !")));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3e6a89),
      resizeToAvoidBottomInset: false,
      key: scaffold,
      appBar: AppBar(
        
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "Contact",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: fullname,
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
                              borderSide: BorderSide(
                            color: Colors.grey,
                          ))),
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
                              borderSide: BorderSide(
                            color: Colors.grey,
                          ))),
                    ),
                    TextFormField(
                      controller: message,
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                          hintText: "Message",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                          ))),
                    ),
                    RaisedButton(
                      onPressed: () {
                        validation();
                      },
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
