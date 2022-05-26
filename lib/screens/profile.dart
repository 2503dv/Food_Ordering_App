import 'dart:ffi';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourth_day/screens/home_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEdit = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = new RegExp(p);
  late File image;

  var ImagePicker;
  Future getImage({required ImageSource imageSource}) async {
    PickedFile pickedFile = await ImagePicker().getImage(Source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
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
    } else {}
  }

  Future myDialogueBox() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
           content:  SingleChildScrollView(
                child: ListBody(
                  children: [
                    ListTile(
                      leading: Icon(Icons.camera),
                      title: Text("Camera"),
                      onTap: () {
                        getImage(imageSource: ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.album),
                      title: Text("Gallery"),
                      onTap: () {
                        getImage(imageSource: ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
          );
        });
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  Widget _buildAllTextFormField() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextFormField(
                controller: fullName,
                cursorColor: Colors.red,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    hintText: "Full Name",
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    fillColor: Color(0xfffeeaf4),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextFormField(
                controller: email,
                cursorColor: Colors.red,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    hintText: "Email",
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextFormField(
                controller: phoneNumber,
                cursorColor: Colors.red,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    hintText: "Phone no.",
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextFormField(
                controller: address,
                cursorColor: Colors.red,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    hintText: "Address",
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextFormField(
                controller: password,
                cursorColor: Colors.red,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    hintText: "Password",
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                onPressed: () {
                  validation();
                },
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSingleContainer({required String name}) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color:  Colors.blue[100], borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 10),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        elevation: 0.0,
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
              child: Text(
                isEdit == false ? "Edit" : "Close",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 75,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: AssetImage("images/img1.png"),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.white,
                    child: isEdit == false
                        ? Column(
                            children: [
                              _buildSingleContainer(name: "Dhruvi Mahyavanshi"),
                              _buildSingleContainer(name: "dhruvi12@gmail.com"),
                              _buildSingleContainer(name: "1234567890"),
                              _buildSingleContainer(name: "vapi"),
                              // _buildSingleContainer(name: "mamta chauhan"),
                            ],
                          )
                        : _buildAllTextFormField(),
                  ),
                )
              ],
            ),
            isEdit != false
                ? Positioned(
                    top: 180,
                    left: 240,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 20,
                        child: IconButton(
                          onPressed: () {
                            // getImage();
                            myDialogueBox();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        )),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
